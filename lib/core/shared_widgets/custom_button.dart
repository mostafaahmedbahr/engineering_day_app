import 'package:engineering_day_app/core/utils/app_dimensions/dimension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function? onTap;
  final String? btnTxt;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final bool transparent;
  final EdgeInsets? margin;

  const CustomButton({
    Key? key,
    this.onTap,
    required this.btnTxt,
    this.backgroundColor,
    this.textStyle,
    this.borderColor,
    this.borderRadius = 100,
    this.width,
    this.transparent = true,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      side: BorderSide(
        color: borderColor ?? Colors.transparent, // your color here
        width: 2,
      ),
      backgroundColor: onTap == null
          ? Theme.of(context).disabledColor
          : transparent
              ? Colors.transparent
              : backgroundColor ?? Theme.of(context).primaryColor,
      // minimumSize: Size(MediaQuery.of(context).size.width, 50),
      minimumSize: Size(width != null ? width! : Dimensions.webScreenWidth,
          height != null ? height! : 40),
      // textStyle:
      //     rubikBold.copyWith(color: borderColor),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    return Container(
      height: height != null ? height! : 40,
        child: SizedBox(
            width: width ?? Dimensions.webScreenWidth,
            child: Padding(
              padding: margin == null ? const EdgeInsets.all(0) : margin!,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
color: backgroundColor,
                    gradient:

                    onTap==null?null:
                    backgroundColor!=null?null:
                    transparent==true? const LinearGradient(colors: [
                      Color(0xff80cac9),
                      Color(0xff0e90b1),
                    ]):null

                ),
                child: TextButton(

                  onPressed: onTap as void Function()?,
                  style: flatButtonStyle,
                  child: Text(btnTxt ?? '',
                      style: textStyle ??
                          Theme.of(context).textTheme.displaySmall!.copyWith(
                              color: borderColor ??
                                  Theme.of(context).scaffoldBackgroundColor,
                              fontSize: Dimensions.fontSizeLarge)),
                ),
              ),
            )));
  }
}
