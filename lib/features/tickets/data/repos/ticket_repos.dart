import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/features/tickets/data/models/ticket_model.dart';
import 'package:flutter/material.dart';

abstract class TicketRepo {
  Future<Either<Failure, GetTicketModel>> getTicket(
      {required BuildContext context});
}
