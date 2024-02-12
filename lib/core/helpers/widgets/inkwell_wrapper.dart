import 'package:flutter/material.dart';

class InkWrapper extends StatelessWidget {
  const InkWrapper({
    super.key,
    required this.child,
    this.onTap,
    this.splashColor,
    this.bgColor,
    this.borderRadius = BorderRadius.zero,
  });
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius borderRadius;
  final Color? splashColor;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: borderRadius,
      child: InkWell(
        splashColor: splashColor,
        borderRadius: borderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
