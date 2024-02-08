 import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPartTwo extends StatelessWidget {
  const RegisterPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, registerProvider, child){
      return Column(
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
        ],
      );
    }
    );
  }
}
