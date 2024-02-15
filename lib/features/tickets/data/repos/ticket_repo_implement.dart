import 'package:dartz/dartz.dart';
import 'package:engineering_day_app/core/errors/failure.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/base_repository_impl.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/tickets/data/models/ticket_model.dart';
import 'package:engineering_day_app/features/tickets/data/repos/ticket_repos.dart';
import 'package:flutter/material.dart';

class TicketRepoImpl extends BaseRepositoryImpl implements TicketRepo {
  final ApiService? apiService;

  TicketRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetTicketModel>> getTicket(
      {required BuildContext context}) {
    return request(() async {
      var response = await apiService!.get(
        endPoint: EndPoints.ticketUrl,
      );
      var result = GetTicketModel.fromJson(response.data);
      return right(result);
    });
  }
}
