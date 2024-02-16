import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/base_repository_impl.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/profile/data/models/get_profile_model.dart';
import 'package:engineering_day_app/features/profile/data/repos/profile_repos.dart';
import 'package:flutter/material.dart';

class ProfileRepoImpl extends BaseRepositoryImpl implements ProfileRepo {
  final ApiService? apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetProfileModel>> getProfile(
      {required BuildContext context}) async {
    return request(() async {
      var response = await apiService!.get(
        endPoint: EndPoints.getAuthUser,
      );
      var result = GetProfileModel.fromJson(response.data);
      return right(result);
    });
  }
}
