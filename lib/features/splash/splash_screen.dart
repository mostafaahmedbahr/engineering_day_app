import 'dart:async';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  final int duration;
  final Widget home;

  const SplashScreen({super.key, this.duration = 3000, required this.home});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(milliseconds: widget.duration), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.home),
      );


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
      body: SizedBox(
        height: double.infinity,
        width:  double.infinity,
        child: Center(
          child: Image.asset(AppImages.splash,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}