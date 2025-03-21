import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarGenerator {
  static final List<Color> _colors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.orange,
  ];

  static Widget generateAvatar(String name, {double size = 40.0}) {
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';
    final random = Random(name.hashCode);
    final color = _colors[random.nextInt(_colors.length)];

    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: color.withOpacity(0.8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: color.withOpacity(0.3),
            blurRadius: 5.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          initial,
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
