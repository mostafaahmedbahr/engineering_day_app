import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_loading.dart';
import 'package:engineering_day_app/core/utils/app_navigatiion/navigator.dart';
import 'package:engineering_day_app/features/charts/presentation/view_model/statistics_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_styles/app_styles.dart';
import '../../../../../lang/locale_keys.dart';
import 'charts_list_item.dart';

class ChartsList extends StatelessWidget {
  const ChartsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StatisticsProvider>(builder: (context, statisticsProvider, child){
      return  ConditionalBuilder(
        condition: statisticsProvider.isLoading == true,
        fallback: (context){
          return   CustomLoading(
            color: AppColors.whiteColor,
          );
        },
       builder: (context){
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  AppNavigator.navigatePop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                        color: AppColors.whiteColor,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        LocaleKeys.statistics.tr(),
                        style: AppStyles.textStyle16DarkMainColorW800.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: DynamicHeightGridView(
                      itemCount: 10,
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 17,
                      builder: (ctx, index) {
                        return const ChartsListItem();
                      }),
                ),
              ),
            ],
          );
       },
      );
    }

    );
  }
}
