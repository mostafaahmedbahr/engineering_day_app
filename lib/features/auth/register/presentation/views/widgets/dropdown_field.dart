import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownField extends StatelessWidget {
    DropdownField({super.key, required this.value,required this.onChanged,  this.items, required this.title});
  final dynamic value;
  final String title;
  final void Function(String?) onChanged;
  List<DropdownMenuItem<String>>? items;
  @override
  Widget build(BuildContext context) {
    return  DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint:   Row(
          children: [
            const  SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                title,
                style:const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items,
        value: value,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(

              color:const Color.fromRGBO(245, 248, 252, 1),
            ),
            color:const Color.fromRGBO(245, 248, 252, 1),
          ),
          elevation: 0,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Color.fromRGBO(18, 61, 80, 1),
          ),
          iconSize: 14,
          iconEnabledColor: AppColors.mainColor,
          iconDisabledColor:AppColors.greyColor,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.mainColor,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
