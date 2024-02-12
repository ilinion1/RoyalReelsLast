import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_reels/core/constants/colors.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';

class RoyalReelsIconButton extends StatelessWidget {
  const RoyalReelsIconButton(
      {super.key,
      required this.size,
      required this.iconPath,
      this.bonusCount,
      this.padding = EdgeInsets.zero,
      this.onTap});
  final double size;
  final String iconPath;
  final int? bonusCount;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final withBonus = bonusCount != null;
    return Stack(
      children: [
        Padding(
          padding: withBonus ? (size * 0.2).toAllPad : EdgeInsets.zero,
          child: Material(
            color: AppColors.black,
            borderRadius: (size * 0.27).circleBorder,
            child: InkWell(
              onTap: onTap,
              borderRadius: (size * 0.27).circleBorder,
              child: Container(
                padding: (size * 0.227).toAllPad,
                height: size,
                width: size,
                child: FittedBox(
                  child: SvgPicture.asset(
                    iconPath,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (withBonus)
          Positioned(
            top: size * 0.81.sp,
            left: size * 0.81.sp,
            child: Container(
              width: size * 0.45,
              height: size * 0.45,
              padding: (size * 0.0).verticPad,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.royalReelsGreen,
              ),
              child: FittedBox(
                child: Text(
                  '$bonusCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 999,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
