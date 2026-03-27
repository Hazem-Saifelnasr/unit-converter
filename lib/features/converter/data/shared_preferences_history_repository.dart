import 'package:shared_preferences/shared_preferences.dart';

import '../domain/conversion_record.dart';
import 'conversion_history_repository.dart';

class SharedPreferencesHistoryRepository
    implements ConversionHistoryRepository {
  SharedPreferencesHistoryRepository(this._sharedPreferences);

  static const String _historyKey = 'recent_conversions';
  static const int _maxRecords = 15;

  final SharedPreferences _sharedPreferences;

  @override
  List<ConversionRecord> loadHistory() {
    final rawRecords =
        _sharedPreferences.getStringList(_historyKey) ?? <String>[];

    return rawRecords.map(ConversionRecord.fromStorage).toList(growable: false);
  }

  @override
  Future<void> saveRecord(ConversionRecord record) async {
    final records = loadHistory()
        .where((item) => !item.sameContentAs(record))
        .toList(growable: true);

    records.insert(0, record);

    final trimmed = records
        .take(_maxRecords)
        .map((item) => item.toStorage())
        .toList();
    await _sharedPreferences.setStringList(_historyKey, trimmed);
  }

  @override
  Future<void> clearHistory() async {
    await _sharedPreferences.remove(_historyKey);
  }
}
