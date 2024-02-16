import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/constants/colors.dart';
import 'package:royal_reels/core/constants/royal_reels_pathes.dart';
import 'package:royal_reels/core/data/local/local_storage.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/setting/settings_const.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/bonus_cubit.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  late WebViewController _webViewController;
  bool visibility = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _webViewController = WebViewController()
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            if (url == await decodeBinaryFromSvg("10", context)) {
              if (!mounted) return;
              context.read<UserCubit>().init();
              context.read<BonusCubit>().init();
              final val = LocalStorage.getBool('firstTime') ?? true;
              if (!mounted) return;
              await SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
              ]);
              if (!mounted) return;
              context.go(val ? AppRoutes.onBoarding : AppRoutes.home);
            } else {
              visibility = false;
              setState(() {});
            }
          },
        ),
      );
    initUrl();
  }

  void initUrl() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    _webViewController
        .loadRequest(Uri.parse(await decodeBinaryFromSvg("10", context)));
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.royalReelsBlack,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(
                controller: _webViewController,
              ),
              if (visibility)
                ColoredBox(
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
            ],
          ),
        ),
        bottomNavigationBar: visibility
            ? null
            : OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  return SizedBox(
                    height: orientation == Orientation.portrait ? 25.h : 50.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          color: Colors.white,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () async {
                            if (await _webViewController.canGoBack()) {
                              _webViewController.goBack();
                            }
                          },
                        ),
                        const SizedBox.shrink(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          color: Colors.white,
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () async {
                            if (await _webViewController.canGoForward()) {
                              _webViewController.goForward();
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
