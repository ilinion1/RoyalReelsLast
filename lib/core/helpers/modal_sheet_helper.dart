import 'package:flutter/material.dart';
// import 'package:royal_reels/features/quiz/view/rewards_sheet_body.dart';

class ModalSheetHelper {
  static BuildContext? _currentContext;
  static const bool _sheetShown = false;

  /// this func pops ModalSheet if its shown and return value for WillPopScoup Widget
  static bool doPop() {
    if (_sheetShown) {
      Navigator.pop(_currentContext!);
      return false;
    }
    return true;
  }

  // static Future<void> showRewards(String? trueIconPath, int rewards) async {
  //   _sheetShown = true;
  //   await showModalBottomSheet(
  //     context: appRouter.currentContext,
  //     useRootNavigator: true,
  //     isScrollControlled: true,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(10.sp),
  //         topRight: Radius.circular(10.sp),
  //       ),
  //     ),
  //     builder: (context) {
  //       _currentContext = context;
  //       return RewardsSheetBody(
  //         iconPath: trueIconPath,
  //         reward: rewards,
  //       );
  //     },
  //   );
  //   _sheetShown = false;
  // }
}
