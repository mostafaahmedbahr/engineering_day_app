import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_loading.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/app_validator/app_validator.dart';
import 'package:engineering_day_app/features/auth/login/presentation/view_model/login_provider.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/register_view.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
      return Form(
        key: loginProvider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextFormField(
                controller: loginProvider.emailCon,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  return MyValidators.emailValidator(value);
                },
                hintText: LocaleKeys.email.tr(),
              ),
              const CustomSizedBox(
                height: 24,
              ),
              CustomTextFormField(
                obscureText: loginProvider.isPasswordVisible,
                controller: loginProvider.passwordCon,
                keyboardType: TextInputType.visiblePassword,
                validator: (String? value) {
                  return MyValidators.displayNameValidator(value);
                },
                icon: IconButton(
                  color: AppColors.greyColor,
                  icon: loginProvider.isPasswordVisible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    loginProvider.changePasswordVisible();
                  },
                ),
                hintText: LocaleKeys.password.tr(),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  LocaleKeys.forgetPassword.tr(),
                  style: AppStyles.textStyle12BlackW400,
                ),
              ),
              const CustomSizedBox(
                height: 24,
              ),
              ConditionalBuilder(
                condition: loginProvider.isLoading != true,
                fallback: (context) {
                  return CustomLoading();
                },
                builder: (context) {
                  return CustomButton(
                    onTap: () {
                      // loginProvider.emailCon.text =    "admin@gmail.com";
                      // loginProvider.passwordCon.text = "admin";
                      loginProvider.login(
                        context: context,
                        email: loginProvider.emailCon.text,
                        password: loginProvider.passwordCon.text,
                      );
                      // AppNav.customNavigator(
                      //   context: context,
                      //   screen: const LayoutView(),
                      //   finish: true,
                      // );
                    },
                    height: 52,
                    transparent: true,
                    borderRadius: 32,
                    btnTxt: LocaleKeys.signIn.tr(),
                  );
                },
              ),
              const CustomSizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(LocaleKeys.haveAccount.tr(),
                      style: AppStyles.textStyle12BlackW400),
                  const CustomSizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      AppNav.customNavigator(
                        context: context,
                        screen: const RegisterView(),
                        finish: false,
                      );
                    },
                    child: Text(
                      LocaleKeys.registerForTheForum.tr(),
                      style: AppStyles.textStyle16DarkMainColorW800
                          .copyWith(fontSize: 14),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
