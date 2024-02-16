import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reels/app/test_screen.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/setting/splash_screen.dart';
import 'package:royal_reels/core/setting/support_screen.dart';
import 'package:royal_reels/royal_reels_features/quiz/view/royal_reels_finally_screen.dart';
import 'package:royal_reels/royal_reels_features/quiz/view/royal_reels_quiz_screen.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_atack_teaching/royal_reels_atach_teaching_screen.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_bonuses/view/get_bonus_screen.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_home/view/royal_reels_home_screen.dart';
import 'package:royal_reels/royal_reels_features/royal_reels_on_boarding/royaL_reels_on_boarding_screen.dart';
import 'package:royal_reels/royal_reels_features/settings/royal_reels_settings.dart';

class AppRoutes {
  static const splashScreen = '/splashScreen';
  static const home = '/home';
  static const onBoarding = '/onBoarding';
  static const adVideoScreen = '/adVideo';
  static const teaching = '/teaching';
  static const quiz = '/quiz';
  static const firstAttack = '/firstAttack';
  static const settings = '/settings';
  static const bonus = '/bonus';
  static const finish = '/finish';

  static String lvl(int index) => '/lvl/$index';
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter appRouter = GoRouter(
  initialLocation: '/support',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) {
        return TestScreen.show ? const TestScreen() : const SplashScreen();
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/support',
      name: 'support',
      builder: (context, state) {
        return const SupportScreen();
      },
    ),
    royalReelsPageRoute(
        path: AppRoutes.onBoarding, child: const RoyalReelsOnBoardingScreen()),
    royalReelsPageRoute(
        path: AppRoutes.home, child: const RoyalReelsHomeScreen()),
    royalReelsPageRoute(
        path: AppRoutes.settings, child: const RoyalReelsSettings()),
    royalReelsPageRoute(
        path: AppRoutes.teaching, child: const RoyalReelsAttackTeaching()),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoutes.quiz,
      name: AppRoutes.quiz.toRouteName,
      pageBuilder: (context, state) {
        return CupertinoPage(
          child: RoyalReelsQuizScreen(
            index: state.extra as int,
          ),
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoutes.bonus,
      name: AppRoutes.bonus.toRouteName,
      builder: (context, state) {
        return const RoyalReelsGetBonusScreen();
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoutes.finish,
      name: AppRoutes.finish.toRouteName,
      builder: (context, state) {
        return RoyalReelsFinallyScreen(
          index: state.extra as int,
        );
      },
    )
  ],
);

GoRoute royalReelsPageRoute(
    {required String path,
    required Widget child,
    GlobalKey<NavigatorState>? key}) {
  return GoRoute(
    parentNavigatorKey: key,
    path: path,
    name: path.toRouteName,
    pageBuilder: (context, state) {
      return CupertinoPage(
        child: child,
      );
    },
  );
}
