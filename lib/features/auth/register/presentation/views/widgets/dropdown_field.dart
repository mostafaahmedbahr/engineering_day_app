import 'package:dropdown_search/dropdown_search.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownField<T> extends StatelessWidget {
  DropdownField(
      {super.key,
      this.value,
      required this.onChanged,
      this.items,
      this.validator,
      this.itemAsString,
      required this.title});

    String? Function(T?)? validator;
  String Function(T)? itemAsString;
  final T? value;
  final String title;
  void Function(T? value) onChanged;
  List<T>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      validator: validator,
      popupProps: PopupProps.dialog(
          fit: FlexFit.loose,
          dialogProps: DialogProps(
            backgroundColor: Color.fromRGBO(245, 248, 252, 1),
          )),
      items: items ?? [],
      selectedItem: value,
      itemAsString: itemAsString,
      onChanged: onChanged,
      dropdownButtonProps: DropdownButtonProps(
          icon: Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: AppColors.mainColor2,
      )),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            hintText: title,
            filled: true,
            fillColor: Color.fromRGBO(245, 248, 252, 1),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(100)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.mainColor,
                ),
                borderRadius: BorderRadius.circular(100)),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 11)),
      ),
    );
  }
}
