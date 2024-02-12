import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/enums/enums.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/helpers/snack_bar_helper.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/services/platform_service.dart';
import 'package:royal_reels/core/utilities/app_button.dart';
import 'package:royal_reels/core/utilities/gray_out.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/bonus_cubit.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/royal_reels_icon_button.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_home/view/royal_reels_bonus_box.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_home/view/royal_reels_lvl_builder.dart';

class RoyalReelsHomeScreen extends StatefulWidget {
  const RoyalReelsHomeScreen({super.key});

  @override
  State<RoyalReelsHomeScreen> createState() => _RoyalReelsHomeScreenState();
}

class _RoyalReelsHomeScreenState extends State<RoyalReelsHomeScreen> {
  void onPageChanged(int index) {
    carouselIndex = index;
    setState(() {});
  }

  var carouselIndex = 0;
  String get stateText {
    return {
      RoyalReelsLvlCardState.land: 'Play again',
      RoyalReelsLvlCardState.closed: 'Blocked Land',
      RoyalReelsLvlCardState.landOfEnemies: 'Attack',
    }[stateGetter]!;
  }

  RoyalReelsLvlCardState get stateGetter {
    final currentLvl =
        appRouter.currentContext.read<UserCubit>().state.currentLvl;
    return currentLvl == carouselIndex
        ? RoyalReelsLvlCardState.landOfEnemies
        : currentLvl > carouselIndex
            ? RoyalReelsLvlCardState.land
            : RoyalReelsLvlCardState.closed;
  }

  late final userCubit = context.read<UserCubit>();

  Widget get atacButton {
    final child = AppButton(
      margin: 60.w.horizPad.add(0.bottomPad),
      onTap: () {
        if (stateGetter == RoyalReelsLvlCardState.closed) {
          SnackBarHelper.showTopSnack(title: 'Level is closed');
          return;
        }
        context.push(AppRoutes.quiz, extra: carouselIndex);
      },
      title: stateText,
    );

    return stateGetter == RoyalReelsLvlCardState.closed
        ? GrayOutWrapper(child: child)
        : child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: -context.mqSize.width * 0.5,
            child: Container(
              width: context.mqSize.width * 1,
              height: context.mqSize.width * 1,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.royalReelsDarkGrey,
              ),
            ),
          ),
          Column(
            children: [
              const RoyalReelsHomeAppBar(),
              RoyalReelsLevelsBuilder(
                onPageChanged: onPageChanged,
              ),
              atacButton,
              150.verticalSpace,
              BlocBuilder<BonusCubit, BonusState>(
                builder: (context, state) {
                  return Text(
                    state.bonusAvailable ? 'Bonus Tip' : state.timeLeft,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              )
            ],
          ),
          const BonusBox(),
        ],
      ),
    );
  }
}

class RoyalReelsHomeAppBar extends StatelessWidget {
  const RoyalReelsHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.royalReelsDarkBlue,
      child: Padding(
        padding: PlatformService.topPadding.topPad
            .add(6.h.verticPad.add(24.w.horizPad)),
        child: SizedBox(
          width: double.infinity,
          height: 62.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                Pathes.royalReelsLogoText,
                height: 32.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RoyalReelsIconButton(
                  iconPath: Pathes.royalReelsSettingsIcon,
                  size: 44.sp,
                  onTap: () {
                    context.push(AppRoutes.settings);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
