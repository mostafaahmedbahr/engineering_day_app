import 'package:flutter/material.dart';

class SuccessAuthView extends StatelessWidget {
  const SuccessAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/Rectangle 147.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            top: 83,
            child: Image.asset("assets/images/اليوم_الهندسي__1___1__page-0002-removebg-preview 6.png",
            ),
          ),
          Positioned(
            right: 0,
            bottom: 50,
            child: Image.asset("assets/images/اليوم_الهندسي__1___1__page-0002-removebg-preview 11.png",
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
              Text("نهارك سعيد, عبد الله "),
              SizedBox(height: 22,),
              Text("تم تسجيل حسابك"),
            ],
          )
        ],
      ),
    );
  }
}
