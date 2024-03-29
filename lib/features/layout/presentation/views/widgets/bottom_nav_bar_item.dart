import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_images/app_images.dart';
import '../../../../../lang/locale_keys.dart';
import '../../view_model/layout_provider.dart';

class BottomNavBarItems extends StatelessWidget {
  const BottomNavBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(
      builder: (context, layoutProvider, child) {
        return BottomNavigationBar(
          backgroundColor: AppColors.whiteColor,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.greyColor,
          elevation: 15,
          type: BottomNavigationBarType.fixed,
          currentIndex: layoutProvider.layoutIndex,
          onTap: (index) {
            // print("indexindexindex ${index}");
            layoutProvider.changeLayoutIndex(index);
            log(index.toString());
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppImages.home,
                  // ignore: deprecated_member_use
                  color: AppColors.mainColor,
                ),
                icon: SvgPicture.asset(
                  AppImages.home,
                  // ignore: deprecated_member_use
                  color: AppColors.greyColor,
                ),
                label: LocaleKeys.home.tr()),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppImages.jobIcon,
                  // ignore: deprecated_member_use
                  color: AppColors.mainColor,
                ),
                icon: SvgPicture.asset(
                  AppImages.jobIcon,
                ),
                label: LocaleKeys.jobs.tr()),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppImages.ticket,
                  // ignore: deprecated_member_use
                  color: AppColors.mainColor,
                ),
                icon: SvgPicture.asset(AppImages.ticket),
                label: LocaleKeys.tickets.tr()),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppImages.award,
                  // ignore: deprecated_member_use
                  color: AppColors.mainColor,
                ),
                icon: SvgPicture.asset(AppImages.award),
                label: LocaleKeys.awards.tr()),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppImages.user,
                  // ignore: deprecated_member_use
                  color: AppColors.mainColor,
                ),
                icon: SvgPicture.asset(AppImages.user),
                label: LocaleKeys.me.tr()),
          ],
        );
      },
    );
  }
}
