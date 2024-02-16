import 'package:engineering_day_app/core/shared_widgets/condition_builder.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_global_app_bar.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/job_fair/presentation/view_model/get_recruitment_cv_provider.dart';
import 'package:engineering_day_app/features/job_fair/presentation/views/widget/no_cv_widget.dart';
import 'package:engineering_day_app/features/job_fair/presentation/views/widget/qr_widget_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddJobFairView extends StatefulWidget {
  const AddJobFairView({super.key});

  @override
  State<AddJobFairView> createState() => _AddJobFairViewState();
}

class _AddJobFairViewState extends State<AddJobFairView> {
  @override
  void initState() {
    RecruitmentCVProvider prov =
        RecruitmentCVProvider.get(context, listen: false);

    prov.getRecruitmentCV(context: context, listen: false).then((value) {
      setState(() {});
      prov.linkedInCon =
          TextEditingController(text: prov.recruitmentCv?.linkedin ?? '');
      prov.cvLinkCon =
          TextEditingController(text: prov.recruitmentCv?.cvLink ?? '');
      prov.pdfLink =
          (prov.recruitmentCv?.cv?.isEmpty ?? true) ? null : prov.recruitmentCv?.cv;

   print("prov.pdfLinkprov.pdfLink ${prov.recruitmentCv?.cv}");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruitmentCVProvider>(
      builder: (BuildContext context, RecruitmentCVProvider provider,
          Widget? child) {
        print(((provider.recruitmentCv?.cv != null &&
                provider.recruitmentCv?.linkedin != null &&
                provider.recruitmentCv?.cvLink != null) &&
            ((provider.recruitmentCv?.cv?.isNotEmpty ?? true) &&
                (provider.recruitmentCv?.linkedin?.isNotEmpty ?? true) &&
                (provider.recruitmentCv?.cvLink?.isNotEmpty ?? true))));
        return Scaffold(
            appBar: CustomGlobalAppBar(
              title: 'معرض التوظيف',
              actions: [
                ((provider.recruitmentCv?.cv == null &&
                            provider.recruitmentCv?.linkedin == null &&
                            provider.recruitmentCv?.cvLink == null) ||
                        ((provider.recruitmentCv?.cv?.isEmpty ?? true) &&
                            (provider.recruitmentCv?.linkedin?.isEmpty ??
                                true) &&
                            (provider.recruitmentCv?.cvLink?.isEmpty ?? true)))
                    ? SizedBox()
                    : InkWell(
                        onTap: () {
                          setState(() {
                            provider.showAddCv = true;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            (provider.showAddCv == true)
                                ? ""
                                : "تعديل السيره الذاتية",
                            style: AppStyles.textStyle16DarkMainColorW800,
                          ),
                        ),
                      ),
              ],
            ),
            backgroundColor: AppColors.whiteColor,
            body: ConditionBuilderWidget(
              isLoading: provider.isLoading,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (((provider.recruitmentCv?.cv == null &&
                                    provider.recruitmentCv?.linkedin == null &&
                                    provider.recruitmentCv?.cvLink == null) ||
                                ((provider.recruitmentCv?.cv?.isEmpty ??
                                        true) &&
                                    (provider
                                            .recruitmentCv?.linkedin?.isEmpty ??
                                        true) &&
                                    (provider.recruitmentCv?.cvLink?.isEmpty ??
                                        true))) ||
                            provider.showAddCv == true) ...[
                          NoCvWidget(provider: provider)
                        ] else
                          QrWidgetImage(
                              getRecruitmentCvModel: provider.recruitmentCv),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
