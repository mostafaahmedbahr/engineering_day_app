import 'package:dotted_border/dotted_border.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/app_validator/app_validator.dart';
import 'package:engineering_day_app/features/job_fair/presentation/view_model/get_recruitment_cv_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class NoCvWidget extends StatelessWidget {
  RecruitmentCVProvider provider;

  NoCvWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // AppNavigator.navigateTo(context, JobFairView());
            },
            child: const Text(
              "التقديم علي معرض التوظيف",
              style: AppStyles.textStyle16DarkMainColorW800,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              CustomTextFormField(
                controller: provider.linkedInCon,
                keyboardType: TextInputType.text,
                validator: (String? value) =>
                    (((provider.recruitmentCv?.cv == null &&
                                    provider.recruitmentCv?.linkedin == null &&
                                    provider.recruitmentCv?.cvLink == null) ||
                                ((provider.recruitmentCv?.cv?.isEmpty ??
                                        true) &&
                                    (provider
                                            .recruitmentCv?.linkedin?.isEmpty ??
                                        true) &&
                                    (provider.recruitmentCv?.cvLink?.isEmpty ??
                                        true))) ==
                            true)
                        ? MyValidators.urlValidator(value)
                        : MyValidators.urlValidator(value),
                hintText: "رابط السيره الذاتيه",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: provider.cvLinkCon,
                keyboardType: TextInputType.text,
                validator: (String? value) =>
                    (((provider.recruitmentCv?.cv == null &&
                                    provider.recruitmentCv?.linkedin == null &&
                                    provider.recruitmentCv?.cvLink == null) ||
                                ((provider.recruitmentCv?.cv?.isEmpty ??
                                        true) &&
                                    (provider
                                            .recruitmentCv?.linkedin?.isEmpty ??
                                        true) &&
                                    (provider.recruitmentCv?.cvLink?.isEmpty ??
                                        true))) ==
                            true)
                        ? MyValidators.urlValidator(
                            value,
                          )
                        : MyValidators.urlValidator(value),
                hintText: "رابط Linked In",
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  provider.uploadPdf();
                },
                child: Container(
                  height: 230,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SvgPicture.asset(
                          AppImages.pdfIcon,
                          height: 104,
                          width: 83,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 230,
                        width: double.infinity,
                        color: Colors.white60,
                      ),
                      Container(
                        height: 230,
                        width: double.infinity,
                        color: Colors.white60,
                      ),
                      Container(
                        height: 230,
                        width: double.infinity,
                        color: Colors.white60,
                      ),
                      DottedBorder(
                        borderType: BorderType.RRect,
                        color: AppColors.greyColor.withOpacity(.8),
                        dashPattern: [5, 5],
                        radius: Radius.circular(12),
                        padding: EdgeInsets.all(6),
                        child: Container(
                          height: 171,
                          width: double.infinity,
                          child: (provider.pdfLink != null ||
                                  provider.filePdf?.path != null)
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${provider.pdfLink ?? ''}${provider.filePdf?.path ?? ''}",
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "تعديل السيره الذاتيه",
                                        style: AppStyles
                                            .textStyle16DarkMainColorW800,
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.upload,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                    const Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'اضغط هنا ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.mainColor2),
                                          ),
                                          TextSpan(
                                            text: 'لتحميل سيرتك الذاتية',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text:
                                                'قم برفع السيرة الذاتية بصيغة pdf',
                                          ),
                                          WidgetSpan(
                                            child: SvgPicture.asset(
                                              AppImages.pdfIcon,
                                              height: 16,
                                              width: 16,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          CustomButton(
            btnTxt: ((provider.recruitmentCv?.cv == null &&
                            provider.recruitmentCv?.linkedin == null &&
                            provider.recruitmentCv?.cvLink == null) ||
                        ((provider.recruitmentCv?.cv?.isEmpty ?? true) &&
                            (provider.recruitmentCv?.linkedin?.isEmpty ??
                                true) &&
                            (provider.recruitmentCv?.cvLink?.isEmpty ??
                                true))) ==
                    false
                ? "تعديل"
                : "اضافة",
            onTap: () {
              if (((provider.recruitmentCv?.cv == null &&
                          provider.recruitmentCv?.linkedin == null &&
                          provider.recruitmentCv?.cvLink == null) ||
                      ((provider.recruitmentCv?.cv?.isEmpty ?? true) &&
                          (provider.recruitmentCv?.linkedin?.isEmpty ?? true) &&
                          (provider.recruitmentCv?.cvLink?.isEmpty ?? true))) ==
                  false) {
                provider.updateRecruitmentCv(context: context);
              } else {
                provider.addRecruitmentCv(context: context);
              }
            },
          ),
        ],
      ),
    );
  }
}
