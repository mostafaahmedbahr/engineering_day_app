import 'package:engineering_day_app/core/shared_widgets/custom_loading.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class ConditionBuilderWidget extends StatelessWidget {
  const ConditionBuilderWidget({
    super.key,
    required this.widget,
    this.loaderWidget,
    this.loaderColor = AppColors.whiteColor,
    required this.isLoading,
  });

  final Widget widget;

  final Widget? loaderWidget;
  final bool isLoading;
  final Color loaderColor;

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? (loaderWidget ??
            CustomLoading(
              color: loaderColor,
            ))
        : widget;
  }
}
