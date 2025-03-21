import 'dart:io';
import 'package:max_gym/services/isar_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:typed_data';

class BackupService {
  static Future<String> backupDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final isarFile = File('${dir.path}/default.isar');
    if (!await isarFile.exists()) throw Exception('فایل دیتابیس پیدا نشد');

    final bytes = await isarFile.readAsBytes();
    final encryptedBytes = _encrypt(bytes);
    final supabase = Supabase.instance.client;
    final backupPath =
        'backups/backup_${DateTime.now().millisecondsSinceEpoch}.isar';
    await supabase.storage
        .from('private')
        .uploadBinary(backupPath, encryptedBytes);

    return supabase.storage.from('private').getPublicUrl(backupPath);
  }

  static Future<void> restoreDatabase(String backupUrl) async {
    final supabase = Supabase.instance.client;
    final response = await supabase.storage
        .from('private')
        .download(backupUrl.split('/').last);
    final decryptedBytes = _decrypt(response);
    final dir = await getApplicationDocumentsDirectory();
    final isarFile = File('${dir.path}/default.isar');
    await isarFile.writeAsBytes(decryptedBytes);

    await IsarService.init();
  }

  static Uint8List _encrypt(Uint8List data) {
    final key = utf8.encode('maxgymkey');
    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(data);
    return Uint8List.fromList(digest.bytes + data);
  }

  static Uint8List _decrypt(Uint8List data) {
    return data.sublist(32);
  }
}
