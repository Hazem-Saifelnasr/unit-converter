import 'conversion_category.dart';
import 'unit_definition.dart';

class UnitCatalog {
  const UnitCatalog._();

  static final Map<ConversionCategory, List<UnitDefinition>> _units =
      <ConversionCategory, List<UnitDefinition>>{
        ConversionCategory.length: [
          UnitDefinition.linear(
            key: 'millimeter',
            label: 'Millimeter',
            symbol: 'mm',
            factorToBase: 0.001,
          ),
          UnitDefinition.linear(
            key: 'centimeter',
            label: 'Centimeter',
            symbol: 'cm',
            factorToBase: 0.01,
          ),
          UnitDefinition.linear(
            key: 'meter',
            label: 'Meter',
            symbol: 'm',
            factorToBase: 1,
          ),
          UnitDefinition.linear(
            key: 'kilometer',
            label: 'Kilometer',
            symbol: 'km',
            factorToBase: 1000,
          ),
          UnitDefinition.linear(
            key: 'inch',
            label: 'Inch',
            symbol: 'in',
            factorToBase: 0.0254,
          ),
          UnitDefinition.linear(
            key: 'foot',
            label: 'Foot',
            symbol: 'ft',
            factorToBase: 0.3048,
          ),
          UnitDefinition.linear(
            key: 'yard',
            label: 'Yard',
            symbol: 'yd',
            factorToBase: 0.9144,
          ),
          UnitDefinition.linear(
            key: 'mile',
            label: 'Mile',
            symbol: 'mi',
            factorToBase: 1609.344,
          ),
        ],
        ConversionCategory.weight: [
          UnitDefinition.linear(
            key: 'milligram',
            label: 'Milligram',
            symbol: 'mg',
            factorToBase: 0.001,
          ),
          UnitDefinition.linear(
            key: 'gram',
            label: 'Gram',
            symbol: 'g',
            factorToBase: 1,
          ),
          UnitDefinition.linear(
            key: 'kilogram',
            label: 'Kilogram',
            symbol: 'kg',
            factorToBase: 1000,
          ),
          UnitDefinition.linear(
            key: 'ton',
            label: 'Ton',
            symbol: 't',
            factorToBase: 1000000,
          ),
          UnitDefinition.linear(
            key: 'ounce',
            label: 'Ounce',
            symbol: 'oz',
            factorToBase: 28.349523125,
          ),
          UnitDefinition.linear(
            key: 'pound',
            label: 'Pound',
            symbol: 'lb',
            factorToBase: 453.59237,
          ),
        ],
        ConversionCategory.temperature: const [
          UnitDefinition(
            key: 'celsius',
            label: 'Celsius',
            symbol: '°C',
            toBase: _celsiusToKelvin,
            fromBase: _kelvinToCelsius,
          ),
          UnitDefinition(
            key: 'fahrenheit',
            label: 'Fahrenheit',
            symbol: '°F',
            toBase: _fahrenheitToKelvin,
            fromBase: _kelvinToFahrenheit,
          ),
          UnitDefinition(
            key: 'kelvin',
            label: 'Kelvin',
            symbol: 'K',
            toBase: _identity,
            fromBase: _identity,
          ),
        ],
        ConversionCategory.area: [
          UnitDefinition.linear(
            key: 'square_meter',
            label: 'Square meter',
            symbol: 'm²',
            factorToBase: 1,
          ),
          UnitDefinition.linear(
            key: 'square_kilometer',
            label: 'Square kilometer',
            symbol: 'km²',
            factorToBase: 1000000,
          ),
          UnitDefinition.linear(
            key: 'square_foot',
            label: 'Square foot',
            symbol: 'ft²',
            factorToBase: 0.09290304,
          ),
          UnitDefinition.linear(
            key: 'square_yard',
            label: 'Square yard',
            symbol: 'yd²',
            factorToBase: 0.83612736,
          ),
          UnitDefinition.linear(
            key: 'acre',
            label: 'Acre',
            symbol: 'ac',
            factorToBase: 4046.8564224,
          ),
          UnitDefinition.linear(
            key: 'hectare',
            label: 'Hectare',
            symbol: 'ha',
            factorToBase: 10000,
          ),
        ],
        ConversionCategory.volume: [
          UnitDefinition.linear(
            key: 'milliliter',
            label: 'Milliliter',
            symbol: 'mL',
            factorToBase: 0.001,
          ),
          UnitDefinition.linear(
            key: 'liter',
            label: 'Liter',
            symbol: 'L',
            factorToBase: 1,
          ),
          UnitDefinition.linear(
            key: 'cubic_meter',
            label: 'Cubic meter',
            symbol: 'm³',
            factorToBase: 1000,
          ),
          UnitDefinition.linear(
            key: 'cup',
            label: 'Cup',
            symbol: 'cup',
            factorToBase: 0.2365882365,
          ),
          UnitDefinition.linear(
            key: 'pint',
            label: 'Pint',
            symbol: 'pt',
            factorToBase: 0.473176473,
          ),
          UnitDefinition.linear(
            key: 'gallon',
            label: 'Gallon',
            symbol: 'gal',
            factorToBase: 3.785411784,
          ),
        ],
        ConversionCategory.speed: [
          UnitDefinition.linear(
            key: 'meter_per_second',
            label: 'Meter per second',
            symbol: 'm/s',
            factorToBase: 1,
          ),
          UnitDefinition.linear(
            key: 'kilometer_per_hour',
            label: 'Kilometer per hour',
            symbol: 'km/h',
            factorToBase: 0.2777777778,
          ),
          UnitDefinition.linear(
            key: 'mile_per_hour',
            label: 'Mile per hour',
            symbol: 'mph',
            factorToBase: 0.44704,
          ),
          UnitDefinition.linear(
            key: 'knot',
            label: 'Knot',
            symbol: 'kn',
            factorToBase: 0.5144444444,
          ),
        ],
      };

  static const Map<ConversionCategory, ({String from, String to})> _defaults =
      <ConversionCategory, ({String from, String to})>{
        ConversionCategory.length: (from: 'meter', to: 'foot'),
        ConversionCategory.weight: (from: 'kilogram', to: 'pound'),
        ConversionCategory.temperature: (from: 'celsius', to: 'fahrenheit'),
        ConversionCategory.area: (from: 'square_meter', to: 'square_foot'),
        ConversionCategory.volume: (from: 'liter', to: 'gallon'),
        ConversionCategory.speed: (
          from: 'kilometer_per_hour',
          to: 'mile_per_hour',
        ),
      };

  static List<UnitDefinition> unitsFor(ConversionCategory category) {
    return _units[category]!;
  }

  static UnitDefinition defaultFromUnit(ConversionCategory category) {
    return findUnit(category, _defaults[category]!.from);
  }

  static UnitDefinition defaultToUnit(ConversionCategory category) {
    return findUnit(category, _defaults[category]!.to);
  }

  static UnitDefinition findUnit(ConversionCategory category, String unitKey) {
    return unitsFor(category).firstWhere((unit) => unit.key == unitKey);
  }

  static double _identity(double value) => value;

  static double _celsiusToKelvin(double value) => value + 273.15;

  static double _kelvinToCelsius(double value) => value - 273.15;

  static double _fahrenheitToKelvin(double value) =>
      (value - 32) * 5 / 9 + 273.15;

  static double _kelvinToFahrenheit(double value) =>
      (value - 273.15) * 9 / 5 + 32;
}
