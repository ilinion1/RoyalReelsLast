import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/helpers/snack_bar_helper.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/utilities/app_utilities.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';
import 'package:royal_reels/royal_reels_features/quiz/view/royal_reels_quiz_app_bar.dart';
import 'package:royal_reels/royal_reels_features/quiz/view/royal_reels_quiz_body.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_home/business/models/royal_reels.dart';

class RoyalReelsQuizScreen extends StatefulWidget {
  const RoyalReelsQuizScreen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<RoyalReelsQuizScreen> createState() => _RoyalReelsQuizScreenState();
}

class _RoyalReelsQuizScreenState extends State<RoyalReelsQuizScreen> {
  late final userCubit = context.read<UserCubit>();
  late final quizModel = userCubit.state.quizes[widget.index];
  RoyalReelsLevelModel get lvlModel => RoyalReelsLevelModel.list[widget.index];
  int questionIndex = 0;
  int incorrectAnswers = 0;
  void onAnswer(bool answer) {
    if (!answer) {
      incorrectAnswers++;
    }
    if (questionIndex == 8) {
      final isNewLvl = widget.index == userCubit.state.currentLvl;
      if (incorrectAnswers < 5 && isNewLvl) {
        userCubit.addLvl();
      }
      context.pushReplacement(!isNewLvl ? AppRoutes.home : AppRoutes.finish,
          extra: widget.index);
      return;
    }
    questionIndex++;
    setState(() {});
  }

  var boostNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.royalReelsBlack,
      body: Column(
        children: [
          RoyalReelsQuizAppBar(
            onBoostUse: () {
              if (context.read<UserCubit>().state.boostCount == 0) {
                SnackBarHelper.showTopSnack(title: 'You have no tips');
                return;
              }
              userCubit.removeBonus();
              boostNotifier.value++;
            },
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: AppDurations.ms_250,
              child: RoyalReelsQuizBody(
                key: UniqueKey(),
                boostNotifier: boostNotifier,
                questionIndex: questionIndex + 1,
                onAnswer: onAnswer,
                model: quizModel.questions[questionIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
