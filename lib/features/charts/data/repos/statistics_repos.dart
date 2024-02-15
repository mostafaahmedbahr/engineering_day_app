import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/features/charts/data/models/get_statistics_model.dart';
import 'package:flutter/material.dart';

abstract class StatisticsRepo {
  Future<Either<Failure, GetStatisticsModel>> getStatistics(
      {required BuildContext context});
}
