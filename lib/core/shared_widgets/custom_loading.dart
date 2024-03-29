import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/app_colors/app_colors.dart';


class CustomLoading extends StatelessWidget {
    const CustomLoading({Key? key , this.color}) : super(key: key);
 final  Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        size: 50, color:color ?? AppColors.mainColor,
      ),
    );
  }
}
