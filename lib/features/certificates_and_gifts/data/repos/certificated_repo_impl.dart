import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/base_repository_impl.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/certificates_and_gifts/data/models/certificated_model.dart';
import 'package:engineering_day_app/features/charts/data/models/get_statistics_model.dart';
 import 'package:flutter/material.dart';

import 'certificated_repo.dart';

class CertificatedRepoImpl extends BaseRepositoryImpl implements CertificatedRepo {
  final ApiService? apiService;

  CertificatedRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CertificatedModel>> getCertificated(
      {required BuildContext context}) async {
    return request(() async {
      var response = await apiService!.get(
        endPoint: EndPoints.certificatedUrl,
      );
      var result = CertificatedModel.fromJson(response.data);
      return right(result);
    });
  }
}
