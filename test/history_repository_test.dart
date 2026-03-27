import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unit_converter/features/converter/data/shared_preferences_history_repository.dart';
import 'package:unit_converter/features/converter/domain/conversion_category.dart';
import 'package:unit_converter/features/converter/domain/conversion_record.dart';

void main() {
  test('stores recent conversions locally with latest items first', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final preferences = await SharedPreferences.getInstance();
    final repository = SharedPreferencesHistoryRepository(preferences);

    await repository.saveRecord(
      ConversionRecord(
        category: ConversionCategory.length,
        fromUnitKey: 'meter',
        toUnitKey: 'foot',
        inputText: '10',
        resultText: '32.8084',
        createdAt: DateTime(2026, 1, 1, 12),
      ),
    );

    final history = repository.loadHistory();

    expect(history, hasLength(1));
    expect(history.first.category, ConversionCategory.length);
    expect(history.first.inputText, '10');
    expect(history.first.resultText, '32.8084');
  });

  test('clears stored history', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final preferences = await SharedPreferences.getInstance();
    final repository = SharedPreferencesHistoryRepository(preferences);

    await repository.saveRecord(
      ConversionRecord(
        category: ConversionCategory.length,
        fromUnitKey: 'meter',
        toUnitKey: 'foot',
        inputText: '10',
        resultText: '32.8084',
        createdAt: DateTime(2026, 1, 1, 12),
      ),
    );

    await repository.clearHistory();

    expect(repository.loadHistory(), isEmpty);
  });
}
