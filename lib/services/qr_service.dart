import 'dart:io';

import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:max_gym/services/pdf_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class QrService {
  static Future<String> generateQrCode(
      List<WorkoutPlan> plans, Athlete athlete) async {
    final uuid = const Uuid().v4();
    final pdfUrl = await _uploadTemporaryPdf(plans, athlete, uuid);
    final qrUrl =
        'https://api.qrserver.com/v1/create-qr-code/?data=$pdfUrl&size=200x200';
    return qrUrl;
  }

  static Future<String> _uploadTemporaryPdf(
      List<WorkoutPlan> plans, Athlete athlete, String uuid) async {
    final pdfPath = await PdfService.generateWorkoutPdf(plans, athlete);
    final file = File(pdfPath);
    final supabase = Supabase.instance.client;
    final storagePath = 'temp_pdfs/$uuid.pdf';
    await supabase.storage.from('public').upload(storagePath, file);

    // لینک موقت با انقضای ۱ ساعت
    final url = supabase.storage.from('public').getPublicUrl(storagePath);
    Future.delayed(const Duration(hours: 1), () {
      supabase.storage.from('public').remove([storagePath]);
    });

    return url;
  }
}
