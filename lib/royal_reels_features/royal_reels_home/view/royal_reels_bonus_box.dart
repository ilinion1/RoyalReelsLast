import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/utilities/gray_out.dart';
import 'package:royal_reels/core/utilities/jumping_box_widget.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/bonus_cubit.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';

class BonusBox extends StatelessWidget {
  const BonusBox({super.key});
  Widget get image {
    return Image.asset(
      Pathes.royalReelsBonusBox,
      height: 150.h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 70.h.bottomPad,
      child: BlocBuilder<BonusCubit, BonusState>(
        builder: (context, state) {
          return !state.bonusAvailable
              ? GrayOutWrapper(
                  child: image,
                )
              : JumpingBox(
                  child: GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.bonus);
                      context.read<BonusCubit>().getBonus();
                      context.read<UserCubit>().addBonus();
                    },
                    child: image,
                  ),
                );
        },
      ),
    );
  }
}
