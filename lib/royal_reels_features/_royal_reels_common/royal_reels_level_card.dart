import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/enums/enums.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/helpers/snack_bar_helper.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/utilities/gray_out.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_home/business/models/royal_reels.dart';

class RoyalReelsLevelCards extends StatelessWidget {
  const RoyalReelsLevelCards({
    super.key,
    required this.height,
    this.isBig = true,
    required this.model,
    required this.index,
  });
  final double height;
  final bool isBig;
  final RoyalReelsLevelModel model;
  final int index;
  String get stateImage {
    return model.state == RoyalReelsLvlCardState.land
        ? Pathes.royalReelsCrown
        : Pathes.royalReelsShield;
  }

  Color get stateColor {
    return {
      RoyalReelsLvlCardState.land: AppColors.royalReelsGreen,
      RoyalReelsLvlCardState.closed: AppColors.royalReelsLightGrey,
      RoyalReelsLvlCardState.landOfEnemies: AppColors.royalReelsOrange,
    }[model.state]!;
  }

  String get stateText {
    return {
      RoyalReelsLvlCardState.land: 'Your Land',
      RoyalReelsLvlCardState.closed: 'Unavailable',
      RoyalReelsLvlCardState.landOfEnemies: 'Land of enemies',
    }[model.state]!;
  }

  Widget get image {
    final widget = ClipRRect(
      borderRadius: (isBig ? 30 : 25).sp.circleBorder,
      child: Image.asset(
        model.image,
      ),
    );
    if (model.state == RoyalReelsLvlCardState.closed) {
      return GrayOutWrapper(child: widget);
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index < 0) return;
        if (model.state == RoyalReelsLvlCardState.closed) {
          SnackBarHelper.showTopSnack(title: 'Level is closed');
          return;
        }
        if (index == 0) {
          context.push(AppRoutes.teaching);

          return;
        }
        context.push(AppRoutes.quiz, extra: index);
      },
      child: SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: (height * 0.1).topPad,
              child: AspectRatio(
                aspectRatio: 296 / 380,
                child: Stack(
                  children: [
                    image,
                    Column(
                      children: [
                        SizedBox(
                          height: height * 0.22,
                          width: double.maxFinite,
                        ),
                        Padding(
                          padding: (height * 0.07).horizPad,
                          child: FittedBox(
                            child: Text(
                              model.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppColors.royalReelsBlack,
                                fontSize: 999,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: (isBig ? 8 : 6).w,
                              vertical: (isBig ? 4 : 3).h),
                          decoration: ShapeDecoration(
                            color: stateColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.sp),
                            ),
                          ),
                          child: Text(
                            stateText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: (isBig ? 14 : 10).sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        if (model.state == RoyalReelsLvlCardState.closed)
                          Text(
                            'Finish previous',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Image.asset(
                  stateImage,
                  height: height * 0.32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
