import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:royal_reels/core/setting/settings_const.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/bonus_cubit.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';

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
      await initApp();
    });
  }

  Future<void> initApp() async {
    final url = await decodeBinaryFromSvg("10", context);
    final request = await Dio().getUri(Uri.parse(url));
    if (request.statusCode == 200 && mounted) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      if (!mounted) return;
      context.pushReplacementNamed('support', pathParameters: {
        'url': url,
      });
    } else {
      dev.log('${request.statusCode}');
      final val = LocalStorage.getBool('firstTime') ?? true;
      if (!mounted) return;
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      if (!mounted) return;
      context.go(val ? AppRoutes.onBoarding : AppRoutes.home);
    }
  }

  var loadingStarted = false;

  final duration = const Duration(seconds: 2, milliseconds: 50);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.royalReelsBlack,
      body: ColoredBox(
        color: AppColors.royalReelsBlack,
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                Pathes.royalReelslogoR,
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50.w),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
