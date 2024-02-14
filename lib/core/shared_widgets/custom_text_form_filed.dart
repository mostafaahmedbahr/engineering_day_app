import 'package:flutter/material.dart';

import '../utils/app_colors/app_colors.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.controller,
    this.obscureText,
    this.icon,
    this.hintText,
    this.onPressed,
    this.prefix,
    this.validator,
    this.maxLines,
    this.hintColor,
    this.prefixIcon,
    this.keyboardType,
    this.readOnly,
    this.raduis, this.fillColor,this.borderColor
  }) : super(key: key);

  TextEditingController? controller;
  final bool? obscureText;
  Widget? icon;
  Widget? prefixIcon;
  Widget? prefix;
  void Function()? onPressed;
  String? hintText;
  int? maxLines;
  double? raduis;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  final bool? readOnly;
  final Color? fillColor;
  final Color? borderColor;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onPressed,
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      style: const TextStyle(
        color: AppColors.blackColor,
      ),
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        suffixIcon: icon,
        prefixIcon: prefixIcon,
        prefix: prefix,
        filled: true,

        fillColor:fillColor ?? const Color.fromRGBO(245, 248, 252, 1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis ?? 24),
          borderSide:   BorderSide(
            color: borderColor ?? const Color.fromRGBO(245, 248, 252, 1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis ?? 24),
          borderSide:   BorderSide(
            color: borderColor ?? const Color.fromRGBO(245, 248, 252, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis ?? 24),
          borderSide:   BorderSide(
            color: borderColor ??const Color.fromRGBO(245, 248, 252, 1),
          ),
        ),
        hintText: hintText,
        hintStyle:     TextStyle(
          fontSize: 14,
          color: hintColor ?? const Color.fromRGBO(122, 131, 153, 1),
        ),

      ),
    );
  }
}