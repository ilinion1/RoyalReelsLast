import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/constants/colors.dart';
import 'package:royal_reels/core/theme/my_text_theme.dart';

class AppTheme {
  static ThemeData getTheme(Brightness brightness, BuildContext context) {
    return _lightTheme(context);
  }

  static ThemeData _lightTheme(BuildContext context) {
    final textTheme = AppTextTheme.light(context);

    return ThemeData(
      primaryColor: AppColors.royalReelsOrange,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.royalReelsOrange,
      ),
      brightness: Brightness.light,
      useMaterial3: true,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.royalReelsBlack,
      fontFamily: 'Popins',
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      textTheme: textTheme,
      extensions: [
        TextThemeExtension(textTheme),
      ],
    );
  }
}
