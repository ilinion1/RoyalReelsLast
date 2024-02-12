import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/helpers/snack_bar_helper.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:rate_my_app/rate_my_app.dart';

class DialogHelper {
  static bool _isDialogShown = false;
  static BuildContext? _currentContext;
  static bool doPop() {
    if (_isDialogShown) {
      Navigator.pop(_currentContext!);
      return false;
    }
    return true;
  }

  static Future<void> showRateDialog() async {
    final rater = RateMyApp(
      minDays: 0,
      minLaunches: 0,
      remindDays: 0,
      remindLaunches: 0,
    );
    await rater.init().then((value) async {
      await rater.showRateDialog(appRouter.currentContext);
    });
  }

  static Future<void> showAlertDialog({
    required String content,
    required String? title,
    required VoidCallback onConfirm,
    required String confirmText,
  }) async {
    final String parsedTitle = title ?? '';
    SnackBarHelper.showTopSnack(
      title: '$parsedTitle $content',
    );
    return;
    final context = appRouter.currentContext;
    await showDialog(
      context: context,
      builder: (context) {
        _currentContext = context;
        _isDialogShown = true;
        return ConfirmingDialog(
          confirmText: confirmText,
          title: title,
          content: content,
          onConfirm: onConfirm,
        );
      },
    );
    _isDialogShown = false;
  }
}

class ConfirmingDialog extends StatelessWidget {
  const ConfirmingDialog({
    super.key,
    required this.content,
    required this.onConfirm,
    this.title,
    required this.confirmText,
  });
  final String content;
  final String? title;
  final VoidCallback onConfirm;
  final String confirmText;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: title == null
          ? null
          : Text(
              title!,
              style: context.theme.textTheme.titleLarge!.copyWith(
                fontSize: 16.sp,
              ),
            ),
      content: Text(
        content,
        style: context.theme.textTheme.titleLarge!.copyWith(
          fontSize: 16.sp,
        ),
      ),
      actions: [
        TextButton(
          style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent)),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent)),
          onPressed: onConfirm,
          child: Text(
            confirmText,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
