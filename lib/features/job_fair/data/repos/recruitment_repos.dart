import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/features/job_fair/data/models/get_recruitment_cv_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class RecruitmentCVRepo {
  Future<Either<Failure, GetRecruitmentCvModel>> getGetRecruitmentCv(
      {required BuildContext context});

  Future<Either<Failure, void>> updateRecruitmentCv(
      {required BuildContext context,
      required String linkedInLink,
      required String cvLink,
      required XFile? pdfFile});

// Future<Either<Failure, void>> deleteRecruitmentCv({
//   required BuildContext context,
// });
}
