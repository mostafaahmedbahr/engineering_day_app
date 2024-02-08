import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/home/presentation/views/widgets/home_list_item.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';

import '../../data/models/home_item_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});



  @override
  Widget build(BuildContext context) {
    List<HomeItemModel> homeItemsList  = [
      HomeItemModel(
        title: LocaleKeys.edamethone.tr(),
        image: AppImages.svgexport,
      ),
      HomeItemModel(
        title: LocaleKeys.quizzes.tr(),
        image: AppImages.svgexport2,
      ),
      HomeItemModel(
        title: LocaleKeys.engineeringTalks.tr(),
        image: AppImages.svgexport3,
      ),
      HomeItemModel(
        title: LocaleKeys.dialogues.tr(),
        image: AppImages.svgexport4,
      ),
      HomeItemModel(
        title: LocaleKeys.vershAction.tr(),
        image: AppImages.svgexport5,
      ),
    ];
    final GlobalKey<ScaffoldState> sKey = GlobalKey();
    return Scaffold(
      key: sKey,
      backgroundColor: AppColors.whiteColor,
      drawer: const Drawer(),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 637,
                child: Image.asset(
                  AppImages.background,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 108, left: 0, child: Image.asset(AppImages.cutLogo2)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        sKey.currentState?.openDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        color: AppColors.whiteColor,
                        size: 32,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 23,
                    ),
                    Text(
                      LocaleKeys.reserve.tr(),
                      style: AppStyles.textStyle32WhiteW700,
                    ),
                    const CustomSizedBox(
                      height: 22,
                    ),
                    Text(
                      LocaleKeys.homeDes.tr(),
                      style: AppStyles.textStyle16WhiteW400,
                    ),
                    const CustomSizedBox(
                      height: 33,
                    ),
                    Row(
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
                    ),
                    const CustomSizedBox(
                      height: 48,
                    ),
                    Container(
                      height: 181,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red
                      ),
                    ),
                    const CustomSizedBox (
                      height: 64,
                    ),
                    Text(
                      LocaleKeys.forumEvents.tr(),
                      style: AppStyles.textStyle20mainColor2W700.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 24,
                    ),
                    DynamicHeightGridView(
                      shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: homeItemsList.length,
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 17,
                        builder: (ctx, index) {
                          return     HomeListItem(
                            title: homeItemsList[index].title,
                            image: homeItemsList[index].image,
                          );
                        }
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
