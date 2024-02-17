import 'dart:async';

import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/auth/login/presentation/view_model/login_provider.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:flutter/material.dart';

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
    timer = Timer(Duration(milliseconds: widget.duration), () {
      LoginProvider loginProvider = LoginProvider.get(context, listen: false);
      RegisterProvider registerProvider = RegisterProvider.get(context, listen: false);
      loginProvider.login(
          email: registerProvider.emailCtl.text,
          password: registerProvider.passwordCtl.text,
          context: context);
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => widget.home),
      // );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
              Container(
                height: 136,
                width: 136,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(68),
                  color: const Color.fromRGBO(217, 217, 217, 0.37),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
                Text(
                "نهارك سعيد, ${RegisterProvider.get(context, listen: false).userNameCtl.text}",
                style: AppStyles.textStyle25WhiteW900,
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "تم تسجيل حسابك",
                style: AppStyles.textStyle12WhiteW500.copyWith(fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
