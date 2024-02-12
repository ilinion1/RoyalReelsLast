import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/services/platform_service.dart';
import 'package:royal_reels/core/utilities/app_button.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_on_boarding/royal_reels_introduction_box.dart';

class RoyalReelsGetBonusScreen extends StatelessWidget {
  const RoyalReelsGetBonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Bonus Tip',
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
          const Align(
            alignment: Alignment(0, -0.25),
            child: RoyalReelsIntroductionBox(),
          ),
          Padding(
            padding: 50.w.horizPad,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                10.verticalSpace,
                Text(
                  'Come back in 24 hours to get one more tip',
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
                  margin: 31.topPad.add(60.h.bottomPad),
                  onTap: context.pop,
                  title: 'Get',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
