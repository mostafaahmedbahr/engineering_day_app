import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'dropdown_field.dart';

class RegisterPartTwo extends StatelessWidget {
  const RegisterPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AppImages.login,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  bottom: -40,
                  child: Image.asset(
                    AppImages.cutLogo,
                    width: 155,
                    height: 245,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 45),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "التسجيل في",
                            style: AppStyles.textStyle14WhiteW800.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Image.asset(
                            AppImages.mainLogo,
                            height: 60,
                            width: 60,
                          ),
                        ],
                      ),
                      const CustomSizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 115,
                        width: 115,
                        child: PickImageWidget(
                          pickedImage: registerProvider.pickedImage,
                          function: () async {
                            await registerProvider.localImagePicker(
                                context: context);
                          },
                        ),
                      ),
                      const CustomSizedBox(
                        height: 15,
                      ),
                      const Text(
                        "قم بوضع صورة للملف الشخصي ليتعرف عليك الأخرون",
                        style: AppStyles.textStyle12WhiteW500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: TextEditingController(
                      text: registerProvider.selectedDate != null
                          ? '${registerProvider.selectedDate!.day}/${registerProvider.selectedDate!.month}/${registerProvider.selectedDate!.year}'
                          : '',
                    ),
                    readOnly: true,
                    onPressed: (){
                      registerProvider.selectDateFunction(context);
                    },
                    hintText: "20/07/1999",
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),
                  DropdownField(
                    title: "المدينة",
                    value: registerProvider.selectedCity,
                    onChanged: (v) {
                      registerProvider.changeSelectCity(v);
                    },
                    items: registerProvider.items.map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),
                  DropdownField(
                    title: "الجامعة",
                    value: registerProvider.selectedCity,
                    onChanged: (v) {
                      registerProvider.changeSelectCity(v);
                    },
                    items: registerProvider.items.map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                  ),
                  const CustomSizedBox(
                    height: 16,
                  ),
                  DropdownField(
                    title: "الكلية",
                    value: registerProvider.selectedCity,
                    onChanged: (v) {
                      registerProvider.changeSelectCity(v);
                    },
                    items: registerProvider.items.map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                  ),
                  const CustomSizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            registerProvider
                                .changePage(registerProvider.currentPage = 2);
                            registerProvider.pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          height: 52,
                          transparent: true,
                          borderRadius: 32,
                          btnTxt: "التالي",
                        ),
                      ),
                      const CustomSizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            registerProvider
                                .changePage(registerProvider.currentPage = 0);
                            registerProvider.pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          height: 52,
                          transparent: false,
                          backgroundColor:
                              const Color.fromRGBO(125, 120, 120, 0.37),
                          borderRadius: 32,
                          btnTxt: "السابق",
                        ),
                      ),
                    ],
                  ),
                  const CustomSizedBox(
                    height: 18,
                  ),
                  const Text(
                    "خطوة 2 من 3",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: Color.fromRGBO(202, 195, 195, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
