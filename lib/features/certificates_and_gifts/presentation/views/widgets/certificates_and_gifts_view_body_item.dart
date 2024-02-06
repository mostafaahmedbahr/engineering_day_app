 import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared_widgets/custom_sized_box.dart';
 import '../../../../../core/utils/app_images/app_images.dart';
import '../../../../../core/utils/app_styles/app_styles.dart';

class CertificatesAndGiftsViewBodyItem extends StatelessWidget {
  const CertificatesAndGiftsViewBodyItem({super.key, required this.title, required this.image, required this.color,required  this.screen , this.height = 50});
  final String title;
  final String image;
  final Color color;
  final double height;
  final dynamic screen;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppNav.customNavigator(context: context,
            screen: screen,
            finish: false,
        );
      },
      child: Stack(
        children: [
          Container(
            height: 164,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color ,
            ),
            child: Column(
              children: [
                  CustomSizedBox(height: height,),
                SvgPicture.asset(image,
                ),
                const CustomSizedBox(height: 17,),
                Text(title,
                  style: AppStyles.textStyle14WhiteW800,),
              ],
            ),
          ),
          Positioned(
              left: 0,
              top: 8,
              child: Image.asset(AppImages.cutLogo,)),

        ],
      ),
    );
  }
}
