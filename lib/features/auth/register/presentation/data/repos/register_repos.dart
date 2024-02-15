import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/models/register1.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class RegisterRepo {
  Future<Either<Failure, Register1Model>> register1({
    required String email,
    required String password,
    required String userName,
    required String gender,
    required String userNameCert,
    required String national,
    required String phone,
    required XFile file,
    required BuildContext context,
  });
}
