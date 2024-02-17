import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/app_validator/app_validator.dart';
import 'package:engineering_day_app/features/profile/presentation/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:
          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
        return Form(
          key: profileProvider.formKey,
          child: ListView(
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
                                  "تغيير كلمة المرور",
                                  style: AppStyles.textStyle16DarkMainColorW800,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تغيير كلمة المرور",
                      style: AppStyles.textStyle16DarkMainColorW800,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text("كلمة المرور الحالية"),
                    CustomTextFormField(
                      obscureText: true,
                      controller: profileProvider.oldPasswordCon,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? value) {
                        return MyValidators.passwordValidator(value);
                      },
                      hintText: "كلمة المرور الحالية",
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    Text("كلمة المرور الجديده"),
                    CustomTextFormField(
                      obscureText: true,
                      controller: profileProvider.newPasswordCon,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? value) {
                        return MyValidators.passwordValidator(value);
                      },
                      hintText: "كلمة المرور الجديده",
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    Center(
                      child: CustomButton(
                        width: 200,
                        btnTxt: 'تغيير',
                        onTap: () {
                          profileProvider.changePassword(
                            context: context,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }
}
