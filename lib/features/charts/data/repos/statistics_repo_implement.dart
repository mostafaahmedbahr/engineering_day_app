import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
 import 'package:engineering_day_app/features/charts/data/models/get_statistics_model.dart';
import 'package:engineering_day_app/features/charts/data/repos/statistics_repos.dart';
import 'package:flutter/material.dart';




class StatisticsRepoImpl implements StatisticsRepo{
  final ApiService? apiService;

  StatisticsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetStatisticsModel>> getStatistics({required BuildContext context , required String token}) async{
    try {
      var response = await apiService!.get(
          endPoint: EndPoints.statisticsUrl,
      );
      var result=GetStatisticsModel.fromJson(response.data);
      print(result);
      print("mostafa 1");
      return right(result);
    } catch(e)
    {
      print("mostafa 2");
      if(e is DioException)
      {
        print(e);
        print("mostafa 3");
        return left(ServerFailure.fromDioError(e));
      }else{
        print(e);
        print("mostafa 4");
        return left(ServerFailure(e.toString()));
      }

    }
  }



}