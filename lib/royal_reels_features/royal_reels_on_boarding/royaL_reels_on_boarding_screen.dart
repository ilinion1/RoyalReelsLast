import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/services/platform_service.dart';
import 'package:royal_reels/core/utilities/my_animated_switcher.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_on_boarding/royal_reels_introducation_two_cards.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_on_boarding/royal_reels_introduction_box.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_on_boarding/royal_reels_on_boarding_content.dart';

class RoyalReelsOnBoardingScreen extends StatefulWidget {
  const RoyalReelsOnBoardingScreen({super.key});
  static const show = true;
  @override
  State<RoyalReelsOnBoardingScreen> createState() =>
      _RoyalReelsOnBoardingScreenState();
}

class _RoyalReelsOnBoardingScreenState
    extends State<RoyalReelsOnBoardingScreen> {
  int currentIndex = 0;
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
          Column(
            children: [
              Padding(
                padding: (PlatformService.topPadding + 14.h)
                    .topPad
                    .add(10.h.bottomPad),
                child: SvgPicture.asset(
                  Pathes.royalReelsLogoText,
                  height: 33.h,
                ),
              ),
              Padding(
                padding: 20.w.horizPad.add(25.h.verticPad),
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Expanded(
                      child: AnimatedContainer(
                        duration: 200.msDuration,
                        width: double.maxFinite,
                        margin: 4.w.horizPad,
                        height: 2.5.h,
                        decoration: BoxDecoration(
                          borderRadius: 8.circleBorder,
                          color: currentIndex < index
                              ? AppColors.royalReelsDarkGrey
                              : AppColors.royalReelsOrange,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                ),
              ),
              MyAnimatedSwitcher(
                child: currentIndex == 0
                    ? Image.asset(
                        Pathes.royalReelsKing,
                        key: UniqueKey(),
                        width: double.maxFinite,
                        height: context.mqSize.height * 0.7,
                        alignment: const Alignment(-0.7, 0),
                        colorBlendMode: BlendMode.saturation,
                        fit: BoxFit.cover,
                      )
                    : SizedBox(
                        key: UniqueKey(),
                      ),
              ),
            ],
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
                )),
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
          MyAnimatedSwitcher(
            child: Align(
              key: UniqueKey(),
              alignment: const Alignment(0, -0.2),
              child: currentIndex == 1
                  ? const RoyalReelsIntroductionTwoCards()
                  : currentIndex == 2
                      ? const RoyalReelsIntroductionBox()
                      : null,
            ),
          ),
          OnBoardingContent(
            currentIndex: currentIndex,
            onNext: () {
              currentIndex++;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
