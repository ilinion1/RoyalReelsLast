import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/helpers/snack_bar_helper.dart';
import 'package:royal_reels/core/services/platform_service.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/royal_reels_icon_button.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});
  static const show = false;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    Future.delayed(1000.msDuration, () {
      SnackBarHelper.showTopSnack(title: 'You have no tips');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.royalReelsBlack,
      body: Column(
        children: [
          // RoyalReelsQuizAppBar(
          //   onBoostUse: () {
          //     boostNotifier.value++;
          //   },
          // ),
        ],
      ),
    );
    // :)
  }
}