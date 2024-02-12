import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/utilities/gray_out.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/royal_reels_level_card.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_home/business/models/royal_reels.dart';

class RoyalReelsLevelsBuilder extends StatelessWidget {
  const RoyalReelsLevelsBuilder({
    super.key,
    required this.onPageChanged,
  });
  final void Function(int index) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.h.verticPad.add(12.h.bottomPad),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final list = RoyalReelsLevelModel.list;
          return CarouselSlider.builder(
            itemCount: list.length + (state.currentLvl == 10 ? 1 : 0),
            itemBuilder: (context, index, realIndex) {
              if (realIndex == 11) {
                return const LastCard();
              }
              return Center(
                child: RoyalReelsLevelCards(
                  height: 380.h,
                  model: list[realIndex],
                  index: realIndex,
                ),
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                onPageChanged(index);
              },
              viewportFraction: 0.7,
              height: 380.h,
              padEnds: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: false,
            ),
          );
        },
      ),
    );
  }
}

class LastCard extends StatelessWidget {
  const LastCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = 380.h;
    return SizedBox(
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
                  GrayOutWrapper(
                    child: ClipRRect(
                      borderRadius: 30.sp.circleBorder,
                      child: Image.asset(
                        'assets/images/lvl_last.jpg',
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.22,
                        width: double.maxFinite,
                      ),
                      Padding(
                        padding: (height * 0.07).horizPad,
                        child: Text(
                          'New lands are coming',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.royalReelsBlack,
                            fontSize: 25.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                Pathes.royalReelsShield,
                height: height * 0.32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
