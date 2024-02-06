import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

 import '../../../../features/course_details/data/repos/course_details_repos_implementation.dart';
import '../../../../features/layout/data/repos/layout_repo_implementation.dart';
import '../../../../features/qoutes/data/repos/qoutes_repos_implementation.dart';
import '../../../../features/services/data/repos/services_repos_implementation.dart';
import '../../../../features/services_details/data/repos/services_details_repos_Implementation.dart';
import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LayoutRepoImpl>(LayoutRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ServicesReposImplementation>(ServicesReposImplementation(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ServicesDetailsRepoImpl>(ServicesDetailsRepoImpl(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<QoutesReposImplementation>(QoutesReposImplementation(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<CourseDetailsRepoImplementation>(CourseDetailsRepoImplementation(
    getIt.get<ApiService>(),
  ));

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