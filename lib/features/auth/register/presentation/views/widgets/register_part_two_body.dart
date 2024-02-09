import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';

import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dropdown_field.dart';

class RegisterPartTwoBody extends StatelessWidget {
  const RegisterPartTwoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, registerProvider, child){
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: TextEditingController(
                text: registerProvider.selectedDate != null
                    ? '${registerProvider.selectedDate!.day}/${registerProvider.selectedDate!.month}/${registerProvider.selectedDate!.year}'
                    : '',
              ),
              readOnly: true,
              onPressed: (){
                registerProvider.selectDateFunction(context);
              },
              hintText: "20/07/1999",
            ),
            const CustomSizedBox(
              height: 16,
            ),
            DropdownField(
              title: LocaleKeys.city.tr(),
              value: registerProvider.selectedCity,
              onChanged: (v) {
                registerProvider.changeSelectCity(v);
              },
              items: registerProvider.items.map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            DropdownField(
              title:LocaleKeys.university.tr(),
              value: registerProvider.selectedCity,
              onChanged: (v) {
                registerProvider.changeSelectCity(v);
              },
              items: registerProvider.items.map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            DropdownField(
              title:LocaleKeys.college.tr(),
              value: registerProvider.selectedCity,
              onChanged: (v) {
                registerProvider.changeSelectCity(v);
              },
              items: registerProvider.items.map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
            ),
            const CustomSizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      registerProvider
                          .changePage(registerProvider.currentPage = 2);
                      registerProvider.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    height: 52,
                    transparent: true,
                    borderRadius: 32,
                    btnTxt:LocaleKeys.next.tr(),
                  ),
                ),
                const CustomSizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      registerProvider
                          .changePage(registerProvider.currentPage = 0);
                      registerProvider.pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    height: 52,
                    transparent: false,
                    backgroundColor:
                    const Color.fromRGBO(125, 120, 120, 0.37),
                    borderRadius: 32,
                    btnTxt: LocaleKeys.prevouis.tr(),
                  ),
                ),
              ],
            ),
            const CustomSizedBox(
              height: 18,
            ),
              Text(
              LocaleKeys.step2Of3.tr(),
              style:const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(202, 195, 195, 1),
              ),
            ),
          ],
        ),
      );
    }
    );
  }
}
