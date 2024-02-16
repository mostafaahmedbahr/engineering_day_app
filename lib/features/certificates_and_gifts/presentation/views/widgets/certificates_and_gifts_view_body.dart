import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/cupertino.dart';

import '../../../../certificates/presentation/views/certificates_view.dart';
import 'certificates_and_gifts_view_body_item.dart';
// ignore: must_be_immutable
class CertificatesAndGiftsViewBody extends StatelessWidget {
  const CertificatesAndGiftsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: CertificatesAndGiftsViewBodyItem(
              title: LocaleKeys.certifications.tr(),
              image: AppImages.cup,
              color: AppColors.darkMainColor2,
              screen: const CertificatesView(),
            ),
          ),
          // const CustomSizedBox(
            // width: 16,
          // ),
          // Expanded(
          //   child: CertificatesAndGiftsViewBodyItem(
          //     title: LocaleKeys.gifts.tr(),
          //     image: AppImages.gift,
          //     color: AppColors.mainColor,
          //     height: 40,
          //     screen: const GiftsView(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
