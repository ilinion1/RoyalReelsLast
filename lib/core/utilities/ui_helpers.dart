import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelpers {
  static Paint textStroke(Color color, {double? width}) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.sp
      ..color = color;
  }
}
