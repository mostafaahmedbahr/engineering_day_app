import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared_widgets/custom_sized_box.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_images/app_images.dart';
import '../../../../../core/utils/app_styles/app_styles.dart';

class ChartsListItem extends StatelessWidget {
  const ChartsListItem({super.key, required this.name, required this.visitorsNumbers, required this.title, required this.image});
 final String name;
 final int visitorsNumbers;
 final String title;
 final String image;
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
          SvgPicture.asset(image,
          ),
          const Text("52",
            style: AppStyles.textStyle25WhiteW900,),
            Text(title,
            style: AppStyles.textStyle12WhiteW500,),
          const CustomSizedBox(height: 10,),
        ],
      ),
    );
  }
}
