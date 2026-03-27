enum ConversionCategory {
  length('Length'),
  weight('Weight / Mass'),
  temperature('Temperature'),
  area('Area'),
  volume('Volume'),
  speed('Speed');

  const ConversionCategory(this.label);

  final String label;
}
