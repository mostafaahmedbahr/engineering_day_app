import 'package:dotted_border/dotted_border.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_global_app_bar.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_methods/app_methods.dart';
import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/profile/presentation/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_images/app_images.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'انا',
        actions: [
          InkWell(
            onTap: (){
              AppNav.customNavigator(context: context,
                  screen: const EditProfileView(),
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
      body: Padding(
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
                          "مرحبا , عبد الله",
                          style: AppStyles.textStyle16DarkMainColorW800
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        Text(
                          "تحميل السيرة الذاتية : 25",
                          style: AppStyles.textStyle12WhiteW500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(height: 10,),
            const Text("تحميل السيرة الذاتية",
            style: AppStyles.textStyle16DarkMainColorW800,),
            const CustomSizedBox(height: 10,),
            DottedBorder(
              color: Colors.grey,
              strokeWidth: 1,
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.greyColor2,
                  )
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.greyColor,
                        )
                      ),
                      child: Center(
                        child: SvgPicture.asset("assets/images/svgs/upload-cloud-02.svg"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Consumer<ProfileProvider>(builder: (context, profileProvider, child){
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomTextFormField(
                                              controller: profileProvider.cvLinkCon,
                                              hintText: "CV Link",
                                            ),
                                            const CustomSizedBox(height: 20,),
                                            CustomTextFormField(
                                              controller: profileProvider.linkedInCon,
                                              hintText: "linkedIn Link",
                                            ),
                                            const CustomSizedBox(
                                              height: 20,
                                            ),
                                            CustomTextFormField(
                                              readOnly: true,
                                            //  controller: profileProvider.linkedInCon,
                                              onPressed: (){
                                                profileProvider.uploadPdf();
                                              },
                                              hintText: "Upload Pdf",
                                            ),


                                          ],
                                        ),
                                      );
                                    }
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text("اضغط هنا",
                            style: AppStyles.textStyle16DarkMainColorW800,),
                        ),
                         Text("لتحميل سيرتك الذاتية",
                         style: AppStyles.textStyle16WhiteW400.copyWith(
                           color: Colors.grey,
                           fontSize: 14,
                         ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("قم برفع السيرة الذاتية بصيغة pdf",
                          style: AppStyles.textStyle16WhiteW400.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                          ),),
                        const CustomSizedBox(width: 5,),
                        const Icon(Icons.picture_as_pdf , color: Colors.red,
                        size: 15,),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
