import '../domain/conversion_category.dart';
import '../domain/conversion_record.dart';
import '../domain/unit_definition.dart';

class ConverterState {
  const ConverterState({
    required this.selectedCategory,
    required this.fromUnit,
    required this.toUnit,
    required this.inputText,
    required this.resultText,
    required this.hasValidResult,
    required this.history,
  });

  final ConversionCategory selectedCategory;
  final UnitDefinition fromUnit;
  final UnitDefinition toUnit;
  final String inputText;
  final String resultText;
  final bool hasValidResult;
  final List<ConversionRecord> history;

  ConverterState copyWith({
    ConversionCategory? selectedCategory,
    UnitDefinition? fromUnit,
    UnitDefinition? toUnit,
    String? inputText,
    String? resultText,
    bool? hasValidResult,
    List<ConversionRecord>? history,
  }) {
    return ConverterState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      fromUnit: fromUnit ?? this.fromUnit,
      toUnit: toUnit ?? this.toUnit,
      inputText: inputText ?? this.inputText,
      resultText: resultText ?? this.resultText,
      hasValidResult: hasValidResult ?? this.hasValidResult,
      history: history ?? this.history,
    );
  }
}
