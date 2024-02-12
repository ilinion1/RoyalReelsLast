import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashedLinePainter extends CustomPainter {
  final Offset startPointData;
  final Offset endPointData;
  final bool isLocked;
  DashedLinePainter({
    required this.startPointData,
    required this.endPointData,
    required this.isLocked,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final dashWidth = 5.w;
    final dashSpace = 4.w;
    final endPoint =
        Offset(endPointData.dx + (43 / 2).w, endPointData.dy + (43 / 2).h);
    final startPoint =
        Offset(startPointData.dx + (43 / 2).w, startPointData.dy + (43 / 2).h);
    Paint paint = Paint()
      ..color = isLocked
          ? const Color.fromARGB(255, 199, 199, 199).withOpacity(0.8)
          : Colors.white
      ..strokeWidth = 2.5.sp
      ..strokeCap = StrokeCap.round;

    double distance = (endPoint - startPoint).distance;
    double distanceCovered = 0.0;

    while (distanceCovered < distance) {
      double length = distanceCovered + dashWidth > distance
          ? distance - distanceCovered
          : dashWidth;

      double normalizedX = (endPoint.dx - startPoint.dx) / distance;
      double normalizedY = (endPoint.dy - startPoint.dy) / distance;

      canvas.drawLine(
        startPoint +
            Offset(
                normalizedX * distanceCovered, normalizedY * distanceCovered),
        startPoint +
            Offset(normalizedX * (distanceCovered + length),
                normalizedY * (distanceCovered + length)),
        paint,
      );

      distanceCovered += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
