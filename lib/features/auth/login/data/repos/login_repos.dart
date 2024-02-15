import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/features/auth/login/data/models/TokenModel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, TokenModel>> login(
      {required String email,
      required String password,
      required BuildContext context});

  Future<Either<Failure, void>> loginVerify({required String token});
}
