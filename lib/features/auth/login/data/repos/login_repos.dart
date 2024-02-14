 import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/failure.dart';
import '../models/login_model.dart';

abstract class LoginRepo{
  Future<Either<Failure,UserModel>> login({required String email , required String password ,  required BuildContext context});
}