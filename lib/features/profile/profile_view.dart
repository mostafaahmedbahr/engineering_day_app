import 'package:engineering_day_app/core/shared_widgets/condition_builder.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_global_app_bar.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:engineering_day_app/core/utils/app_navigatiion/navigator.dart';
import 'package:engineering_day_app/core/utils/app_services/local_services/cache_helper.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/auth/login/presentation/views/login_view.dart';
import 'package:engineering_day_app/features/job_fair/presentation/dialog/job_fair_dialog.dart';
import 'package:engineering_day_app/features/job_fair/presentation/view_model/get_recruitment_cv_provider.dart';
import 'package:engineering_day_app/features/profile/pdf_preview.dart';
import 'package:engineering_day_app/features/profile/presentation/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_images/app_images.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    ProfileProvider.get(context, listen: false)
        .getProfile(context: context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder:
        (BuildContext context, ProfileProvider profileProvider, Widget? child) {
      return Scaffold(
        appBar: CustomGlobalAppBar(
          title: 'انا',
          actions: [
            InkWell(
              onTap: () {
                AppNav.customNavigator(
                  context: context,
                  screen: EditProfileView(
                    userName: "${profileProvider.getProfileModel.username}",
                    nameInCertificate:
                        "${profileProvider.getProfileModel.nameInCertificate}",
                    nationalId: "${profileProvider.getProfileModel.nationalId}",
                    gender: "${profileProvider.getProfileModel.gender}",
                    phone: "${profileProvider.getProfileModel.phone}",
                  ),
                  finish: false,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "تعديل",
                  style: AppStyles.textStyle16DarkMainColorW800,
                ),
              ),
            ),
          ],
        ),
        body: Consumer<ProfileProvider>(
          builder: (BuildContext context, ProfileProvider profileProvider,
              Widget? child) {
            return ConditionBuilderWidget(
              isLoading: profileProvider.isLoading,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.asset(
                            AppImages.login,
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 0,
                            bottom: -0,
                            top: 0,
                            child: Image.asset(
                              AppImages.cutLogo,
                              width: 87,
                              height: 134,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Image.asset(
                              AppImages.cutLogo,
                              width: 87,
                              height: 134,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  AppImages.userImage,
                                  width: 68,
                                  height: 68,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "مرحبا , ${profileProvider.getProfileModel.username}",
                                  style: AppStyles.textStyle16DarkMainColorW800
                                      .copyWith(color: AppColors.whiteColor),
                                ),
                                Text(
                                  "${profileProvider.getProfileModel.email}",
                                  style: AppStyles.textStyle12WhiteW500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSizedBox(
                      height: 10,
                    ),
                    RecruitmentCVProvider.get(context).recruitmentCv?.cv == null
                        ? SizedBox()
                        :      const Text(
                      "مشاهدة السيرة الذاتية",
                      style: AppStyles.textStyle16DarkMainColorW800,
                    ),
                    const CustomSizedBox(
                      height: 10,
                    ),
                    // DottedBorder(
                    //   color: Colors.grey,
                    //   strokeWidth: 1,
                    //   child: Container(
                    //     height: 170,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(
                    //           color: AppColors.greyColor2,
                    //         )),
                    //     width: double.infinity,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         Container(
                    //           height: 40,
                    //           width: 40,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(5),
                    //               border: Border.all(
                    //                 color: AppColors.greyColor,
                    //               )),
                    //           child: Center(
                    //             child: SvgPicture.asset(
                    //                 "assets/images/svgs/upload-cloud-02.svg"),
                    //           ),
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             TextButton(
                    //               onPressed: () {
                    //                 showDialog(
                    //                   context: context,
                    //                   builder: (BuildContext context) {
                    //                     return AlertDialog(
                    //                       content: Consumer<ProfileProvider>(builder:
                    //                           (context, profileProvider, child) {
                    //                         return Padding(
                    //                           padding: const EdgeInsets.symmetric(
                    //                               vertical: 20),
                    //                           child: Column(
                    //                             mainAxisSize: MainAxisSize.min,
                    //                             children: [
                    //                               // CustomTextFormField(
                    //                               //   controller:
                    //                               //       profileProvider.cvLinkCon,
                    //                               //   hintText: "CV Link",
                    //                               // ),
                    //                               // const CustomSizedBox(
                    //                               //   height: 20,
                    //                               // ),
                    //                               // CustomTextFormField(
                    //                               //   controller:
                    //                               //       profileProvider.linkedInCon,
                    //                               //   hintText: "linkedIn Link",
                    //                               // ),
                    //                               // const CustomSizedBox(
                    //                               //   height: 20,
                    //                               // ),
                    //                               // CustomTextFormField(
                    //                               //   readOnly: true,
                    //                               //   //  controller: profileProvider.linkedInCon,
                    //                               //   onPressed: () {
                    //                               //     // profileProvider.uploadPdf();
                    //                               //   },
                    //                               //   hintText: "Upload Pdf",
                    //                               // ),
                    //                             ],
                    //                           ),
                    //                         );
                    //                       }),
                    //                     );
                    //                   },
                    //                 );
                    //               },
                    //               child: const Text(
                    //                 "اضغط هنا",
                    //                 style: AppStyles.textStyle16DarkMainColorW800,
                    //               ),
                    //             ),
                    //             Text(
                    //               "لتحميل سيرتك الذاتية",
                    //               style: AppStyles.textStyle16WhiteW400.copyWith(
                    //                 color: Colors.grey,
                    //                 fontSize: 14,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               "قم برفع السيرة الذاتية بصيغة pdf",
                    //               style: AppStyles.textStyle16WhiteW400.copyWith(
                    //                 color: Colors.grey,
                    //                 fontSize: 14,
                    //               ),
                    //             ),
                    //             const CustomSizedBox(
                    //               width: 5,
                    //             ),
                    //             const Icon(
                    //               Icons.picture_as_pdf,
                    //               color: Colors.red,
                    //               size: 15,
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )

                    RecruitmentCVProvider.get(context).recruitmentCv?.cv == null
                        ? SizedBox()
                        : InkWell(
                            onTap: () async {
                              return AppNavigator.navigateTo(
                                  context,
                                  PDFViewerCachedFromUrl(
                                      url: RecruitmentCVProvider.get(context)
                                              .recruitmentCv!
                                              .cv ??
                                          ''));
                            },
                            child: Container(
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
                                              print(
                                                  '$page: ${error.toString()}');
                                            },
                                            // onPageChanged: (int page, int total) {
                                            //   print('page change: $page/$total');
                                            // },
                                          ).fromUrl(
                                              "${RecruitmentCVProvider.get(context).recruitmentCv?.cv}"),
                                          Container(
                                            color: AppColors.mainColor2
                                                .withOpacity(.1),
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
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomRight,
                                                end: Alignment.topLeft,
                                                colors: [
                                                  AppColors.mainColor,
                                                  AppColors.mainColor,
                                                  AppColors.mainColor,
                                                  AppColors.mainColor
                                                      .withOpacity(.6),
                                                ],
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                                text:
                                                                    'السيرة الذاتية ل',
                                                                style: AppStyles
                                                                    .textStyle14WhiteW800
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                            TextSpan(
                                                              text:
                                                                  '${profileProvider.getProfileModel.username}',
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
                                                              text: profileProvider
                                                                  .getProfileModel
                                                                  .email,
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
                                                                return JobCvQrDialog(
                                                                  name: profileProvider
                                                                          .getProfileModel
                                                                          .username ??
                                                                      '',
                                                                  cvLink: RecruitmentCVProvider.get(
                                                                              context)
                                                                          .recruitmentCv
                                                                          ?.cv ??
                                                                      ''
                                                                          '',
                                                                );
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
                                                            // showDialog(
                                                            //     context: context,
                                                            //     builder: (c) {
                                                            //       return JobFairDialog();
                                                            //     });
                                                            AppNavigator.navigateTo(
                                                                context,
                                                                PDFViewerCachedFromUrl(
                                                                    url: RecruitmentCVProvider.get(context,
                                                                                listen: false)
                                                                            .recruitmentCv!
                                                                            .cv ??
                                                                        ''));
                                                          },
                                                          transparent: false,
                                                          borderRadius: 10,
                                                          btnTxt: "مشاهده ",
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
                          ),

Spacer(),

                CustomButton(btnTxt: "تسجيل الخروج",onTap:(){

                  CacheHelper.sharedPreferences.clear();
                  AppNavigator.navigateOfAll(context, LoginView());
                },backgroundColor: AppColors.redColor,)
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
