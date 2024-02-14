import 'package:cherry_toast/cherry_toast.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';


class NewToast
{

  static showNewSuccessToast({
    required String msg,
    required BuildContext context,
  }) =>
      CherryToast.success(
        width: MediaQuery.of(context).size.width*0.8,
        title:  Text(msg, style: const TextStyle(color: AppColors.blackColor)),
      ).show(context);


  static showNewErrorToast({
    required String msg,
    required BuildContext context,
  }) =>
      CherryToast.error(
        width: MediaQuery.of(context).size.width*0.8,
        title:  Text(msg, style: const TextStyle(color: AppColors.blackColor)),
      ).show(context);
}
