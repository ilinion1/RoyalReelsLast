import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/enums/enums.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/helpers/snack_bar_helper.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/services/platform_service.dart';
import 'package:royal_reels/core/utilities/app_button.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/royal_reels_level_card.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_home/business/models/royal_reels.dart';

class RoyalReelsFinallyScreen extends StatelessWidget {
  const RoyalReelsFinallyScreen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final model = RoyalReelsLevelModel.list[index];
    final didWin = model.state == RoyalReelsLvlCardState.land;
    return Scaffold(
      backgroundColor: AppColors.royalReelsBlack,
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            Pathes.royalReelsBgImage,
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          ColoredBox(
            color: AppColors.royalReelsBlack.withOpacity(0.5),
            child: const SizedBox.expand(),
          ),
          Padding(
            padding: (PlatformService.topPadding + 24.h).topPad,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                didWin ? 'Amazing' : 'You lost this attack',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poopins',
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: context.mqSize.width,
                height: context.mqSize.height - context.mqSize.height / 2.1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      AppColors.royalReelsBlack,
                      AppColors.royalReelsBlack.withOpacity(0),
                    ],
                  ),
                ),
              ),
              Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.royalReelsBlack,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.royalReelsBlack,
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(
                        1,
                        -10.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0, -0.5),
            child: RoyalReelsLevelCards(
              index: -1,
              height: 370.h,
              model: model,
            ),
          ),
          Padding(
            padding: 50.w.horizPad,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                10.verticalSpace,
                Text(
                  didWin
                      ? 'Now you’re the King of its land! Continue to earn new lands'
                      : 'Your enemies are smarter for now. Learn a little and try again!',
                  key: UniqueKey(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                AppButton(
                  margin: 30.topPad,
                  onTap: () {
                    if (didWin) {
                      if (index == 10) {
                        SnackBarHelper.showTopSnack(
                            title: 'New levels will be available soon!');
                        context.pushReplacement(AppRoutes.home);

                        return;
                      }
                      context.pushReplacement(AppRoutes.quiz, extra: index + 1);
                      return;
                    }
                    context.pushReplacement(AppRoutes.quiz, extra: index);
                  },
                  title: didWin ? 'Next Land' : 'Try Again',
                ),
                AppButton(
                  margin: 16.topPad.add(60.h.bottomPad),
                  onTap: () {
                    context.go(AppRoutes.home);
                  },
                  title: 'Home',
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // :)
  }
}
