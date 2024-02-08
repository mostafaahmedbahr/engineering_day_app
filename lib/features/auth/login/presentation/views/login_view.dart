import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/app_validator/app_validator.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/register_view.dart';
import 'package:engineering_day_app/features/layout/presentation/views/layout_view.dart';
import 'package:flutter/material.dart';



class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppImages.login,
                width: double.infinity,
                fit: BoxFit.cover,),
              Positioned(
                left: 0,
                bottom: -40,
                child: Image.asset(AppImages.cutLogo,
                width: 155,
                  height: 245,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
             children: [
                 Text("تسجيل الدخول",
               style: AppStyles.textStyle14WhiteW800.copyWith(
                 fontSize: 16,
               ),),
               Image.asset(AppImages.mainLogo),
             ],
           ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    MyValidators.emailValidator(value);
                    return null;
                  },
                  hintText: "البريد الاليكتروني",
                ),
                const  CustomSizedBox(height: 24,),
                CustomTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    MyValidators.passwordValidator(value);
                    return null;
                  },
                  icon: IconButton(
                    color: AppColors.greyColor,
                    icon:
                    // loginCubit.isVisible
                    //     ? const Icon(Icons.visibility_off):
                    const Icon(Icons.visibility),
                    onPressed: () {
                      // loginCubit.changeSuffixIcon();
                    },
                  ),
                  hintText: "كلمة المرور",

                ),
                const  CustomSizedBox(height: 8,),
                const Align(
                  alignment: Alignment.topLeft,
                  child:  Text("نسيت كلمة المرور ؟",
                  style: AppStyles.textStyle12BlackW400,),
                ),
                const  CustomSizedBox(height: 24,),
                CustomButton(
                    onTap: () {
                      AppNav.customNavigator(context: context,
                          screen:const LayoutView(),
                          finish: true,
                      );
                    },
                  height: 52,
                    transparent: true,
                    borderRadius: 32,
                    btnTxt: "تسجيل الدخول",),
                const  CustomSizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const  Text('ليس لديك حساب؟',
                        style: AppStyles
                            .textStyle12BlackW400
                    ),
                    const CustomSizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        AppNav.customNavigator(context: context,
                          screen:const RegisterView(),
                          finish: false,
                        );
                      },
                      child: Text('التسجيل في الملتقى',
                        style: AppStyles
                            .textStyle16DarkMainColorW800.copyWith(
                            fontSize: 14
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
          // CustomText(
          //   text: LocaleKeys.forgetPassword.tr(),
          //   textColor: AppColors.blackColor,
          //   fontSize: 14,
          // ),

        ],
      ),
    );
  }
}
