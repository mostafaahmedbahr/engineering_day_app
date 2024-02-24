import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_navigatiion/navigator.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/home/presentation/views/web_view_page.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';

import 'home_two_buttons.dart';
import 'intro_video.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> sKey = GlobalKey();
    return Form(
      key: sKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            // DrawerIcon(
            //   sKey: sKey,
            // ),
            IconButton(
                onPressed: () {
                  // https://kauengday.mftcevents.com/newsletter/qr_reader/self_attend/very_secret
                  AppNavigator.navigateTo(context, const WebViewPage());
                },
                icon: const Icon(Icons.qr_code_scanner_outlined,color: AppColors.whiteColor,))
          ]),
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
          const HomeTwoButtons(),
          const CustomSizedBox(
            height: 48,
          ),
          const IntroVideo(),
          const CustomSizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}
