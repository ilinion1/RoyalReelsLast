import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/services/platform_service.dart';
import 'package:royal_reels/core/utilities/app_button.dart';
import 'package:royal_reels/core/utilities/my_animated_switcher.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/royal_reels_icon_button.dart';

class RoyalReelsAttackTeaching extends StatefulWidget {
  const RoyalReelsAttackTeaching({super.key});

  @override
  State<RoyalReelsAttackTeaching> createState() =>
      _RoyalReelsAttackTeachingState();
}

class _RoyalReelsAttackTeachingState extends State<RoyalReelsAttackTeaching> {
  var index = 0;
  final deses = [
    'Answer all 11 questions to win the attack on this land.',
    'Use Tips if you don’t know the answer, if you have it.',
  ];
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
          Center(
            child: Image.asset(
              Pathes.royalReelsKing,
              width: double.maxFinite,
              height: context.mqSize.height * 0.7,
              alignment: const Alignment(-0.7, 0),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: (PlatformService.topPadding + 24.h).topPad,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'First Attack',
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
          Padding(
            padding: 50.w.horizPad,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                10.verticalSpace,
                MyAnimatedSwitcher(
                  child: Row(
                    key: UniqueKey(),
                    children: [
                      Expanded(
                        child: Text(
                          deses[index],
                          key: UniqueKey(),
                          textAlign:
                              index == 0 ? TextAlign.center : TextAlign.start,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 13.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (index == 1)
                        const RoyalReelsIconButton(
                          size: 44,
                          iconPath: Pathes.royalReelsSerachIcon,
                          bonusCount: 1,
                        )
                    ],
                  ),
                ),
                AppButton(
                  margin: 31.topPad.add(60.h.bottomPad),
                  onTap: () {
                    if (index == 1) {
                      context.pushReplacement(AppRoutes.quiz, extra: 0);
                      return;
                    }
                    index++;
                    setState(() {});
                  },
                  title: 'Start',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
