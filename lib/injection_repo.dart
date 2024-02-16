import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:engineering_day_app/core/utils/app_services/local_services/cache_helper.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/features/auth/login/data/repos/login_repo_implement.dart';
import 'package:engineering_day_app/features/auth/register/presentation/data/repos/register_repo_implement.dart';
import 'package:engineering_day_app/features/charts/data/repos/statistics_repo_implement.dart';
import 'package:engineering_day_app/features/home/data/repos/home_repo_impl.dart';
import 'package:engineering_day_app/features/job_fair/data/repos/get_recruitment_repo_implement.dart';
import 'package:engineering_day_app/features/profile/data/repos/profile_repo_implement.dart';
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


  var dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

   getIt.registerSingleton<ApiService>(ApiService(dio));
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

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<GetRecruitmentCvRepoImpl>(GetRecruitmentCvRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl(
    getIt.get<ApiService>(),
  ));
}
