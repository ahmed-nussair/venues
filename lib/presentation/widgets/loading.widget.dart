import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class Loading extends StatelessWidget {
  final double? width, height, radius;
  final Alignment alignment;
  const Loading(
      {super.key,
      this.width,
      this.height = 8,
      this.radius = 8,
      this.alignment = Alignment.center});
  @override
  Widget build(BuildContext context) {
    return SkeletonLine(
      style: SkeletonLineStyle(
        alignment: alignment,
        height: height,
        width: width,
        borderRadius: BorderRadius.circular(radius ?? 8),
      ),
    );
  }
}
