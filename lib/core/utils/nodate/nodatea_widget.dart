import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});


  @override
  Widget build(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Image.asset(
      AppImages.noData,
      // height: MediaQuery.of(context).size.height/2,
      fit: BoxFit.fill,
      ),
    ),
  );
  }
}
