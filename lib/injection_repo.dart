import 'package:dio/dio.dart';
import 'package:engineering_day_app/core/utils/app_services/local_services/cache_helper.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/features/auth/login/data/repos/login_repo_implement.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/repos/register_repo_implement.dart';
import 'package:engineering_day_app/features/charts/data/repos/statistics_repo_implement.dart';
import 'package:engineering_day_app/features/tickets/data/repos/ticket_repo_implement.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../features/auth/login/presentation/view_model/login_provider.dart';
//dependency Injection

final getIt = GetIt.instance;

setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await getCurrentUser();

  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<LoginProvider>(
    LoginProvider(getIt.get<LoginRepoImpl>()),
  );

  getIt.registerSingleton<StatisticsRepoImpl>(StatisticsRepoImpl(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<TicketRepoImpl>(TicketRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(
    getIt.get<ApiService>(),
  ));
}
