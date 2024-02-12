import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/app/bloc_wrapper.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/core/services/platform_service.dart';
import 'package:royal_reels/core/services/responsive_service.dart';
import 'package:royal_reels/core/theme/theme.dart';

class RoyalReels extends StatefulWidget {
  const RoyalReels({super.key});

  @override
  State<RoyalReels> createState() => _RoutesAppState();
}

class _RoutesAppState extends State<RoyalReels> {
  @override
  Widget build(BuildContext context) {
    PlatformService.prepare(context);
    return RoyalReelsBlocWrapper(
      ScreenUtilInit(
        designSize: ResponsiveService.getDesingeSize(context),
        builder: (context, child) => MaterialApp.router(
          title: 'Routes 365',
          theme: AppTheme.getTheme(Brightness.light, context),
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          builder: (context, child) {
            return Navigator(
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: const TextScaler.linear(1)),
                      child: child!,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
