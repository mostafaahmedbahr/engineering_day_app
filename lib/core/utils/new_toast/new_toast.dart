import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

showCustomToast(BuildContext context,
    {String? title, String? description, backGroundColor}) {
  // return Get.snackbar(
  //   title??const OsText(ar: "خطاء", en: "Error").text,
  //   description?? "",
  //   snackPosition: SnackPosition.TOP,
  //   colorText: Colors.white,
  //   borderRadius: 10,
  //   backgroundColor: backGroundColor?? AppColors.error ,
  // );

  return context.showFlash<bool>(
    duration: const Duration(seconds: 2),
    barrierDismissible: true,
    builder: (context, controller) => Builder(
      builder: (context) => FlashBar(
        controller: controller,
        backgroundColor: backGroundColor ?? Colors.red,
        position: FlashPosition.top,
        behavior: FlashBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.all(5.0),
        clipBehavior: Clip.antiAlias,
        title: Text(
          title ?? '',
          style: AppStyles.textStyle25WhiteW900,
        ),
        content: Text(
          title ?? '',
          style: AppStyles.textStyle25WhiteW900,
        ),
      ),
    ),
  );
}
