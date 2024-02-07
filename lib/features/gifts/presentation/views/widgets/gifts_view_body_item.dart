 import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GiftsViewBodyItem extends StatelessWidget {
  const GiftsViewBodyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 48,
      ),
      height: 195,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: AppColors.lightBackGround,
        border: Border.all(
          color: AppColors.mainColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("لديك هدية",
          style: AppStyles.textStyle20mainColor2W700,),
          SvgPicture.asset(AppImages.gift2,width: 94,height: 106,fit: BoxFit.fill,),
        ],
      ),
    );
  }
}
