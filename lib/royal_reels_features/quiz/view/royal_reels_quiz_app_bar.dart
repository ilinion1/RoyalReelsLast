import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/services/platform_service.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/royal_reels_icon_button.dart';

class RoyalReelsQuizAppBar extends StatelessWidget {
  const RoyalReelsQuizAppBar({
    super.key,
    required this.onBoostUse,
  });
  final VoidCallback onBoostUse;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.royalReelsDarkBlue,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: PlatformService.topPadding.topPad
              .add(24.w.horizPad.add(6.verticPad)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: RoyalReelsIconButton(
                  iconPath: Pathes.royalReelsArrowBackIcon,
                  size: 40.sp,
                  onTap: () {
                    context.pop();
                  },
                ),
              ),
              SvgPicture.asset(
                Pathes.royalReelsLogoText,
                height: 30.h,
              ),
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: RoyalReelsIconButton(
                      iconPath: Pathes.royalReelsSerachIcon,
                      size: 40.sp,
                      bonusCount: state.boostCount,
                      onTap: onBoostUse,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
