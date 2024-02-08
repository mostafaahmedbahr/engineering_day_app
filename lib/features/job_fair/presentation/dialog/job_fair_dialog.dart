import 'package:engineering_day_app/core/shared_widgets/CustomDivider.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter_new/qr_flutter.dart';

class JobCvQrDialog extends StatelessWidget {
  const JobCvQrDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "السيرة الذاتية ل",
              style: AppStyles.textStyle16DarkMainColorW800
                  .copyWith(color: AppColors.lightMainColor, fontSize: 18),
            ),
            SizedBox(
              height: 16,
            ),
            Image.asset(
              AppImages.userProfileImage,
              height: 66,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "عبد الله محمد",
              style: AppStyles.textStyle16DarkMainColorW800
                  .copyWith(color: AppColors.whiteColor),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '''الرجاء ابراز الكود للشركات
ليتم تحميل السيرة الذاتية''',
              style: AppStyles.textStyle14WhiteW800
                  .copyWith(color: AppColors.whiteColor),
            ),
            SizedBox(
              height: 16,
            ),
            CustomDivider(
              color: Colors.white,
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: QrImageView(
                foregroundColor: AppColors.lightMainColor,
                data: 'Rainbow after the rain',
                version: QrVersions.auto,
                size: 130,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
