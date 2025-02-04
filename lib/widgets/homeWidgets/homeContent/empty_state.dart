import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyState extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onActionButtonPressed;

  const EmptyState({
    super.key,
    this.title = 'داده‌ای برای نمایش وجود ندارد',
    this.subtitle = 'برای افزودن ورزشکار جدید از دکمه پایین استفاده کنید',
    this.icon = Icons.people_alt_outlined,
    this.iconColor,
    this.onActionButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor ?? Colors.grey[500],
            size: 70.sp,
          ),
          SizedBox(height: 20.h),
          Text(
            title!,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey[400],
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          if (subtitle != null)
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[500],
              ),
            ),
          if (onActionButtonPressed != null) ...[
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: onActionButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
              ),
              child: Text(
                'افزودن ورزشکار',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
