import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/enums/enums.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/royal_reels_level_card.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_home/business/models/royal_reels.dart';

class RoyalReelsIntroductionTwoCards extends StatelessWidget {
  const RoyalReelsIntroductionTwoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 40.w.horizPad,
      height: 364.h,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          RoyalReelsLevelCards(
            height: 295.h,
            index: -1,
            model: RoyalReelsLevelModel(
              id: 3,
              title: 'Mysteri Land',
              image: 'assets/images/royal_reels_lvl_cards/lvl_1.jpg',
              state: RoyalReelsLvlCardState.land,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: RoyalReelsLevelCards(
              isBig: false,
              height: 233.h,
              index: -1,
              model: RoyalReelsLevelModel(
                id: 3,
                title: 'Eiliean Kingdom',
                image: 'assets/images/royal_reels_lvl_cards/lvl_5.jpg',
                state: RoyalReelsLvlCardState.land,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
