import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/features/auth/register/presentation/view_model/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<RegisterProvider>(builder: (context, registerProvider, child){
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: registerProvider.pageController,
                itemCount: registerProvider.pages.length,
                onPageChanged: (int page) {
                  registerProvider.changePage(page);
                },
                itemBuilder: (BuildContext context, int index) {
                  return registerProvider.pages[index];
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(context),
            ),
            SizedBox(height: 20.0),
            // ElevatedButton(
            //   onPressed: () {
            //     if (onBoardingCubit.currentPage == onBoardingCubit.pages.length - 1) {
            //       GoRouter.of(context).push(AppRouter.kStart);
            //     } else {
            //       onBoardingCubit.pageController.nextPage(
            //         duration: Duration(milliseconds: 500),
            //         curve: Curves.ease,
            //       );
            //     }
            //   },
            //   child: Text(
            //     onBoardingCubit.currentPage == onBoardingCubit.pages.length - 1 ? 'Get Started' : 'Next',
            //     style: TextStyle(fontSize: 18.0,
            //       color: AppColors.mainColor,
            //     ),
            //   ),
            // ),
            SizedBox(height: 20.0),
          ],
        ),
      );
    } );
  }

  List<Widget> _buildPageIndicator(context) {
    List<Widget> indicators = [];
    for (int i = 0; i < Provider.of<RegisterProvider>(context).pages.length; i++) {
      indicators.add(
        i == Provider.of<RegisterProvider>(context).currentPage
            ? _buildIndicator(true)
            : _buildIndicator(false),
      );
    }
    return indicators;
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin:const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 32.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.mainColor : AppColors.greyColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

