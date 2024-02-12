import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royal_reels/core/constants/colors.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/helpers/widgets/app_place_holder.dart';
import 'package:royal_reels/core/utilities/app_utilities.dart';

class MyCachedImage extends StatelessWidget {
  const MyCachedImage(
      {this.image,
      super.key,
      this.fit = BoxFit.cover,
      this.size,
      this.isBordered = false,
      this.borderRadius});
  final String? image;
  final BoxFit fit;
  final Size? size;
  final bool isBordered;
  final num? borderRadius;

  factory MyCachedImage.squareImage({
    String? image,
    double? size,
    num? borderRadius,
    Key? key,
  }) {
    return MyCachedImage(
      image: image,
      key: key,
      isBordered: true,
      fit: BoxFit.cover,
      size: Size.square(size ?? 40.sp),
      borderRadius: borderRadius ?? 10.sp,
    );
  }

  Widget parentWrapper({required Widget child}) {
    return size == null
        ? child
        : SizedBox.fromSize(
            size: size,
            child: child,
          );
  }

  Widget borderWrapper({required Widget child}) {
    return isBordered
        ? DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius?.toDouble().circleBorder,
              color: AppColors.lightGrey,
            ),
            child: Padding(
              padding: 1.5.sp.toAllPad,
              child: child,
            ),
          )
        : child;
  }

  @override
  Widget build(BuildContext context) {
    return parentWrapper(
      child: image == null
          ? AppPlaceHolder(border: (borderRadius ?? 10.sp).circleBorder)
          : borderWrapper(
              child: ClipRRect(
                borderRadius: ((borderRadius ?? 0) * 0.8).circleBorder,
                child: CachedNetworkImage(
                  alignment: Alignment.center,
                  fadeInCurve: Curves.linear,
                  fadeOutCurve: Curves.linear,
                  imageUrl: image!,
                  fadeInDuration: AppDurations.ms_250,
                  fadeOutDuration: AppDurations.ms_250,
                  placeholder: (context, url) => const AppPlaceHolder(),
                  fit: fit,
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Icon(
                        Icons.image_outlined,
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
