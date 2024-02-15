import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/features/charts/presentation/view_model/statistics_provider.dart';
import 'package:engineering_day_app/features/charts/presentation/views/widgets/charts_list.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors/app_colors.dart';

class ChartsView extends StatefulWidget {
  const ChartsView({super.key});

  @override
  State<ChartsView> createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView> {
  @override
  void initState() {
    StatisticsProvider.get(context, listen: false)
        .getStatistics(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Stack(
              children: [
                Image.asset(
                  AppImages.background,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 200,
                  left: -40,
                  child: Image.asset(
                    AppImages.cutLogo,
                    height: 245,
                    width: 155,
                    fit: BoxFit.cover,
                  ),
                ),
                ChartsList(
                  getStatisticsModel:
                      StatisticsProvider.get(context, listen: false).static,
                )
              ],
            )));
  }
}
