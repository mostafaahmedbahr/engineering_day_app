import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../view_model/layout_provider.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<LayoutProvider>(context);
    return Consumer<LayoutProvider>(builder: (context, layoutProvider, child) {
      return Scaffold(
        body: PageView(
          controller: layoutProvider.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: layoutProvider.pages,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: layoutProvider.layoutIndex,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 2,
          height: kBottomNavigationBarHeight,
          onDestinationSelected: (index) {
            layoutProvider.changeLayoutIndex(index);
          },
          destinations: [
            NavigationDestination(
              selectedIcon: SvgPicture.asset(AppImages.home),
              icon: SvgPicture.asset(AppImages.home),
              label: S.of(context).home,
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(AppImages.chart),
              icon: SvgPicture.asset(AppImages.chart),
              label: "Search",
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(AppImages.award),
              icon: SvgPicture.asset(AppImages.award),
              label: "Cart",
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(AppImages.ticket),
              icon: SvgPicture.asset(AppImages.ticket),
              label: "Profile",
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(AppImages.user),
              icon: SvgPicture.asset(AppImages.user),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
