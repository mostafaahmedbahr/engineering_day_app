import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/base_repository_impl.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:flutter/material.dart';

import '../models/get_events_details_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends BaseRepositoryImpl implements HomeRepo {
  final ApiService? apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetEventsDetailsHomeModel>> getEvents(
      {required BuildContext context, required String type}) async {
    return request(() async {
      var response = await apiService!.get(
          endPoint: EndPoints.eventsUrl, query: {"type": "sustainability"});
      // print();
      var result = GetEventsDetailsHomeModel.fromJson(response.data);
      return right(result);
    });
  }
}
