import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsiveService {
  static const phoneDesingeSize = Size(375, 812);

  static getDesingeSize(BuildContext context) {
    return phoneDesingeSize;
  }

  static double getTextHeight(double size) {
    RenderParagraph renderParagraph = RenderParagraph(
      TextSpan(
        text: 'Text',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: size,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    renderParagraph.layout(const BoxConstraints());
    final textHeight = renderParagraph.size.height;
    renderParagraph.dispose();
    return textHeight;
  }
}
