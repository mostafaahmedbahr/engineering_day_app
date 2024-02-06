
 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors/app_colors.dart';
import '../utils/app_images/app_images.dart';
import 'custom_sized_box.dart';

//ignore: must_be_immutable
class CustomErrorWidget extends StatelessWidget {
    CustomErrorWidget({super.key , required this.onTap});
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
       // SvgPicture.asset(AppImages.serverErrorImage,
       //  color: AppColors.greyColor,),
        const CustomSizedBox(height: 10,),
        InkWell(
            onTap: onTap,
            child: const Text("Server Error , Please Try Again !!",
            style: TextStyle(
              color: AppColors.mainColor,
            ),),),
      ],
    );
  }
}
