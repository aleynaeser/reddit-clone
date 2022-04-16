import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/constants.dart';

class ShimmerCard extends StatelessWidget {
  final double? height, width;
  Column? child;

  ShimmerCard({Key? key, this.height, this.width, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: black,
      highlightColor: black.withOpacity(0.1),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: black.withOpacity(0.1),
        ),
        child: child,
      ),
    );
  }
}
