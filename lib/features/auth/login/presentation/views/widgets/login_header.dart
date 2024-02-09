import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
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
        Column(
          children: [
            Text(
            LocaleKeys.signIn.tr(),
              style: AppStyles.textStyle14WhiteW800.copyWith(
                fontSize: 16,
              ),
            ),
            Image.asset(AppImages.mainLogo),
          ],
        ),
      ],
    );
  }
}
