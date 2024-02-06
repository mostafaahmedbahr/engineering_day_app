 import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

 import '../utils/app_styles/app_styles.dart';

class CustomGlobalAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomGlobalAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          backgroundColor: AppColors.whiteColor,
          centerTitle: false,
          elevation: 0,
          title:   Text(title,
          style: AppStyles.textStyle16DarkMainColorW800,),

        ));
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
