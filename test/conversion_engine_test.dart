import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter/core/utils/number_formatter.dart';
import 'package:unit_converter/features/converter/domain/conversion_category.dart';
import 'package:unit_converter/features/converter/domain/conversion_engine.dart';
import 'package:unit_converter/features/converter/domain/unit_catalog.dart';

void main() {
  const engine = ConversionEngine();

  test('converts meters to feet accurately', () {
    final result = engine.convert(
      value: 1,
      fromUnit: UnitCatalog.findUnit(ConversionCategory.length, 'meter'),
      toUnit: UnitCatalog.findUnit(ConversionCategory.length, 'foot'),
    );

    expect(result, closeTo(3.28084, 0.00001));
  });

  test('converts celsius to fahrenheit using temperature formulas', () {
    final result = engine.convert(
      value: 100,
      fromUnit: UnitCatalog.findUnit(ConversionCategory.temperature, 'celsius'),
      toUnit: UnitCatalog.findUnit(
        ConversionCategory.temperature,
        'fahrenheit',
      ),
    );

    expect(result, closeTo(212, 0.00001));
  });

  test('formats whole numbers without trailing decimals', () {
    expect(formatNumber(42), '42');
    expect(formatNumber(12.5000), '12.5');
  });
}
