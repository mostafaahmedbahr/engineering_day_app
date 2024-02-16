import 'package:dotted_border/dotted_border.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_global_app_bar.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_navigatiion/navigator.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/job_fair/presentation/views/job_fair_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddJobFairView extends StatelessWidget {
  const AddJobFairView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomGlobalAppBar(
        title: 'معرض التوظيف',
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                AppNavigator.navigateTo(context, JobFairView());
              },
              child: const Text(
                "التقديم علي معرض التوظيف",
                style: AppStyles.textStyle16DarkMainColorW800,
              ),
            ),
            Column(
              children: [
                Container(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      text: 'قم برفع السيرة الذاتية بصيغة pdf',
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
