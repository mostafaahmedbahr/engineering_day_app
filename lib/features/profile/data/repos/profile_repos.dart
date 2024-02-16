import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/features/profile/data/models/get_profile_model.dart';
import 'package:flutter/material.dart';

abstract class ProfileRepo {
  Future<Either<Failure, GetProfileModel>> getProfile(
      {required BuildContext context});

  Future<Either<Failure, GetProfileModel>> editProfileData(
      {required BuildContext context ,
        required dynamic image,
        required String username ,
        required String gender ,
        required String nationalId ,
        required String phone ,
        required String nameInCertificate ,
      });
}
