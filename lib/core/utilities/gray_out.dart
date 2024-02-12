import 'package:flutter/cupertino.dart';

class GrayOutWrapper extends StatelessWidget {
  const GrayOutWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0,
        0,
        0,
        1,
        0
      ]),
      child: child,
    );
  }
}
