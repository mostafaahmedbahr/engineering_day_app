import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/base_repository_impl.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/auth/login/data/models/TokenModel.dart';
import 'package:flutter/material.dart';

import 'login_repos.dart';

class LoginRepoImpl extends BaseRepositoryImpl implements LoginRepo {
  final ApiService? apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, TokenModel>> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    return request(() async {
      var response =
          await apiService!.postData(endPoint: EndPoints.loginUrl, data: {
        "email": email,
        "password": password,
      });
      var result = TokenModel.fromJson(response.data);
      await loginVerify(token: result.access ?? '');
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, Unit>> loginVerify({required String token}) {
    return request(() async {
          await apiService!.postData(endPoint: EndPoints.loginVerify, data: {
        "token": token,
      });
      return const Right(unit);
    });
  }
}
