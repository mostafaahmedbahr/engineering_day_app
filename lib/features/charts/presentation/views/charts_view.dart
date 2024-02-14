import 'package:engineering_day_app/features/charts/presentation/views/widgets/charts_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors/app_colors.dart';

class ChartsView extends StatelessWidget {
  const ChartsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ChartsViewBody(),
    ));
  }
}
