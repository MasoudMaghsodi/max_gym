import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrService {
  static Widget generateQrCode(String data) {
    return QrImageView(
      data: data,
      version: QrVersions.auto,
      size: 200.0,
      backgroundColor: Colors.white,
    );
  }
}
