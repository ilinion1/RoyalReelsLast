import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/core/services/responsive_service.dart';
import 'dart:developer' as devtools;

import 'package:royal_reels/core/theme/my_text_theme.dart';

extension Log on Object? {
  void log({StackTrace? stackTrace, String? message}) {
    devtools.log(
      '${toString()} ${message ?? ''}',
      stackTrace: stackTrace,
    );
  }
}

extension L10n on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppTextTheme get textTheme =>
      (Theme.of(this).extensions[TextThemeExtension] as TextThemeExtension)
          .textTheme;
  Size get mqSize => MediaQuery.sizeOf(this);
}

extension GetNavContext on GoRouter {
  String get location => routerDelegate.currentConfiguration.fullPath;

  BuildContext get currentContext =>
      routerDelegate.navigatorKey.currentContext!;
}

extension TextStyleExtension on TextStyle {
  double get widgetHeight => ResponsiveService.getTextHeight(fontSize!);
}
