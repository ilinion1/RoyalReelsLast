import 'package:flutter/material.dart';
import 'package:royal_reels/core/constants/colors.dart';

class AppPlaceHolder extends StatelessWidget {
  const AppPlaceHolder({super.key, this.border, this.size});
  final BorderRadius? border;
  final Size? size;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: border,
        color: AppColors.lightGrey,
      ),
      child: size != null
          ? SizedBox.fromSize(
              size: size,
            )
          : const SizedBox.expand(),
    );
  }
}
