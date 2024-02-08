import 'package:easy_localization/easy_localization.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared_widgets/custom_sized_box.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
 import '../../../../../core/utils/app_styles/app_styles.dart';
import '../../../../../lang/locale_keys.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:190 ,
      width: 193,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.whiteColor,
        border: Border.all(
            color: AppColors.greyColor2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4) ,
                topLeft:  Radius.circular(4) ,
              ),
              color: AppColors.greyColor2,
            ),
            child: Center(
              child: Text(title,
                style: AppStyles.textStyle14WhiteW800.copyWith(
                    color: AppColors.mainColor2
                ),),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:const EdgeInsets.all(12),
                height:70,
                width: 70,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 0.15),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SvgPicture.asset(image),
              ),
              const CustomSizedBox(height: 13,),
              InkWell(
                onTap: (){},
                child: Container(
                  height: 24,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.mainColor2),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.registerNow.tr(),
                      style: AppStyles.textStyle12WhiteW500.copyWith(
                          color: AppColors.mainColor2
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
