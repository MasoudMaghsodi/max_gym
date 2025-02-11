import 'package:http/http.dart' as http;
import 'dart:convert';

class SupabaseTableCreator {
  final String supabaseUrl;
  final String supabaseKey;

  SupabaseTableCreator({required this.supabaseUrl, required this.supabaseKey});

  Future<void> createAthletesTable() async {
    final url = '$supabaseUrl/rest/v1/sql';
    final headers = {
      'apikey': supabaseKey,
      'Authorization': 'Bearer $supabaseKey',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "query": """
        CREATE TABLE IF NOT EXISTS athletes (
          id SERIAL PRIMARY KEY,
          first_name TEXT NOT NULL,
          last_name TEXT NOT NULL,
          age INTEGER NOT NULL,
          height DOUBLE PRECISION NOT NULL,
          weight DOUBLE PRECISION NOT NULL,
          gender TEXT NOT NULL,
          goal TEXT NOT NULL,
          coach_note TEXT
        );
      """
    });

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print('✅ جدول athletes ایجاد شد!');
    } else {
      print('❌ خطا در ایجاد جدول: ${response.body}');
    }
  }
}
