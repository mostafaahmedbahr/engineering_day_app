import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_images/app_images.dart';

class CertificatesViewBodyItem extends StatelessWidget {
  const CertificatesViewBodyItem({super.key, required this.name, required this.url});
 final String name;
 final String url;
  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(url);
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }
    return Stack(
      children: [

        Container(
          height: 184,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.darkMainColor2 ,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,
              style: AppStyles.textStyle14WhiteW800.copyWith(
                fontSize: 20,
              ),),
              const CustomSizedBox(height: 27,),
              InkWell(
                onTap: (){
                  _launchUrl();
                },
                child: Container(
                  height: 40,
                  width: 153,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  child: Center(
                    child: Text(LocaleKeys.showDetails.tr(),
                      style: AppStyles.textStyle14WhiteW800.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            right: 0,
            top: 50,
            child: SvgPicture.asset(AppImages.cubOpacity,
              height: 78,
              width: 73,
              fit: BoxFit.cover,)),
        Positioned(
            left: 0,
            top: 8,
            child: Image.asset(AppImages.cutLogo,
            height: 135,
            width: 98,
            fit: BoxFit.cover,)),




      ],
    );
  }
}
