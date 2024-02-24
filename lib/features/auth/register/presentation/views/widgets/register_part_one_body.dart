import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/app_validator/app_validator.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegisterPartOneBody extends StatefulWidget {
  RegisterPartOneBody({super.key});

  @override
  State<RegisterPartOneBody> createState() => _RegisterPartOneBodyState();
}

class _RegisterPartOneBodyState extends State<RegisterPartOneBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, provider, child) {
      return Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextFormField(
                controller: provider.emailCtl,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => MyValidators.emailValidator(value),
                hintText: LocaleKeys.email.tr(),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: provider.passwordCtl,
                keyboardType: TextInputType.text,
                validator: (String? value) =>
                    MyValidators.passwordValidator(value),
                hintText: LocaleKeys.password.tr(),
                obscureText: true,
              ),
              const CustomSizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: provider.userNameCtl,
                keyboardType: TextInputType.text,
                validator: (String? value) =>
                    MyValidators.displayNameValidator(value),
                hintText: "الاسم الثلاثي",
              ),
              const CustomSizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: provider.userNameCertCtl,
                keyboardType: TextInputType.text,
                validator: (String? value) =>
                    MyValidators.displayNameValidator(value),
                hintText: "الاسم كما سيظهر بالشهادة",
              ),
              const CustomSizedBox(
                height: 16,
              ),
              Container(
                height: 44,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          provider.isMan = true;
                          setState(() {});
                          print("const $provider.isMan");
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: (provider.isMan == true)
                                ? const Color.fromRGBO(69, 150, 183, 0.22)
                                : const Color.fromRGBO(244, 244, 244, 1),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.male),
                              const CustomSizedBox(
                                width: 4,
                              ),
                              Text(
                                LocaleKeys.man.tr(),
                                style: AppStyles.textStyle16DarkMainColorW800,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          provider.isMan = false;
                          setState(() {});
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: (provider.isMan == false)
                                ? const Color.fromRGBO(69, 150, 183, 0.22)
                                : const Color.fromRGBO(244, 244, 244, 1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              bottomLeft: Radius.circular(24),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.female),
                              const CustomSizedBox(
                                width: 4,
                              ),
                              Text(
                                LocaleKeys.woman.tr(),
                                style: AppStyles.textStyle16DarkMainColorW800,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: provider.nationalCrl,
                keyboardType: TextInputType.number,
                // validator: (String? value) =>
                //     MyValidators.displayNameValidator(value),
                hintText: "رقم الهوية",
              ),
               const CustomSizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: provider.phoneCtrl,
                keyboardType: TextInputType.phone,
                validator: (String? value) =>
                    MyValidators.displayNameValidator(value),
                hintText: "رقم الجوال*",
              ),
              const CustomSizedBox(
                height: 40,
              ),
              CustomButton(
                onTap: () {
                  provider.register1(context: context);
                },
                height: 52,
                transparent: true,
                borderRadius: 32,
                btnTxt: LocaleKeys.next.tr(),
              ),
              const CustomSizedBox(
                height: 18,
              ),
              Text(
                LocaleKeys.step1Of3.tr(),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(202, 195, 195, 1),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
