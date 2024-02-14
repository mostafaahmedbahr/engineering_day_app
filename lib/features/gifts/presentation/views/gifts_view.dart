import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/features/gifts/presentation/views/widgets/gifts_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_global_app_bar.dart';
import '../../../../core/utils/app_colors/app_colors.dart';
import '../../../../lang/locale_keys.dart';

class GiftsView extends StatelessWidget {
  const GiftsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomGlobalAppBar(
        title: LocaleKeys.gifts.tr(),
      ),
      body: const GiftsViewBody(),
    ));
  }
}
