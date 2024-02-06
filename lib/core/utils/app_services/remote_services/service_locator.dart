import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  // getIt.registerSingleton<LayoutRepoImpl>(LayoutRepoImpl(
  //   getIt.get<ApiService>(),
  // ));
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