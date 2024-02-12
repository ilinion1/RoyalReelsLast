import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/royal_reels_icon_button.dart';

class RoyalReelsIntroductionBox extends StatelessWidget {
  const RoyalReelsIntroductionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mqSize.width,
      height: context.mqSize.width,
      child: Stack(
        children: [
          Image.asset(
            Pathes.royalReelsBonusBox,
            width: context.mqSize.width,
            height: context.mqSize.width,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: 55.w.rightPad.add(30.h.bottomPad),
              child: RoyalReelsIconButton(
                size: 90.sp,
                bonusCount: 1,
                iconPath: Pathes.royalReelsSerachIcon,
              ),
            ),
          )
        ],
      ),
    );
  }
}
