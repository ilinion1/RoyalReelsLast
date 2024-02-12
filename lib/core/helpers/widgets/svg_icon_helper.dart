import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_reels/core/constants/colors.dart';

class SvgIconHelper extends StatelessWidget {
  const SvgIconHelper({
    super.key,
    this.boxDimension,
    required this.path,
    this.color,
  });
  final String path;
  final double? boxDimension;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: boxDimension,
      child: SvgPicture.asset(
        path,
        fit: BoxFit.contain,
        alignment: Alignment.center,
        color: color,
        theme: SvgTheme(
          currentColor: color ?? AppColors.white,
        ),
      ),
    );
  }
}
