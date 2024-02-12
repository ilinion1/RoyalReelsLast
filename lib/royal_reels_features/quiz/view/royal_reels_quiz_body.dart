import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/constants/colors.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/services/responsive_service.dart';
import 'package:royal_reels/core/utilities/app_utilities.dart';
import 'package:royal_reels/royal_reels_features/quiz/business/models/quiz_model.dart';

class RoyalReelsQuizBody extends StatefulWidget {
  const RoyalReelsQuizBody({
    super.key,
    required this.onAnswer,
    required this.model,
    required this.questionIndex,
    required this.boostNotifier,
  });
  final void Function(bool answer) onAnswer;
  final QuestionModel model;
  final int questionIndex;
  final ValueNotifier boostNotifier;
  @override
  State<RoyalReelsQuizBody> createState() => _RoyalReelsQuizBodyState();
}

class _RoyalReelsQuizBodyState extends State<RoyalReelsQuizBody> {
  @override
  void initState() {
    timer();
    widget.boostNotifier.addListener(boostListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.boostNotifier.removeListener(boostListener);
    super.dispose();
  }

  final timeLeft = ValueNotifier(30);
  String? selectedVal;

  Future<void> answer(String val) async {
    if (selectedVal != null) return;
    selectedVal = val;
    setState(() {});
    await Future.delayed(1200.msDuration);
    widget.onAnswer(widget.model.correctAnswer == val);
  }

  void boostListener() {
    answer(widget.model.correctAnswer);
  }

  void timer() async {
    while (timeLeft.value != 0 && selectedVal == null) {
      await Future.delayed(1000.msDuration);
      if (mounted) {
        timeLeft.value--;
      }
    }
    if (selectedVal != null) return;
    if (mounted) {
      widget.onAnswer(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        47.verticalSpace,
        Padding(
          padding: 24.w.horizPad,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.questionIndex}/9',
                style: TextStyle(
                  color: AppColors.royalReelsOrange,
                  fontSize: 28.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: timeLeft,
                  builder: (context, val, _) {
                    return Text(
                      '00:${val >= 10 ? val : '0$val'}',
                      style: TextStyle(
                        color: val < 5
                            ? const Color.fromARGB(255, 255, 58, 44)
                            : AppColors.royalReelsLightGrey,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: 20.w.horizPad,
              child: Text(
                widget.model.question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 26.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: 20.w.horizPad,
          child: Row(
            children: List.generate(
              2,
              (index) {
                final item = widget.model.options.entries.toList()[index];
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      answer(item.key);
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      padding: 5.h.verticPad.add(2.w.horizPad),
                      margin: 4.w.horizPad,
                      width: double.maxFinite,
                      duration: AppDurations.ms_100,
                      height:
                          (ResponsiveService.getTextHeight(12.sp) * 3) + 10.h,
                      decoration: BoxDecoration(
                        color: selectedVal == item.key
                            ? item.key == widget.model.correctAnswer
                                ? AppColors.royalReelsGreen
                                : AppColors.royalReelsOrange
                            : AppColors.royalReelsDarkBlue,
                        borderRadius: 12.sp.circleBorder,
                      ),
                      child: Text(
                        item.value,
                        textAlign: TextAlign.center,
                        maxLines: 2312,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: 20.w.horizPad.add(8.h.topPad),
          child: Row(
            children: List.generate(
              2,
              (index) {
                final item = widget.model.options.entries.toList()[index + 2];
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      answer(item.key);
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      padding: 5.h.verticPad.add(2.w.horizPad),
                      margin: 4.w.horizPad,
                      width: double.maxFinite,
                      duration: AppDurations.ms_100,
                      height:
                          (ResponsiveService.getTextHeight(12.sp) * 3) + 10.h,
                      decoration: BoxDecoration(
                        color: selectedVal == item.key
                            ? item.key == widget.model.correctAnswer
                                ? AppColors.royalReelsGreen
                                : AppColors.royalReelsOrange
                            : AppColors.royalReelsDarkBlue,
                        borderRadius: 12.sp.circleBorder,
                      ),
                      child: Text(
                        item.value,
                        textAlign: TextAlign.center,
                        maxLines: 2312,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        (context.mqSize.height * 0.15).verticalSpace
      ],
    );
  }
}
