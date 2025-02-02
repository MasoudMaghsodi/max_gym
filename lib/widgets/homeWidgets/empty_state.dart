import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_alt_outlined, color: Colors.grey[500], size: 70.sp),
          SizedBox(height: 20.h),
          Text(
            'داده‌ای برای نمایش وجود ندارد',
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey[400],
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'برای افزودن ورزشکار جدید از دکمه پایین استفاده کنید',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
