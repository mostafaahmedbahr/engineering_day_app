import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/features/certificates_and_gifts/data/models/certificated_model.dart';
 import 'package:flutter/material.dart';

abstract class CertificatedRepo {
  Future<Either<Failure, CertificatedModel>> getCertificated(
      {required BuildContext context});
}
