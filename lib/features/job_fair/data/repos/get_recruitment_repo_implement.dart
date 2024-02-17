import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/base_repository_impl.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/job_fair/data/models/get_recruitment_cv_model.dart';
import 'package:engineering_day_app/features/job_fair/data/repos/recruitment_repos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetRecruitmentCvRepoImpl extends BaseRepositoryImpl
    implements RecruitmentCVRepo {
  final ApiService? apiService;

  GetRecruitmentCvRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetRecruitmentCvModel>> getGetRecruitmentCv(
      {required BuildContext context}) async {
    return request(() async {
      var response = await apiService!.get(
        endPoint: EndPoints.getRecruitmentCvUrl,
      );
      var result = GetRecruitmentCvModel.fromJson(response.data);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, void>> updateRecruitmentCv(
      {required BuildContext context,
      required String linkedInLink,
      required String cvLink,
      required XFile? pdfFile}) async {
    FormData formData = FormData.fromMap({
      "cv": pdfFile?.path == null
          ? null
          : await MultipartFile.fromFile(pdfFile?.path ?? '',
              filename: pdfFile?.name ?? ''),
      "linkedin": linkedInLink,
      "cv_link": cvLink,
    });

    return request(() async {
      var response = await apiService!
          .putData(endPoint: EndPoints.updateRecruitmentCvUrl, data: formData);
      var result = GetRecruitmentCvModel.fromJson(response.data);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, void>> addRecruitmentCv(
      {required BuildContext context,
      required String linkedInLink,
      required String cvLink,
      required XFile? pdfFile}) async {
    FormData formData = FormData.fromMap({
      "cv": pdfFile?.path == null
          ? null
           : await MultipartFile.fromFile(pdfFile?.path ?? '',
              filename: pdfFile?.name ?? ''),
      "linkedin": linkedInLink,
      "cv_link": cvLink,
    });

    return request(() async {
      var response = await apiService!
          .postData(endPoint: EndPoints.addRecruitmentCvUrl, data: formData);
      var result = GetRecruitmentCvModel.fromJson(response.data);
      return right(result);
    });
  }
}
