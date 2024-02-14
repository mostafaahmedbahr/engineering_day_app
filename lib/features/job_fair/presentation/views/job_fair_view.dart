import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_global_app_bar.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/job_fair/presentation/dialog/job_cv_qr_dialog.dart';
import 'package:engineering_day_app/features/job_fair/presentation/dialog/job_fair_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobFairView extends StatelessWidget {
  const JobFairView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomGlobalAppBar(
        title: 'معرض التوظيف',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Stack(
                        children: [
                          PDF(
                            enableSwipe: true,
                            swipeHorizontal: true,
                            autoSpacing: false,
                            pageFling: false,
                            onError: (error) {
                              print(error.toString());
                            },
                            onPageError: (page, error) {
                              print('$page: ${error.toString()}');
                            },
                            // onPageChanged: (int page, int total) {
                            //   print('page change: $page/$total');
                            // },
                          ).fromAsset(
                            'assets/images/pngs/file-example.pdf',
                          ),
                          Container(
                            color: AppColors.mainColor2.withOpacity(.1),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [
                                  AppColors.mainColor,
                                  AppColors.mainColor,
                                  AppColors.mainColor,
                                  AppColors.mainColor.withOpacity(.6),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: 'السيرة الذاتية ل',
                                                style: AppStyles
                                                    .textStyle14WhiteW800
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                            TextSpan(
                                              text: 'عبد الله',
                                              style: AppStyles
                                                  .textStyle14WhiteW800,
                                            )
                                          ],
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: 'مرات التحميل : ',
                                                style: AppStyles
                                                    .textStyle14WhiteW800
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                            TextSpan(
                                              text: '25',
                                              style: AppStyles
                                                  .textStyle14WhiteW800,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) {
                                                return const JobCvQrDialog();
                                              });
                                        },
                                        child: SvgPicture.asset(
                                          AppImages.qrIcon,
                                          height: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomButton(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (c) {
                                                  return JobFairDialog();
                                                });
                                          },
                                          transparent: false,
                                          borderRadius: 10,
                                          btnTxt: "اعادة تحميل ",
                                          width: 100),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              left: 0,
                              top: 8,
                              child: Image.asset(
                                AppImages.cutLogo,
                                height: 66,
                                width: 43,
                                fit: BoxFit.cover,
                              )),
                          Positioned(
                              right: -2,
                              bottom: 0,
                              child: Image.asset(
                                AppImages.cutLogo,
                                height: 66,
                                width: 43,
                                fit: BoxFit.cover,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
