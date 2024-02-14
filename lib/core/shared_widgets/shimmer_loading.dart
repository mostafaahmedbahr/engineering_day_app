import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors/app_colors.dart';


class SimmerLoading extends StatelessWidget {
  const SimmerLoading({super.key, required this.height, required this.width, required this.raduis});
  final double height;
  final double width;
  final double raduis;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withOpacity(0.5),
      highlightColor: AppColors.greyColor.withOpacity(0.2),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          border: Border.all(
            color: AppColors.greyColor,
          ),
          borderRadius: BorderRadius.circular(raduis),
        ),
      ),
    );
  }
}
