import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle bigText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 50.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle mediumText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle mediumTextTwo = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle buttonText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
}
