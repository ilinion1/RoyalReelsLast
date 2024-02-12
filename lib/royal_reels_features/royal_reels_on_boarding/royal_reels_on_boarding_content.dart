import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/data/local/local_storage.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/utilities/app_button.dart';
import 'package:royal_reels/core/utilities/my_animated_switcher.dart';

class OnBoardingContent extends StatefulWidget {
  const OnBoardingContent({
    super.key,
    required this.onNext,
    required this.currentIndex,
  });
  final VoidCallback onNext;
  final int currentIndex;
  @override
  State<OnBoardingContent> createState() => _OnBoardingContentState();
}

class _OnBoardingContentState extends State<OnBoardingContent> {
  final titles = [
    'Welcome to the Royal Conquiztador!',
    'Get all lands',
    'Come back every day',
  ];

  final deses = [
    'Try your brain and get the winnings all around the Royal World',
    'Answer 9 questions in every land to win your enemies and get the new kingdom',
    'Every 24 hours you can get 1 tip that can help you to win!',
  ];
  int currentIndex = 0;
  @override
  void didUpdateWidget(covariant OnBoardingContent oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 50.w.horizPad,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyAnimatedSwitcher(
            child: Text(
              titles[currentIndex],
              key: UniqueKey(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          10.verticalSpace,
          MyAnimatedSwitcher(
            child: Text(
              deses[currentIndex],
              key: UniqueKey(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          AppButton(
            margin: 22.topPad,
            onTap: () {
              if (currentIndex == 2) {
                LocalStorage.setVal<bool>(false, 'firstTime');
                context.go(AppRoutes.home);
                return;
              }
              currentIndex++;
              widget.onNext();
            },
            title: 'Next',
          ),
          Padding(
            padding: 35.bottomPad,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                    AppColors.royalReelsLightGrey.withOpacity(0.5)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                ),
              ),
              onPressed: () {
                LocalStorage.setVal<bool>(false, 'firstTime');
                context.go(AppRoutes.home);
              },
              child: Text(
                'Skip',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.royalReelsLightGrey,
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
