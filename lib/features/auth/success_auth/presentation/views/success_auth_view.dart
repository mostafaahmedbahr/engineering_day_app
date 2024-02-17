import 'dart:async';

import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/auth/login/presentation/view_model/login_provider.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors/app_colors.dart';

class SuccessAuthView extends StatefulWidget {
  const SuccessAuthView({Key? key, this.duration = 3000, required this.home})
      : super(key: key);
  final int duration;
  final Widget home;

  @override
  State<SuccessAuthView> createState() => _SuccessAuthViewState();
}

class _SuccessAuthViewState extends State<SuccessAuthView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = LoginProvider.get(context);

    RegisterProvider registerProvider = RegisterProvider.get(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.background,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            top: 83,
            child: Image.asset(
              AppImages.cutLogo,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 50,
            child: Image.asset(
              "assets/images/pngs/اليوم_الهندسي__1___1__page-0002-removebg-preview 11.png",
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),

              Container(
                height: 136,
                width: 136,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(68),
                  color: const Color.fromRGBO(217, 217, 217, 0.37),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SvgPicture.asset(
                    AppImages.user,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "نهارك سعيد, ${RegisterProvider.get(context, listen: false).userNameCtl.text}",
                style: AppStyles.textStyle25WhiteW900,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "تم تسجيل حسابك",
                style: AppStyles.textStyle12WhiteW500.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              // CloseButton(onPressed: (){},)
              Spacer(),
              CustomButton(
                width: MediaQuery.of(context).size.width / 2,
                backgroundColor: AppColors.mainColor2,
                btnTxt: "المتابعة",
                onTap: () {
                  print("asasas");
                  loginProvider.login(
                      email: registerProvider.emailCtl.text,
                      password: registerProvider.passwordCtl.text,
                      context: context,
                      isFromRegister: true);
                },
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
