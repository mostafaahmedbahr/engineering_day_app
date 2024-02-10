import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_navigatiion/navigator.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/pick_image_widget.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
      return Stack(
        children: [
          Image.asset(
            AppImages.login,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            bottom: -40,
            child: Image.asset(
              AppImages.cutLogo,
              width: 155,
              height: 245,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 45),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        AppNavigator.navigatePop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Platform.isIOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            color: AppColors.whiteColor,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            LocaleKeys.enrollIn.tr(),
                            style: AppStyles.textStyle16DarkMainColorW800
                                .copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      AppImages.mainLogo,
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
                const CustomSizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 115,
                  width: 115,
                  child: PickImageWidget(
                    pickedImage: registerProvider.pickedImage,
                    function: () async {
                      await registerProvider.localImagePicker(context: context);
                    },
                  ),
                ),
                const CustomSizedBox(
                  height: 15,
                ),
                Text(
                  LocaleKeys.putProfilePicture.tr(),
                  style: AppStyles.textStyle12WhiteW500,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
