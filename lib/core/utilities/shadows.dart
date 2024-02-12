import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/constants/colors.dart';

sealed class AppShadows {
  static final appBarShadow = [
    BoxShadow(
      blurRadius: 15.sp,
      color: Colors.purple,
      offset: Offset(0.0, -2.sp),
    )
  ];
  static final navBarShaow = [
    BoxShadow(
      blurRadius: 2.sp,
      color: AppColors.shadowColor,
      offset: Offset(0.0, -2.sp),
    )
  ];
}
