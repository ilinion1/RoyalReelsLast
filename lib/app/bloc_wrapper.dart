import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/bonus_cubit.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';

class RoyalReelsBlocWrapper extends StatelessWidget {
  const RoyalReelsBlocWrapper(this.child, {super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => BonusCubit()),
      ],
      child: child,
    );
  }
}
