import 'unit_definition.dart';

class ConversionEngine {
  const ConversionEngine();

  double convert({
    required double value,
    required UnitDefinition fromUnit,
    required UnitDefinition toUnit,
  }) {
    final baseValue = fromUnit.toBase(value);
    return toUnit.fromBase(baseValue);
  }
}
