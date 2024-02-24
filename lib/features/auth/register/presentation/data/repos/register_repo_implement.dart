import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/base_repository_impl.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/models/register1.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/models/register2_model.dart';
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
      required XFile ?file,
      required Map<String, dynamic> header,
      required BuildContext context}) {
    {
      return request(() async {
        String ?fileName = file?.path.split('/').last;
        FormData formData = FormData.fromMap({
          "profile_image":
          fileName==null?null:    await MultipartFile.fromFile(file?.path??'', filename: fileName),
          "email": email,
          "password": password,
          "username": userName,
          "name_in_certificate": userNameCert,
          "gender": gender,
          "national_id": national,
          "phone": phone,
        });
        var response = await apiService!.postData2(
            endPoint: EndPoints.register1, data: formData, headers: header);
        var result = Register1Model.fromJson(response.data);
        return Right(result);
      });
    }
  }

  // var cookieJar=CookieJar();


  @override
  Future<Either<Failure, Register2Model>> register2(
      {required String userType, required Map<String, dynamic> header}) {
    return request(() async {
      var response = await apiService!.postData2(
          endPoint: EndPoints.register2,
          data: {
            "user_type": userType,
          },
          headers: header);
      var result = Register2Model.fromJson(response.data);


      return Right(result);
    });
  }

  @override
  Future<Either<Failure, Register2Model>> register3({required Map<String, dynamic> header, required Map<String, dynamic> requestBody}) {
    return request(() async {
      var response = await apiService!.postData2(
          endPoint: EndPoints.register3,
          data: requestBody,
          headers: header);
      var result = Register2Model.fromJson(response.data);


      return Right(result);
    });
  }
}
