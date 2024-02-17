import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_navigatiion/navigator.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/app_validator/app_validator.dart';
import 'package:engineering_day_app/features/profile/change_password_view.dart';
import 'package:engineering_day_app/features/profile/presentation/view_model/profile_provider.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/register/presentation/views/widgets/pick_image_widget.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView(
      {super.key,
      required this.userName,
      required this.gender,
      required this.nationalId,
      required this.phone,
      required this.nameInCertificate});

  final String userName;

  final String gender;

  final String nationalId;

  final String phone;

  final String nameInCertificate;

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  void initState() {
    ProfileProvider provider = ProfileProvider.get(context, listen: false);
    provider.nameCon.text = widget.userName;
    provider.nationalIdCon.text = widget.nationalId;
    provider.phoneCon.text = widget.phone;
    provider.nameInCertificateCon.text = widget.nameInCertificate;
    // profileProvider.selectedGender = gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:
          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
        return ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
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
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: AppColors.darkMainColor,
                                ),
                              ),
                              const Text(
                                "تعديل الملف الشخصي",
                                style: AppStyles.textStyle16DarkMainColorW800,
                              ),
                            ],
                          ),
                          // ConditionalBuilder(
                          //   condition: profileProvider.isLoading != true,
                          //   fallback: (context) {
                          //     return CustomLoading();
                          //   },
                          //   builder: (context) {
                          //     return TextButton(
                          //       onPressed: () async {
                          //
                          //       },
                          //       child: const Text(
                          //         "حفظ",
                          //         style: AppStyles.textStyle16DarkMainColorW800,
                          //       ),
                          //     );
                          //   },
                          // ),
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
                        await profileProvider.localImagePicker(
                            context: context);
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
                    onPressed: () {
                      profileProvider.selectDateFunction(context);
                    },
                    hintText: "20/07/1999",
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  /// nationalId
                  CustomTextFormField(
                    controller: profileProvider.nationalIdCon,
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

                  /// phone
                  CustomTextFormField(
                    controller: profileProvider.phoneCon,
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      MyValidators.phoneValidator(value);
                      return null;
                    },
                    hintText: LocaleKeys.phoneNumber.tr(),
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  /// nameInCertificate
                  CustomTextFormField(
                    controller: profileProvider.nameInCertificateCon,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      MyValidators.displayNameValidator(value);
                      return null;
                    },
                    hintText: LocaleKeys.typeYourName.tr(),
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),

                  CustomButton(
                    width: 200,
                    btnTxt: 'حفظ',
                    onTap: () {
                      profileProvider.editProfileData(
                        context: context,
                        username: profileProvider.nameCon.text,
                        gender: profileProvider.selectedGender.toString(),
                        nationalId: profileProvider.nationalIdCon.text,
                        phone: profileProvider.phoneCon.text,
                        nameInCertificate:
                            profileProvider.nameInCertificateCon.text,
                      );
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    width: 200,
                    btnTxt: 'تغيير كلمة المرور',
                    onTap: () {
                      AppNavigator.navigateTo(context, ChangePasswordView());
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    ));
  }
}
