import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/job_fair/data/models/get_recruitment_cv_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter_new/qr_flutter.dart';

// ignore: must_be_immutable
class QrWidgetImage extends StatelessWidget {
  GetRecruitmentCvModel? getRecruitmentCvModel;

  QrWidgetImage({super.key, required this.getRecruitmentCvModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "يمكنك مشاركة الرمز مع ممثلين الشركات لمشاركة السي في الخاص بك",
          style: AppStyles.textStyle16DarkMainColorW800,
          textAlign: TextAlign.center,
        ),
        if (getRecruitmentCvModel?.cv != null ||
            (getRecruitmentCvModel?.cv?.isNotEmpty ?? true))
          QrImageView(
            data: getRecruitmentCvModel!.cv!,
            size: 150,
          ),
        if (getRecruitmentCvModel?.linkedin != null &&
            (getRecruitmentCvModel?.linkedin?.isNotEmpty ?? true))
          Text(
            "او",
            style: AppStyles.textStyle16DarkMainColorW800,
            textAlign: TextAlign.center,
          ),
        if (getRecruitmentCvModel?.linkedin != null &&
            (getRecruitmentCvModel?.linkedin?.isNotEmpty ?? true))
          QrImageView(
            data: getRecruitmentCvModel!.linkedin!,
            size: 150,
          ),
        if (getRecruitmentCvModel?.cvLink != null &&
            (getRecruitmentCvModel?.cvLink?.isNotEmpty ?? true))
          Text(
            "او",
            style: AppStyles.textStyle16DarkMainColorW800,
            textAlign: TextAlign.center,
          ),
        if (getRecruitmentCvModel?.cvLink != null &&
            (getRecruitmentCvModel?.cvLink?.isNotEmpty ?? true))
          QrImageView(
            data: getRecruitmentCvModel!.cvLink!,
            size: 150,
          )
      ],
    );
  }
}
