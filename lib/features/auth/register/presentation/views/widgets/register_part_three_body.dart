import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:engineering_day_app/features/auth/success_auth/presentation/views/success_auth_view.dart';
import 'package:engineering_day_app/features/layout/presentation/views/layout_view.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPartThreeBody extends StatelessWidget {
  const RegisterPartThreeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomSizedBox(
              height: 16,
            ),
            const CustomSizedBox(
              height: 100,
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
                      registerProvider
                          .changePage(registerProvider.currentPage = 1);
                      registerProvider.pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
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
