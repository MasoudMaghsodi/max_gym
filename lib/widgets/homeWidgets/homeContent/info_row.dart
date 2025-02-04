import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final Color? iconColor;

  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: iconColor ?? Colors.blue[200],
            size: 22.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle ??
                      TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: valueStyle ??
                      TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[100],
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
