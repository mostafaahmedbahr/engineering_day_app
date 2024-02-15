 import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/app_validator/app_validator.dart';
import 'package:engineering_day_app/features/profile/presentation/view_model/profile_provider.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/register/presentation/views/widgets/pick_image_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<ProfileProvider>(builder: (context, profileProvider, child){
        return ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  decoration:   const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:   [
                        Color.fromRGBO(65, 147, 182, 0.53),
                        Color.fromRGBO(133, 209, 205, 0),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_rounded,
                                  color: AppColors.darkMainColor,),
                              ),
                              const  Text("تعديل الملف الشخصي",
                                style: AppStyles.textStyle16DarkMainColorW800,),
                            ],
                          ),
                          TextButton(
                            onPressed: (){},
                            child: const Text("حفظ",
                              style: AppStyles.textStyle16DarkMainColorW800,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    height: 115,
                    width: 115,
                    child: PickImageWidget(
                      pickedImage: profileProvider.pickedImage,
                      function: () async {
                        await profileProvider.localImagePicker(context: context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  /// name
                  CustomTextFormField(
                  controller: profileProvider.nameCon,
                    keyboardType: TextInputType.name,
                    validator: (String? value) {
                      MyValidators.displayNameValidator(value);
                      return null;
                    },
                    hintText: LocaleKeys.typeYourName.tr(),
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  /// date
                  CustomTextFormField(
                    controller: TextEditingController(
                      text: profileProvider.selectedDate != null
                          ? '${profileProvider.selectedDate!.day}/${profileProvider.selectedDate!.month}/${profileProvider.selectedDate!.year}'
                          : '',
                    ),
                    readOnly: true,
                    onPressed: (){
                      profileProvider.selectDateFunction(context);
                    },
                    hintText: "20/07/1999",
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  /// city
                  CustomTextFormField(
                   controller: profileProvider.cityCon,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      MyValidators.displayNameValidator(value);
                      return null;
                    },
                    hintText: LocaleKeys.city.tr(),
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  /// university
                  CustomTextFormField(
                  controller: profileProvider.universityCon,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      MyValidators.displayNameValidator(value);
                      return null;
                    },
                    hintText: LocaleKeys.university.tr(),
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  /// specalization
                  CustomTextFormField(
                    controller: profileProvider.specalizationCon,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      MyValidators.displayNameValidator(value);
                      return null;
                    },
                    hintText: "التخصص",
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  /// college
                  CustomTextFormField(
                    controller: profileProvider.collegeCon,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      MyValidators.displayNameValidator(value);
                      return null;
                    },
                    hintText: LocaleKeys.college.tr(),
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  /// schoolLeve
                  CustomTextFormField(
                   controller: profileProvider.schoolLevelCon,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      MyValidators.displayNameValidator(value);
                      return null;
                    },
                    hintText: LocaleKeys.schoolLevel.tr(),
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),


                  CustomTextFormField(
                     controller: profileProvider.oldPasswordCon,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (String? value) {
                      MyValidators.passwordValidator(value);
                      return null;
                    },
                    hintText: "الرقم السري القديم",
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  CustomTextFormField(
                    controller: profileProvider.newPasswordCon,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (String? value) {
                      MyValidators.repeatPasswordValidator(
                          value : value ,
                        password: profileProvider.oldPasswordCon.text,
                      );
                      return null;
                    },
                    hintText: "الرقم السري الجديد",
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),

          ],
        );
      }
      ),
    ));
  }
}
