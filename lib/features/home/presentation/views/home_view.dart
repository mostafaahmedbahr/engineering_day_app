import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/home/presentation/views/widgets/home_header.dart';
import 'package:engineering_day_app/features/home/presentation/views/widgets/home_items_list.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> sKey = GlobalKey();
    return Scaffold(
      key: sKey,
      backgroundColor: AppColors.whiteColor,
      // drawer: const Drawer(),
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
                  top: 108,
                  left: 0,
                  child: Image.asset(AppImages.cutLogo2)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    Text(
                      LocaleKeys.forumEvents.tr(),
                      style: AppStyles.textStyle20mainColor2W700.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 24,
                    ),
                    const HomeItemsList(),
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
