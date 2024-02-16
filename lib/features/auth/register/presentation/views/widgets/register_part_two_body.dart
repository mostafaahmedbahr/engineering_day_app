import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/enum/user_type_enum.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/models/user_type_model.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/dropdown_field.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPartTwoBody extends StatefulWidget {
  RegisterPartTwoBody({super.key});

  @override
  State<RegisterPartTwoBody> createState() => _RegisterPartTwoBodyState();
}

class _RegisterPartTwoBodyState extends State<RegisterPartTwoBody> {
  String? selectedTypeKey;
  String? selectedTypeValue;

  List<UserTypeModel> userType = [
    UserTypeModel(value: UserTypeEnum.graduated.name, title: "خريج"),
    UserTypeModel(value: UserTypeEnum.student.name, title: "طالب"),
    UserTypeModel(value: UserTypeEnum.visitor.name, title: "زائر"),
    UserTypeModel(
        value: UserTypeEnum.universityEmployees.name, title: "منسوبي الجامعة"),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
      return Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomSizedBox(
                height: 16,
              ),
              DropdownField<UserTypeModel>(
                items: userType,
                // validator: (v) => MyValidators.displayNameValidator(v?.title),
                itemAsString: (UserTypeModel u) => u.title,
                onChanged: (UserTypeModel? data) {
                  registerProvider.userType = data;
                },
                title: "يرجي تحديد الفئة",
              ),
              const CustomSizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        registerProvider.register2(context: context);
                      },
                      height: 52,
                      transparent: true,
                      borderRadius: 32,
                      btnTxt: LocaleKeys.next.tr(),
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
                LocaleKeys.step1Of3.tr(),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(202, 195, 195, 1),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
