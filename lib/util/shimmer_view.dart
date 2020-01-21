import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerView extends StatelessWidget {
  final double h;
  final double w;

  ShimmerView({this.h = double.infinity, this.w = double.infinity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: Shimmer.fromColors(
          child: Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4)),
          ),
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100),
    );
  }
}
