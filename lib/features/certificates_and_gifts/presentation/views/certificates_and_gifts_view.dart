import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/features/certificates_and_gifts/presentation/views/widgets/certificates_and_gifts_view_body.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_global_app_bar.dart';
import '../../../../core/utils/app_colors/app_colors.dart';
import '../../../certificates/presentation/views/widgets/certificates_view_body.dart';

class CertificatesAndGiftsView extends StatelessWidget {
  const CertificatesAndGiftsView({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomGlobalAppBar(
        title: LocaleKeys.awards.tr(),
      ),
      body: const CertificatesViewBody(),
    ));
  }
}
