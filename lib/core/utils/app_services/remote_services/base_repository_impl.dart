import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:engineering_day_app/core/errors/failure.dart';

typedef FutureEitherFailureOrData<T> = Future<Either<Failure, T>> Function();

abstract class BaseRepository {
  Future<Either<Failure, T>> request<T>(FutureEitherFailureOrData<T> body);
}

class BaseRepositoryImpl implements BaseRepository {
  @override
  Future<Either<Failure, T>> request<T>(
      FutureEitherFailureOrData<T> body) async {
    try {
      return await body();
    } catch (e) {
      if (e is DioException) {
        // print("eeee ${e.response}");
        return left(ServerFailure.fromDioError(e));
      } else {
        log(e.toString());
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
