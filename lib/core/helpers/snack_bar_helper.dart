import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/constants/colors.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/utilities/app_utilities.dart';

class SnackBarHelper {
  static void showTopSnack({String? title}) {
    final context = appRouter.currentContext;
    topFlush(title).show(context);
  }

  static Flushbar topFlush(String? title) {
    return Flushbar(
      margin: 12.sp.toAllPad..add(6.h.topPad),
      borderRadius: 8.sp.circleBorder,
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: AppDurations.ms_500,
      duration: const Duration(seconds: 2),
      messageText: Text(
        '$title',
        maxLines: 99,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Popins',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColors.royalReelsBlack,
    );
  }
}
