import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/royal_reels_pathes.dart';
import 'package:royal_reels/core/constants/colors.dart';
import 'package:royal_reels/core/data/local/local_storage.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/royal_reels_constants.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/bonus_cubit.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startLoadingProgress();
    super.initState();
  }

  void startLoadingProgress() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      initRoyalReelsApp();
      setState(() {
        loadingStarted = true;
      });
    });
  }

  Future<void> initRoyalReelsApp() async {
    context.read<UserCubit>().init();
    context.read<BonusCubit>().init();
    await Future.delayed(duration - 100.msDuration, () async {
      if (DateTime.now().millisecondsSinceEpoch >=
          RoyalReelsConstants.dateTime.millisecondsSinceEpoch) {
        final url = Uri.parse(RoyalReelsConstants.redirectUrl);
        if (await canLaunchUrl(url)) {
          launchUrl(url, mode: LaunchMode.externalApplication);
        }
      }
      final val = LocalStorage.getBool('firstTime') ?? true;
      context.go(val ? AppRoutes.onBoarding : AppRoutes.home);
    });
  }

  var loadingStarted = false;

  final duration = const Duration(seconds: 2, milliseconds: 50);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.royalReelsBlack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 45.h,
          ),
          SvgPicture.asset(
            Pathes.royalReelslogoR,
            height: 80.h,
          ),
          Container(
            width: context.mqSize.width,
            margin: 95.w.horizPad.add(55.topPad),
            height: 2.5.h,
            decoration: BoxDecoration(
              borderRadius: 8.circleBorder,
              color: AppColors.royalReelsLightGrey,
            ),
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              height: double.infinity,
              duration: duration,
              width: loadingStarted ? context.mqSize.width - (95.w * 2) : 0,
              decoration: BoxDecoration(
                borderRadius: 8.circleBorder,
                color: AppColors.royalReelsOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
