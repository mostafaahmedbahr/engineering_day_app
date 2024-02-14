import 'package:engineering_day_app/core/shared_widgets/custom_global_app_bar.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_images/app_images.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'انا',
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "تعديل",
              style: AppStyles.textStyle16DarkMainColorW800,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    AppImages.login,
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    bottom: -0,
                    top: 0,
                    child: Image.asset(
                      AppImages.cutLogo,
                      width: 87,
                      height: 134,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      AppImages.cutLogo,
                      width: 87,
                      height: 134,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          AppImages.userImage,
                          width: 68,
                          height: 68,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "مرحبا , عبد الله",
                          style: AppStyles.textStyle16DarkMainColorW800
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        Text(
                          "تحميل السيرة الذاتية : 25",
                          style: AppStyles.textStyle12WhiteW500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
