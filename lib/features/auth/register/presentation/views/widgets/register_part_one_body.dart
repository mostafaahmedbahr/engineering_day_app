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

class RegisterPartOneBody extends StatelessWidget {
  const RegisterPartOneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<RegisterProvider>(builder: (context, registerProvider, child){
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) {
                MyValidators.displayNameValidator(value);
                return null;
              },
              hintText: LocaleKeys.typeYourName.tr(),
            ),
            const CustomSizedBox(height: 16,),
            CustomTextFormField(
              keyboardType: TextInputType.number,
              validator: (String? value) {
                MyValidators.phoneValidator(value);
                return null;
              },
              hintText: LocaleKeys.phoneNumber.tr(),
            ),
            const CustomSizedBox(height: 16,),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) {
                MyValidators.emailValidator(value);
                return null;
              },
              hintText: LocaleKeys.email.tr(),
            ),
            const CustomSizedBox(height: 16,),
            Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration:const BoxDecoration(
                        color: Color.fromRGBO(69, 150, 183, 0.22),
                        borderRadius: BorderRadius.only(
                          topRight:   Radius.circular(24) ,
                          bottomRight:Radius.circular(24) ,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.male),
                          const CustomSizedBox(width: 4,),
                          Text(LocaleKeys.man.tr(),
                            style: AppStyles.textStyle16DarkMainColorW800,),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration:const BoxDecoration(
                        color:Color.fromRGBO(244, 244, 244, 1),
                        borderRadius: BorderRadius.only(
                          topLeft:   Radius.circular(24) ,
                          bottomLeft:Radius.circular(24) ,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.female),
                          const CustomSizedBox(width: 4,),
                          Text(LocaleKeys.woman.tr(),
                            style: AppStyles.textStyle16DarkMainColorW800,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(height: 40,),
            CustomButton(
              onTap: () {
                registerProvider.changePage(registerProvider.currentPage=1);
                registerProvider.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              height: 52,
              transparent: true,
              borderRadius: 32,
              btnTxt: LocaleKeys.next.tr(),
            ),
            const CustomSizedBox(height: 18,),
            Text(LocaleKeys.step1Of3.tr(),
              style:const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(202, 195, 195, 1),
              ),),

          ],
        ),
      );
    }

    );
  }
}
