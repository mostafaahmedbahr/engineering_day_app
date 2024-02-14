import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:flutter/material.dart';

class JobFairDialog extends StatelessWidget {
  const JobFairDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "معرض التوظيف",
              style: AppStyles.textStyle16DarkMainColorW800
                  .copyWith(color: AppColors.whiteColor),
            ),
            Text(
              "السيرة الذاتية",
              style: AppStyles.textStyle14WhiteW800
                  .copyWith(color: AppColors.whiteColor),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    btnTxt: "اعادة تحميل",
                    onTap: () {},
                  ),
                )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      btnTxt: "حذف",
                      backgroundColor: AppColors.redColor,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
