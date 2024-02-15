import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/base_repository_impl.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/models/register1.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/repos/register_repos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterRepoImpl extends BaseRepositoryImpl implements RegisterRepo {
  final ApiService? apiService;

  RegisterRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Register1Model>> register1(
      {required String email,
      required String password,
      required String userName,
      required String gender,
      required String userNameCert,
      required String national,
      required String phone,
      required XFile file,
      required BuildContext context}) {
    {
      return request(() async {
        String fileName = file.path.split('/').last;
        FormData formData = FormData.fromMap({
          "profile_image":
              await MultipartFile.fromFile(file.path, filename: fileName),
          "email": email,
          "password": password,
          "username": userName,
          "name_in_certificate": userNameCert,
          "gender": gender,
          "national_id": national,
          "phone": phone,
        });
        var response = await apiService!
            .postData(endPoint: EndPoints.loginUrl, data: formData);
        var result = Register1Model.fromJson(response.data);
        return Right(result);
      });
    }
  }
}
