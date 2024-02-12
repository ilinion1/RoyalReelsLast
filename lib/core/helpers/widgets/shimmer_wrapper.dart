// import 'package:flutter/material.dart';
// import 'package:royal_reels/core/constants/colors.dart';
// import 'package:royal_reels/core/utilities/app_utilities.dart';

// class ShimmerWrapper extends StatelessWidget {
//   const ShimmerWrapper({
//     super.key,
//     this.height,
//     this.radius,
//     this.margin,
//     this.child,
//     this.width,
//   });
//   final double? height;
//   final double? width;
//   final BorderRadius? radius;
//   final EdgeInsets? margin;
//   final Widget? child;
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       period: AppDurations.s_3,
//       baseColor: AppColors.darkGrey,
//       highlightColor: AppColors.lightGrey,
//       child: child ??
//           Container(
//             margin: margin,
//             width: width,
//             height: height,
//             decoration: BoxDecoration(
//               borderRadius: radius ?? AppBorders.circle_4,
//               color: AppColors.darkGrey,
//             ),
//           ),
//     );
//   }
// }
