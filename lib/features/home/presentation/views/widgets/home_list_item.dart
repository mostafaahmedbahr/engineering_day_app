import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:engineering_day_app/features/home/presentation/views/details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/custom_sized_box.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_styles/app_styles.dart';
import '../../../../../lang/locale_keys.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem(
      {super.key,
      required this.title,
      required this.image,
      required this.type});

  final String title;
  final String image;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 193,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.greyColor2),
      ),
      child: InkWell(
        onTap: (){
          AppNav.customNavigator(
            context: context,
            screen: DetailsScreen(
              image: image,
              title: title,
              type: type,
            ),
            finish: false,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  topLeft: Radius.circular(4),
                ),
                color: AppColors.greyColor2,
              ),
              child: Center(
                child: Text(
                  title,
                  style: AppStyles.textStyle14WhiteW800
                      .copyWith(color: AppColors.mainColor2),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor0,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(image),
                ),
                const CustomSizedBox(
                  height: 13,
                ),
                InkWell(
                  onTap: () {
                    //getStatisticsModel:
                    //                       StatisticsProvider.get(context, listen: false).static,

                  },
                  child: Container(
                    height: 24,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.mainColor2),
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.registerNow.tr(),
                        style: AppStyles.textStyle12WhiteW500
                            .copyWith(color: AppColors.mainColor2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
