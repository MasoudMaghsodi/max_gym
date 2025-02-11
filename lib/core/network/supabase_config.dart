import 'package:flutter/material.dart';

/// مدیریت پیکربندی Supabase با مقادیر ثابت
class SupabaseConfig {
  static const String supabaseUrl = 'https://ozidgyqbvttgdngimlsp.supabase.co';
  static const String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im96aWRneXFidnR0Z2RuZ2ltbHNwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkyODgzNjgsImV4cCI6MjA1NDg2NDM2OH0.fVEHWBBL3Say5HqqTbdjascvrRaNTv2CS_1EX04yxmc';

  /// بررسی صحت تنظیمات Supabase
  static void initialize() {
    assert(supabaseUrl.isNotEmpty && supabaseKey.isNotEmpty,
        'تنظیمات Supabase نامعتبر است!');

    debugPrint('✅ Supabase Config Initialized!');
    debugPrint('URL: $supabaseUrl');
    debugPrint('Key: ${supabaseKey.substring(0, 5)}...');
  }
}
