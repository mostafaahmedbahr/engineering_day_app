import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/base_repository_impl.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/charts/data/models/get_statistics_model.dart';
import 'package:engineering_day_app/features/charts/data/repos/statistics_repos.dart';
import 'package:flutter/material.dart';

class StatisticsRepoImpl extends BaseRepositoryImpl implements StatisticsRepo {
  final ApiService? apiService;

  StatisticsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetStatisticsModel>> getStatistics(
      {required BuildContext context}) async {
    return request(() async {
      var response = await apiService!.get(
        endPoint: EndPoints.statisticsUrl,
      );
      var result = GetStatisticsModel.fromJson(response.data);
      return right(result);
    });
  }
}
