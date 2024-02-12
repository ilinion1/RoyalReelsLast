import 'package:flutter/material.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';

class BorderWidget extends StatelessWidget {
  const BorderWidget({
    super.key,
    required this.color,
    required this.width,
    required this.child,
    this.bRadius,
    this.shape,
  });
  final double width;
  final Color color;
  final BorderRadius? bRadius;
  final BoxShape? shape;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: bRadius,
        color: color,
        shape: shape ?? BoxShape.rectangle,
      ),
      child: Padding(
        padding: width.toAllPad,
        child: child,
      ),
    );
  }
}
