import 'package:engineering_day_app/core/shared_widgets/custom_divider.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter_new/qr_flutter.dart';

// ignore: must_be_immutable
class JobCvQrDialog extends StatelessWidget {
  String name;
  String  cvLink;

   JobCvQrDialog({super.key,required this.name,required this.cvLink});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "السيرة الذاتية ل",
              style: AppStyles.textStyle16DarkMainColorW800
                  .copyWith(color: AppColors.lightMainColor, fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            Image.asset(
              AppImages.userProfileImage,
              height: 66,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              name,
              style: AppStyles.textStyle16DarkMainColorW800
                  .copyWith(color: AppColors.whiteColor),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '''الرجاء ابراز الكود للشركات
ليتم تحميل السيرة الذاتية''',
              style: AppStyles.textStyle14WhiteW800
                  .copyWith(color: AppColors.whiteColor),
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomDivider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: QrImageView(
                // ignore: deprecated_member_use
                foregroundColor: AppColors.lightMainColor,
                data: cvLink,
                version: QrVersions.auto,
                size: 130,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
