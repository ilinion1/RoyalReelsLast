import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/utilities/app_utilities.dart';

class OverlayHelper {
  static OverlayEntry? _entry;

  static remove() {
    _entry?.remove();
  }

  static Future<void> showBonus(Widget body) async {
    var ovv = Overlay.of(appRouter.currentContext);
    _entry = OverlayEntry(
      builder: (context) {
        return body;
      },
    );
    ovv.insert(_entry!);
  }

  static Future<void> showLoading() async {
    var ovv = Overlay.of(appRouter.currentContext);
    _entry = OverlayEntry(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(.5),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: AppBorders.blackBorder,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                GestureDetector(
                  onTap: () {
                    'GestureTap'.log();
                  },
                  child: const Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                8.verticalSpace,
                const CircularProgressIndicator()
              ],
            ),
          ),
        );
      },
    );
    ovv.insert(_entry!);
  }
}
