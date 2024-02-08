 import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
 import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/app_validator/app_validator.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterPartOne extends StatelessWidget {
  const RegisterPartOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, registerProvider, child){
      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(AppImages.login,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  bottom: -40,
                  child: Image.asset(AppImages.cutLogo,
                    width: 155,
                    height: 245,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14 , vertical: 45),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("التسجيل في",
                            style: AppStyles.textStyle14WhiteW800.copyWith(
                              fontSize: 16,
                            ),),
                          Image.asset(AppImages.mainLogo,
                            height: 60,
                            width: 60,
                          ),
                        ],
                      ),
                      const  CustomSizedBox(height: 40,),
                      SizedBox(
                        height: 115,
                        width:  115,
                        child: PickImageWidget(
                          pickedImage: registerProvider.pickedImage,
                          function: () async {
                            await registerProvider.localImagePicker(context: context);
                          },
                        ),
                      ),
                      const  CustomSizedBox(height: 15,),
                      const Text("قم بوضع صورة للملف الشخصي ليتعرف عليك الأخرون",
                        style: AppStyles.textStyle12WhiteW500,),
        
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      MyValidators.displayNameValidator(value);
                      return null;
                    },
                    hintText: "اكتب أسمك",
                  ),
                 const CustomSizedBox(height: 16,),
                  CustomTextFormField(
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      MyValidators.phoneValidator(value);
                      return null;
                    },
                    hintText: "رقم الهاتف",
                  ),
                 const CustomSizedBox(height: 16,),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      MyValidators.emailValidator(value);
                      return null;
                    },
                    hintText: "الأيميل",
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
                               const Text("رجل",
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
                               const Text("امرأة",
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
                    btnTxt: "التالي",),
                  const CustomSizedBox(height: 18,),
                  const Text("خطوة 1 من 3",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(202, 195, 195, 1),
                  ),),

                ],
              ),
            ),
          ],
        ),
      );
    }
    );
  }
}
