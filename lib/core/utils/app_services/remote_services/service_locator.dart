import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/utils/app_services/local_services/cache_helper.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/endpoints.dart';
import 'package:engineering_day_app/features/auth/login/presentation/view_model/login_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  /// * Online Database
  final dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      validateStatus: (_) => true,
      followRedirects: true,
      headers: {
        Headers.contentTypeHeader: 'application/json',
      },
    ),
  );

  getIt.registerSingleton<ApiService>(ApiService(dio));
  await getCurrentUser();

  getIt.registerSingleton<LoginServices>(LoginServices(
    getIt.get<ApiService>(),
  ));

  // getIt.registerSingleton<ServicesReposImplementation>(ServicesReposImplementation(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<ServicesDetailsRepoImpl>(ServicesDetailsRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  //
  // getIt.registerSingleton<QoutesReposImplementation>(QoutesReposImplementation(
  //   getIt.get<ApiService>(),
  // ));

  // getIt.registerSingleton<CourseDetailsRepoImplementation>(CourseDetailsRepoImplementation(
  //   getIt.get<ApiService>(),
  // ));

  // getIt.registerSingleton<SessionsRepoImpl>(SessionsRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  //
  // getIt.registerSingleton<ProjectsRepoImpl>(ProjectsRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  //
  // getIt.registerSingleton<NotificationsRepoImple>(NotificationsRepoImple(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<SpeakersChatRepoImpl>(SpeakersChatRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<ScanRepoImpl>(ScanRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
}
