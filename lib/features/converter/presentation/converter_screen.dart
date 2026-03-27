import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme_mode_controller.dart';
import '../domain/conversion_category.dart';
import '../domain/conversion_record.dart';
import '../domain/unit_catalog.dart';
import 'converter_controller.dart';

class ConverterScreen extends ConsumerStatefulWidget {
  const ConverterScreen({super.key});

  @override
  ConsumerState<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends ConsumerState<ConverterScreen> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;
  bool _isHistoryExpanded = true;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_handleFocusChange)
      ..dispose();
    _textController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      ref.read(converterControllerProvider.notifier).saveCurrentConversion();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(converterControllerProvider);
    final controller = ref.read(converterControllerProvider.notifier);
    final themeMode = ref.watch(themeModeControllerProvider);
    final themeController = ref.read(themeModeControllerProvider.notifier);
    final units = UnitCatalog.unitsFor(state.selectedCategory);
    final theme = Theme.of(context);

    if (_textController.text != state.inputText) {
      _textController.value = TextEditingValue(
        text: state.inputText,
        selection: TextSelection.collapsed(offset: state.inputText.length),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        actions: [
          IconButton(
            tooltip: themeMode == ThemeMode.light
                ? 'Switch to dark mode'
                : 'Switch to light mode',
            onPressed: () {
              themeController.setThemeMode(
                themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
              );
            },
            icon: Icon(
              themeMode == ThemeMode.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeroCard(
                resultText: state.resultText,
                onCopy: state.hasValidResult
                    ? () async {
                        await Clipboard.setData(
                          ClipboardData(text: state.resultText),
                        );
                        await controller.saveCurrentConversion();
                        if (!context.mounted) {
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Result copied to clipboard'),
                          ),
                        );
                      }
                    : null,
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Offline conversion for common daily units.',
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final category in ConversionCategory.values)
                            ChoiceChip(
                              label: Text(category.label),
                              selected: state.selectedCategory == category,
                              onSelected: (_) =>
                                  controller.selectCategory(category),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _textController,
                        focusNode: _focusNode,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Value',
                          hintText: 'e.g. 12.5',
                          suffixIcon: state.inputText.isEmpty
                              ? null
                              : IconButton(
                                  tooltip: 'Clear input',
                                  onPressed: controller.clearInput,
                                  icon: const Icon(Icons.close),
                                ),
                        ),
                        onChanged: controller.updateInput,
                        onSubmitted: (_) => controller.saveCurrentConversion(),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        initialValue: state.fromUnit.key,
                        decoration: const InputDecoration(labelText: 'From'),
                        items: [
                          for (final unit in units)
                            DropdownMenuItem<String>(
                              value: unit.key,
                              child: Text('${unit.label} (${unit.symbol})'),
                            ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            controller.updateFromUnit(value);
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: FilledButton.tonalIcon(
                          onPressed: controller.swapUnits,
                          icon: const Icon(Icons.swap_vert),
                          label: const Text('Swap units'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        initialValue: state.toUnit.key,
                        decoration: const InputDecoration(labelText: 'To'),
                        items: [
                          for (final unit in units)
                            DropdownMenuItem<String>(
                              value: unit.key,
                              child: Text('${unit.label} (${unit.symbol})'),
                            ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            controller.updateToUnit(value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          _isHistoryExpanded = !_isHistoryExpanded;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Recent conversions',
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                            Icon(
                              _isHistoryExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state.history.isNotEmpty)
                    IconButton(
                      tooltip: 'Delete history',
                      onPressed: () async {
                        final shouldClear = await showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Delete history?'),
                              content: const Text(
                                'This removes all saved recent conversions from this device.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text('Cancel'),
                                ),
                                FilledButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );

                        if (shouldClear == true) {
                          await controller.clearHistory();
                          if (!context.mounted) {
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Recent history deleted'),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              if (!_isHistoryExpanded)
                const SizedBox.shrink()
              else if (state.history.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'No recent conversions yet. Convert a value and it will appear here.',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                )
              else
                ...state.history.map(
                  (record) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _HistoryTile(
                      record: record,
                      onTap: () => controller.restoreHistory(record),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.resultText, this.onCopy});

  final String resultText;
  final VoidCallback? onCopy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.tertiaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Result', style: theme.textTheme.titleMedium),
              ),
              IconButton(
                tooltip: 'Copy result',
                onPressed: onCopy,
                icon: const Icon(Icons.copy_rounded),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            resultText,
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.record, required this.onTap});

  final ConversionRecord record;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fromUnit = UnitCatalog.findUnit(record.category, record.fromUnitKey);
    final toUnit = UnitCatalog.findUnit(record.category, record.toUnitKey);
    final time = TimeOfDay.fromDateTime(record.createdAt).format(context);

    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          '${record.inputText} ${fromUnit.symbol} -> ${record.resultText} ${toUnit.symbol}',
        ),
        subtitle: Text('${record.category.label} • $time'),
        trailing: const Icon(Icons.history),
      ),
    );
  }
}
