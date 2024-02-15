import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/condition_builder.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_navigatiion/navigator.dart';
import 'package:engineering_day_app/features/charts/data/models/get_statistics_model.dart';
import 'package:engineering_day_app/features/charts/presentation/view_model/statistics_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_styles/app_styles.dart';
import '../../../../../lang/locale_keys.dart';
import 'charts_list_item.dart';

class ChartsList extends StatelessWidget {
  final GetStatisticsModel getStatisticsModel;

  const ChartsList({super.key, required this.getStatisticsModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<StatisticsProvider>(
        builder: (context, statisticsProvider, child) {
      return ConditionBuilderWidget(
          isLoading: statisticsProvider.isLoading == true,
          loaderColor:AppColors.whiteColor,
          child: Column(
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
                        Platform.isIOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 17,
                      // childAspectRatio: (2 / 1),
                      //physics:BouncingScrollPhysics(),
                      padding: EdgeInsets.all(10.0),
                      children: [
                        ChartsListItem(
                          title: 'زوار الموقع',
                          count: statisticsProvider.static.visitors.toString(),
                          image: AppImages.userProfile,
                        ),
                        ChartsListItem(
                          title: 'عدد المستخدمين',
                          count: statisticsProvider.static.allUsersCount
                              .toString(),
                          image: AppImages.documents,
                        ),
                        ChartsListItem(
                          title: 'رفع السير الذاتية',
                          count: statisticsProvider.static.cvCount.toString(),
                          image: AppImages.checkCvUser,
                        ),

                        ChartsListItem(
                          title: 'المسجلين بالفعاليات',
                          count:
                          statisticsProvider.static.usersHaveQr.toString(),
                          image: AppImages.checkUser2,
                        ),
                        ChartsListItem(
                          title: 'حضور الفعاليات',
                          count: statisticsProvider.static.userHaveQrAndAttend
                              .toString(),
                          image: AppImages.checkUser,
                        ),


                        ChartsListItem(
                          title: 'حضور اليوم الهندسي',
                          count: statisticsProvider.static.allAttendance
                              .toString(),
                          image: AppImages.documents,
                        ),
                      ]),
                ),
              )
            ],
          ));
    });
  }
}
