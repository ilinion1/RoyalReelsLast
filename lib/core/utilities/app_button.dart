import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/constants/colors.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.title,
    this.margin = EdgeInsets.zero,
  });
  final String title;
  final VoidCallback onTap;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Material(
        borderRadius: 20.sp.circleBorder,
        color: AppColors.royalReelsOrange,
        child: InkWell(
          onTap: onTap,
          borderRadius: 20.sp.circleBorder,
          child: Container(
            margin: 20.h.verticPad,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontFamily: 'Poppins',
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
