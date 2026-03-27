import 'dart:convert';

import 'conversion_category.dart';

class ConversionRecord {
  const ConversionRecord({
    required this.category,
    required this.fromUnitKey,
    required this.toUnitKey,
    required this.inputText,
    required this.resultText,
    required this.createdAt,
  });

  final ConversionCategory category;
  final String fromUnitKey;
  final String toUnitKey;
  final String inputText;
  final String resultText;
  final DateTime createdAt;

  String toStorage() {
    return jsonEncode(<String, Object>{
      'category': category.name,
      'fromUnitKey': fromUnitKey,
      'toUnitKey': toUnitKey,
      'inputText': inputText,
      'resultText': resultText,
      'createdAt': createdAt.toIso8601String(),
    });
  }

  factory ConversionRecord.fromStorage(String raw) {
    final decoded = jsonDecode(raw) as Map<String, dynamic>;

    return ConversionRecord(
      category: ConversionCategory.values.byName(decoded['category'] as String),
      fromUnitKey: decoded['fromUnitKey'] as String,
      toUnitKey: decoded['toUnitKey'] as String,
      inputText: decoded['inputText'] as String,
      resultText: decoded['resultText'] as String,
      createdAt: DateTime.parse(decoded['createdAt'] as String),
    );
  }

  bool sameContentAs(ConversionRecord other) {
    return category == other.category &&
        fromUnitKey == other.fromUnitKey &&
        toUnitKey == other.toUnitKey &&
        inputText == other.inputText &&
        resultText == other.resultText;
  }
}
