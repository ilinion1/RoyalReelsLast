import 'package:flutter/material.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/helpers/widgets/app_place_holder.dart';
import 'package:royal_reels/core/services/responsive_service.dart';

class FutureText extends StatelessWidget {
  const FutureText(
    this.text, {
    super.key,
    this.overflow,
    this.align,
    required this.style,
    this.border,
    this.holderWidth,
    this.maxLines,
  });
  final String? text;
  final TextStyle style;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? holderWidth;
  final BorderRadius? border;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final height = ResponsiveService.getTextHeight(style.fontSize!);

    return text == null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              maxLines ?? 1,
              (index) => Padding(
                padding: (height * 0.1).verticPad,
                child: AppPlaceHolder(
                  border: border ?? BorderRadius.circular(height / 5),
                  size: Size(holderWidth ?? double.infinity, height * 0.8),
                ),
              ),
            ),
          )
        : text!.isEmpty
            ? const SizedBox()
            : Text(
                text!,
                key: this.key,
                style: style.copyWith(height: 0),
                maxLines: maxLines,
                overflow: overflow,
                textDirection: TextDirection.ltr,
                textAlign: align,
              );
  }
}
