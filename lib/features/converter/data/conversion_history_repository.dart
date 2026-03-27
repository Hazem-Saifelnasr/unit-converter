import '../domain/conversion_record.dart';

abstract class ConversionHistoryRepository {
  List<ConversionRecord> loadHistory();

  Future<void> saveRecord(ConversionRecord record);

  Future<void> clearHistory();
}
