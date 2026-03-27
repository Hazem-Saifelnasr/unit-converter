String formatNumber(double value) {
  if (value.isNaN || value.isInfinite) {
    return 'Invalid result';
  }

  final absoluteValue = value.abs();

  if (absoluteValue == 0) {
    return '0';
  }

  if (absoluteValue >= 1000000000 || absoluteValue < 0.000001) {
    return value.toStringAsExponential(4);
  }

  if ((value - value.roundToDouble()).abs() < 0.000000001) {
    return value.round().toString();
  }

  final fractionDigits = absoluteValue >= 1000
      ? 2
      : absoluteValue >= 1
      ? 4
      : 6;

  final fixed = value.toStringAsFixed(fractionDigits);
  final trimmed = fixed
      .replaceFirst(RegExp(r'0+$'), '')
      .replaceFirst(RegExp(r'\.$'), '');

  return trimmed == '-0' ? '0' : trimmed;
}
