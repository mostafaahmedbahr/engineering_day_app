import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';

class MyAppMethods {


  static Future<void> imagePickerDialog({
    required BuildContext context,
    required Function cameraFCT,
    required Function galleryFCT,
    required Function removeFCT,
  }) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  onPressed: () {
                    cameraFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.camera,
                    color: AppColors.whiteColor,
                  ),
                  label: Text(
                    LocaleKeys.camera.tr(),
                    style: AppStyles.textStyle16DarkMainColorW800
                        .copyWith(color: AppColors.whiteColor),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    galleryFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.image, color: AppColors.whiteColor),
                  label: Text(

                    LocaleKeys.gallery.tr(),
                    style: AppStyles.textStyle16DarkMainColorW800
                        .copyWith(color: AppColors.whiteColor),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    removeFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.remove, color: AppColors.whiteColor),
                  label: Text(
                    LocaleKeys.remove.tr(),
                    style: AppStyles.textStyle16DarkMainColorW800
                        .copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
