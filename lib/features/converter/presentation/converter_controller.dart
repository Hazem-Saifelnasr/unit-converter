import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/shared_preferences_provider.dart';
import '../../../core/utils/number_formatter.dart';
import '../data/conversion_history_repository.dart';
import '../data/shared_preferences_history_repository.dart';
import '../domain/conversion_category.dart';
import '../domain/conversion_engine.dart';
import '../domain/conversion_record.dart';
import '../domain/unit_catalog.dart';
import 'converter_state.dart';

final historyRepositoryProvider = Provider<ConversionHistoryRepository>((ref) {
  return SharedPreferencesHistoryRepository(
    ref.watch(sharedPreferencesProvider),
  );
});

final converterControllerProvider =
    NotifierProvider<ConverterController, ConverterState>(
      ConverterController.new,
    );

class ConverterController extends Notifier<ConverterState> {
  final ConversionEngine _engine = const ConversionEngine();

  @override
  ConverterState build() {
    final category = ConversionCategory.length;
    return ConverterState(
      selectedCategory: category,
      fromUnit: UnitCatalog.defaultFromUnit(category),
      toUnit: UnitCatalog.defaultToUnit(category),
      inputText: '',
      resultText: 'Enter a value to convert',
      hasValidResult: false,
      history: ref.read(historyRepositoryProvider).loadHistory(),
    );
  }

  void selectCategory(ConversionCategory category) {
    final nextState = state.copyWith(
      selectedCategory: category,
      fromUnit: UnitCatalog.defaultFromUnit(category),
      toUnit: UnitCatalog.defaultToUnit(category),
    );
    state = _recalculate(nextState);
  }

  void updateFromUnit(String unitKey) {
    final unit = UnitCatalog.findUnit(state.selectedCategory, unitKey);
    state = _recalculate(state.copyWith(fromUnit: unit));
  }

  void updateToUnit(String unitKey) {
    final unit = UnitCatalog.findUnit(state.selectedCategory, unitKey);
    state = _recalculate(state.copyWith(toUnit: unit));
  }

  void updateInput(String input) {
    state = _recalculate(state.copyWith(inputText: input));
  }

  void swapUnits() {
    state = _recalculate(
      state.copyWith(fromUnit: state.toUnit, toUnit: state.fromUnit),
    );
  }

  void clearInput() {
    state = state.copyWith(
      inputText: '',
      resultText: 'Enter a value to convert',
      hasValidResult: false,
    );
  }

  Future<void> saveCurrentConversion() async {
    if (!state.hasValidResult) {
      return;
    }

    final record = ConversionRecord(
      category: state.selectedCategory,
      fromUnitKey: state.fromUnit.key,
      toUnitKey: state.toUnit.key,
      inputText: state.inputText.trim(),
      resultText: state.resultText,
      createdAt: DateTime.now(),
    );

    final repository = ref.read(historyRepositoryProvider);
    await repository.saveRecord(record);
    state = state.copyWith(history: repository.loadHistory());
  }

  Future<void> clearHistory() async {
    final repository = ref.read(historyRepositoryProvider);
    await repository.clearHistory();
    state = state.copyWith(history: <ConversionRecord>[]);
  }

  void restoreHistory(ConversionRecord record) {
    final nextState = state.copyWith(
      selectedCategory: record.category,
      fromUnit: UnitCatalog.findUnit(record.category, record.fromUnitKey),
      toUnit: UnitCatalog.findUnit(record.category, record.toUnitKey),
      inputText: record.inputText,
    );

    state = _recalculate(nextState);
  }

  ConverterState _recalculate(ConverterState nextState) {
    final input = nextState.inputText.trim().replaceAll(',', '.');

    if (input.isEmpty) {
      return nextState.copyWith(
        resultText: 'Enter a value to convert',
        hasValidResult: false,
      );
    }

    final value = double.tryParse(input);
    if (value == null) {
      return nextState.copyWith(
        resultText: 'Enter a valid number',
        hasValidResult: false,
      );
    }

    final result = _engine.convert(
      value: value,
      fromUnit: nextState.fromUnit,
      toUnit: nextState.toUnit,
    );

    return nextState.copyWith(
      resultText: formatNumber(result),
      hasValidResult: true,
    );
  }
}
