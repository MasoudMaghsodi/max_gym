import 'dart:convert';
import 'package:isar/isar.dart';
part 'offline_queue.g.dart';

@Collection()
class OfflineQueueItem {
  Id id = Isar.autoIncrement;

  String action;
  String data; // JSON-encoded string
  DateTime timestamp;

  OfflineQueueItem({
    required this.action,
    required this.data,
    required this.timestamp,
  });

  factory OfflineQueueItem.fromMap(
      String action, Map<String, dynamic> dataMap, DateTime timestamp) {
    return OfflineQueueItem(
      action: action,
      data: jsonEncode(dataMap),
      timestamp: timestamp,
    );
  }

  Map<String, dynamic> getData() => jsonDecode(data);
}
