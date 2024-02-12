import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlatformService {
  static bool _isInited = false;
  static void prepare(BuildContext context) {
    if (_isInited) return;
    topPadding = MediaQuery.paddingOf(context).top;
    _isInited = true;
  }

  static late final double topPadding;

  static Future<void> sendToUpdateStore() async {
    final appId = Platform.isAndroid ? 'app_id' : 'app_id';
    final url = Uri.parse(
      Platform.isAndroid
          ? "market://details?id=$appId"
          : "https://apps.apple.com/app/id$appId",
    );
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> sendToUrl(String path) async {
    final url = Uri.parse(path);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
