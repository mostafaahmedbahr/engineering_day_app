
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
 import 'package:flutter/material.dart';

import 'charts_list.dart';

class ChartsViewBody extends StatelessWidget {
  const ChartsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Image.asset(AppImages.background,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,),
        Positioned(
          top: 200,
          left: -40,
          child: Image.asset(AppImages.cutLogo,
          height: 245,
          width: 155,
            fit: BoxFit.cover,
          ),
        ),
       const ChartsList()
      ],
    );
  }
}
