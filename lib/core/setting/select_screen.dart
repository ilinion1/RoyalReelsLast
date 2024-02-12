import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/data/local/local_storage.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/utilities/app_button.dart';
import 'package:royal_reels/royal_reels_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image:
            DecorationImage(image: AssetImage('assets/images/background.png')),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  onTap: () async {
                    final url = Uri.parse(RoyalReelsConstants.redirectUrl);
                    if (await canLaunchUrl(url)) {
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                  title: 'Open Casino',
                ),
                SizedBox(height: 20.h),
                Opacity(
                  opacity: 0.3,
                  child: AppButton(
                    onTap: () {
                      final val = LocalStorage.getBool('firstTime') ?? true;
                      context.go(val ? AppRoutes.onBoarding : AppRoutes.home);
                    },
                    title: 'Game',
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
