import 'package:flutter/material.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {

  PersistentHeader({required this.widget});

  final Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: 320,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.transparent,
        elevation: 0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 320;

  @override
  double get minExtent => 320;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}