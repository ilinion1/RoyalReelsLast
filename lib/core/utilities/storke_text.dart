import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  const StrokeText(
    this.text, {
    super.key,
    this.align = Alignment.center,
    required this.stColor,
    required this.width,
  });
  final Text text;
  final Alignment align;
  final Color stColor;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: align,
      children: <Widget>[
        Text(
          '${text.data}',
          style: TextStyle(
            fontSize: text.style?.fontSize,
            fontWeight: text.style?.fontWeight,
            fontFamily: text.style?.fontFamily,
            shadows: text.style?.shadows,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = width
              ..color = stColor,
          ),
        ),
        text,
      ],
    );
  }
}
