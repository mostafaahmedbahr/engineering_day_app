import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared_widgets/custom_sized_box.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_images/app_images.dart';
import '../../../../../core/utils/app_styles/app_styles.dart';

class ChartsListItem extends StatelessWidget {
  const ChartsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent ,
          border: Border.all(
            color: AppColors.whiteColor,
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomSizedBox(height: 10,),
          SvgPicture.asset(AppImages.profile,
          ),
          const Text("52",
            style: AppStyles.textStyle25WhiteW900,),
          const Text("زوار التطبيق",
            style: AppStyles.textStyle12WhiteW500,),
          const CustomSizedBox(height: 10,),
        ],
      ),
    );
  }
}
