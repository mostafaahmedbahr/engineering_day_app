import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/auth/login/data/models/login_model.dart';
import 'package:flutter/material.dart';

import 'login_repos.dart';



class LoginRepoImpl implements LoginRepo{
  final ApiService? apiService;

  LoginRepoImpl(this.apiService);


  @override
  Future<Either<Failure, UserModel>> login({required String email, required String password , required BuildContext context}) async{
    try {
      var response = await apiService!.postData(
          endPoint: EndPoints.loginUrl,
          data: {
        "email": email,
        "password": password,
      });
      var result=UserModel.fromJson(response.data);
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