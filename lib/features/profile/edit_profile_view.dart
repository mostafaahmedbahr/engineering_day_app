import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_loading.dart';
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
  const EditProfileView({super.key,   required this.userName, required this.gender, required this.nationalId, required this.phone, required this.nameInCertificate});

 final String userName ;
 final String gender ;
 final String nationalId ;
 final String phone ;
 final String nameInCertificate ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
        profileProvider.nameCon.text = userName;
        profileProvider.nationalIdCon.text = nationalId;
        profileProvider.phoneCon.text = phone;
        profileProvider.nameInCertificateCon.text = nameInCertificate;
        // profileProvider.selectedGender = gender;

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
                          ConditionalBuilder(
                            condition: profileProvider.isLoading != true,
                            fallback: (context){
                              return CustomLoading();
                            },
                          builder: (context){
                              return  TextButton(
                                onPressed: () async {
                                  String fileName = profileProvider.pickedImage!.path.split("/").last;
                                  MultipartFile image = await MultipartFile.fromFile(
                                    profileProvider.pickedImage!.path,
                                    filename: fileName,
                                  );
                                  profileProvider.editProfileData(
                                    image: image,
                                    context: context,
                                    username: profileProvider.nameCon.text,
                                    gender: profileProvider.selectedGender.toString(),
                                    nationalId:   profileProvider.nationalIdCon.text,
                                    phone:   profileProvider.phoneCon.text,
                                    nameInCertificate:   profileProvider.nameInCertificateCon.text,
                                  );
                                },
                                child: const Text(
                                  "حفظ",
                                  style: AppStyles.textStyle16DarkMainColorW800,
                                ),
                              );
                          },
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


                  /// gender
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      style: const TextStyle(
                        color: AppColors.mainColor,
                      ),
                      hint: Row(
                        children: [
                          const CustomSizedBox(width: 8,),
                          Text(
                            "النوع",
                            style: const  TextStyle(
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                      items: profileProvider.gender.map((gender) =>
                          DropdownMenuItem<String>(
                            value: gender,
                            child: Text(
                              gender,
                              style:  const TextStyle(
                                fontSize: 14,
                                color: AppColors.blackColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                          .toList(),
                      value: profileProvider.selectedGender ,
                      onChanged: (value) {
                        profileProvider.changeSelectGender(value);
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        padding:
                        const EdgeInsetsDirectional.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color.fromRGBO(245, 248, 252, 1),
                          ),
                          color: const Color.fromRGBO(245, 248, 252, 1),
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                        iconSize: 20,
                        iconEnabledColor: AppColors.greyColor,
                        iconDisabledColor: AppColors.greyColor,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.7,
                        padding: null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: AppColors.whiteColor,
                        ),
                        elevation: 8,
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness:
                          MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                          MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                      ),
                    ),
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

                  // /// college
                  // CustomTextFormField(
                  //   controller: profileProvider.collegeCon,
                  //   keyboardType: TextInputType.text,
                  //   validator: (String? value) {
                  //     MyValidators.displayNameValidator(value);
                  //     return null;
                  //   },
                  //   hintText: LocaleKeys.college.tr(),
                  // ),
                  // const CustomSizedBox(
                  //   height: 16,
                  // ),
                  //
                  // /// schoolLeve
                  // CustomTextFormField(
                  //   controller: profileProvider.schoolLevelCon,
                  //   keyboardType: TextInputType.text,
                  //   validator: (String? value) {
                  //     MyValidators.displayNameValidator(value);
                  //     return null;
                  //   },
                  //   hintText: LocaleKeys.schoolLevel.tr(),
                  // ),
                  // const CustomSizedBox(
                  //   height: 16,
                  // ),
                  // CustomTextFormField(
                  //   controller: profileProvider.oldPasswordCon,
                  //   keyboardType: TextInputType.visiblePassword,
                  //   validator: (String? value) {
                  //     MyValidators.passwordValidator(value);
                  //     return null;
                  //   },
                  //   hintText: "الرقم السري القديم",
                  // ),
                  // const CustomSizedBox(
                  //   height: 16,
                  // ),
                  //
                  // CustomTextFormField(
                  //   controller: profileProvider.newPasswordCon,
                  //   keyboardType: TextInputType.visiblePassword,
                  //   validator: (String? value) {
                  //     MyValidators.repeatPasswordValidator(
                  //       value: value,
                  //       password: profileProvider.oldPasswordCon.text,
                  //     );
                  //     return null;
                  //   },
                  //   hintText: "الرقم السري الجديد",
                  // ),
                  // const CustomSizedBox(
                  //   height: 16,
                  // ),
                ],
              ),
            ),
          ],
        );
      }),
    ));
  }
}
