// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonWrapper extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  final Color? splashColor;
  final BorderRadius? borderRadius;
  final Widget child;
  const ButtonWrapper({
    super.key,
    required this.onTap,
    this.color,
    this.splashColor,
    this.borderRadius,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      key: key,
      borderRadius: borderRadius,
      color: color,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}
