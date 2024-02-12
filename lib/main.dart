import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royal_reels/app/app.dart';
import 'package:royal_reels/app/setup.dart';
import 'package:royal_reels/core/data/local/local_storage.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';

Future<void> main() async {
  configureDependencies(getIt);
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await LocalStorage.prepare();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      return runApp(const RoyalReels());
    },
    (error, stack) {
      ('$error , $stack').log();
      //! Handle Uneexpected Errors
      // return runApp(ErrorScreen(error, stack));
    },
  );
}
