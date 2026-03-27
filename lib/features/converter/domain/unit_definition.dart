typedef UnitTransform = double Function(double value);

class UnitDefinition {
  const UnitDefinition({
    required this.key,
    required this.label,
    required this.symbol,
    required this.toBase,
    required this.fromBase,
  });

  factory UnitDefinition.linear({
    required String key,
    required String label,
    required String symbol,
    required double factorToBase,
  }) {
    return UnitDefinition(
      key: key,
      label: label,
      symbol: symbol,
      toBase: (value) => value * factorToBase,
      fromBase: (value) => value / factorToBase,
    );
  }

  final String key;
  final String label;
  final String symbol;
  final UnitTransform toBase;
  final UnitTransform fromBase;
}
