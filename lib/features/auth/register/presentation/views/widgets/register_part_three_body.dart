import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_text_form_filed.dart';
import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:engineering_day_app/core/utils/app_validator/app_validator.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/enum/user_type_enum.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:engineering_day_app/features/auth/register/presentation/views/widgets/dropdown_field.dart';
import 'package:engineering_day_app/features/auth/success_auth/presentation/views/success_auth_view.dart';
import 'package:engineering_day_app/features/layout/presentation/views/layout_view.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPartThreeBody extends StatefulWidget {
  const RegisterPartThreeBody({super.key});

  @override
  State<RegisterPartThreeBody> createState() => _RegisterPartThreeBodyState();
}

class _RegisterPartThreeBodyState extends State<RegisterPartThreeBody> {
  @override
  void initState() {
    super.initState();
    RegisterProvider.get(context, listen: false).getGenerateYears();
    RegisterProvider.get(context, listen: false).getAcademicYears();
  }

  String? year;

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (provider.userType?.value == UserTypeEnum.graduated.name)
              GraduateList(
                provider: provider,
              ),
            if (provider.userType?.value == UserTypeEnum.student.name)
              StudentList(
                provider: provider,
              ),
            if (provider.userType?.value == UserTypeEnum.visitor.name)
              VisitorList(
                provider: provider,
              ),
            if (provider.userType?.value ==
                UserTypeEnum.universityEmployees.name)
              UniversityEmployees(
                provider: provider,
              ),
            const CustomSizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      AppNav.customNavigator(
                        context: context,
                        screen: const SuccessAuthView(
                          home: LayoutView(),
                        ),
                        finish: true,
                      );
                      // registerProvider
                      //     .changePage(registerProvider.currentPage = 2);
                      // registerProvider.pageController.nextPage(
                      //   duration: const Duration(milliseconds: 500),
                      //   curve: Curves.ease,
                      // );
                    },
                    height: 52,
                    transparent: true,
                    borderRadius: 32,
                    btnTxt: LocaleKeys.save.tr(),
                  ),
                ),
                const CustomSizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      // registerProvider
                      //     .changePage(registerProvider.currentPage = 1);
                      // registerProvider.pageController.previousPage(
                      //   duration: const Duration(milliseconds: 500),
                      //   curve: Curves.ease,
                      // );
                    },
                    height: 52,
                    transparent: false,
                    backgroundColor: const Color.fromRGBO(125, 120, 120, 0.37),
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
              LocaleKeys.step3Of3.tr(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(202, 195, 195, 1),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GraduateList extends StatelessWidget {
  RegisterProvider provider;

  GraduateList({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: provider.universityCtr,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => MyValidators.emailValidator(value),
          hintText: "الجامعة",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        CustomTextFormField(
          controller: provider.collegeCtr,
          keyboardType: TextInputType.text,
          validator: (String? value) => MyValidators.passwordValidator(value),
          hintText: "الكلية",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        CustomTextFormField(
          controller: provider.sectionCtr,
          keyboardType: TextInputType.text,
          validator: (String? value) => MyValidators.passwordValidator(value),
          hintText: "القسم",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        DropdownField<String>(
          items: provider.graduateYears,
          // validator: (v) => MyValidators.displayNameValidator(v?.title),
          // itemAsString: (UserTypeModel u) => u.title,
          onChanged: (String? data) {
            provider.onSelectGraduateYear(data);
          },
          title: "سنة التخرج",
        ),
      ],
    );
  }
}

class StudentList extends StatelessWidget {
  RegisterProvider provider;

  StudentList({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: provider.universityCtr,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => MyValidators.emailValidator(value),
          hintText: "الجامعة",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        CustomTextFormField(
          controller: provider.collegeCtr,
          keyboardType: TextInputType.text,
          validator: (String? value) => MyValidators.passwordValidator(value),
          hintText: "الكلية",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        CustomTextFormField(
          controller: provider.sectionCtr,
          keyboardType: TextInputType.text,
          validator: (String? value) => MyValidators.passwordValidator(value),
          hintText: "القسم",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        DropdownField<String>(
          items: provider.academicYear,
          onChanged: (String? data) {
            provider.onSelectAcademicYear(data);
          },
          title: "السنه الدراسيه",
        ),
      ],
    );
  }
}

class VisitorList extends StatelessWidget {
  RegisterProvider provider;

  VisitorList({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSizedBox(
          height: 16,
        ),
        DropdownField<String>(
          items: provider.visitReasonList,
          onChanged: (String? data) {
            provider.onSelectVisitReason(data);
          },
          title: "سبب الزيارة",
        ),
      ],
    );
  }
}

class UniversityEmployees extends StatelessWidget {
  RegisterProvider provider;

  UniversityEmployees({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSizedBox(
          height: 16,
        ),
        DropdownField<String>(
          items: provider.visitReasonList,
          onChanged: (String? data) {
            provider.onSelectVisitReason(data);
          },
          title: "سبب الزيارة",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        DropdownField<String>(
          items: provider.whoYouList,
          onChanged: (String? data) {
            provider.onSelectWhoYou(data);
          },
          title: "منسوبي الجامعة",
        ),
      ],
    );
  }
}
