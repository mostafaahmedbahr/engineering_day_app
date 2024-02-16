import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/features/home/data/models/get_events_details_model.dart';
 import 'package:flutter/material.dart';

abstract class HomeRepo {
  Future<Either<Failure, GetEventsDetailsHomeModel>> getEvents(
      {required BuildContext context , required String type});
  Future<Either<Failure, void>> joinEvent({required String id});

}
