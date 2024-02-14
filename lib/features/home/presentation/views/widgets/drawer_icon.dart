import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key, required this.sKey});
  final GlobalKey<ScaffoldState>  sKey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        sKey.currentState?.openDrawer();
      },
      child: const Icon(
        Icons.menu,
        color: AppColors.whiteColor,
        size: 32,
      ),
    );
  }
}
