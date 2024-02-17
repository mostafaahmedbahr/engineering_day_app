import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/features/home/data/models/home_item_model.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';

import 'home_list_item.dart';

class HomeItemsList extends StatelessWidget {
  const HomeItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeItemModel> homeItemsList = [
      HomeItemModel(
          title: LocaleKeys.edamethone.tr(),
          image: AppImages.image1,
          type: "sustainability"),
      HomeItemModel(
          title: LocaleKeys.quizzes.tr(),
          image: AppImages.image2,
          type: "contests"),
      HomeItemModel(
          title: LocaleKeys.engineeringTalks.tr(),
          image: AppImages.image3,
          type: "eng_talks"),
      HomeItemModel(
          title: LocaleKeys.dialogues.tr(),
          image: AppImages.image4,
          type: "dialogues"),
      HomeItemModel(
          title: LocaleKeys.vershAction.tr(),
          image: AppImages.image5,
          type: "workshops"),
    ];
    return DynamicHeightGridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: homeItemsList.length,
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 17,
        builder: (ctx, index) {
          return HomeListItem(
            title: homeItemsList[index].title,
            image: homeItemsList[index].image, type:homeItemsList[index].type ,
          );
        });
  }
}
