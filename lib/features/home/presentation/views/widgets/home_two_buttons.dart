import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';

class HomeTwoButtons extends StatelessWidget {
  const HomeTwoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CustomButton(
          height: 43,
          width: 136,
          borderRadius: 8,
          backgroundColor: AppColors.mainColor3,
          btnTxt:  LocaleKeys.registerNow.tr(),
          onTap: () {},
        ),
        const CustomSizedBox(
          width: 16,
        ),
        InkWell(
          onTap: (){},
          child: Container(
            height: 43,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.whiteColor),
            ),
            child: Center(
              child: Text(
                LocaleKeys.userGuide.tr(),
                style: AppStyles.textStyle16WhiteW400.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
