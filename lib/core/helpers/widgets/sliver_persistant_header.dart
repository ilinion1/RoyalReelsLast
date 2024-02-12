import 'package:flutter/material.dart';

class MyPinnedDelegate extends SliverPersistentHeaderDelegate {
  const MyPinnedDelegate({required this.child, required this.height});
  final Widget child;
  final double height;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height; // Maximum height of the header when expanded

  @override
  double get minExtent => height; // Minimum height of the header when collapsed

  @override
  bool shouldRebuild(MyPinnedDelegate oldDelegate) {
    return false;
  }
}
