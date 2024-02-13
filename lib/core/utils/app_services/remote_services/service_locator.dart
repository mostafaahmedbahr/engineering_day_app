import 'package:dio/dio.dart';
import 'package:engineering_day_app/features/auth/login/data/repos/login_repo_implement.dart';
import 'package:get_it/get_it.dart';
import '../../../../features/auth/login/presentation/view_model/login_provider.dart';
import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<LoginProvider>(
    LoginProvider(getIt.get<LoginRepoImpl>()),
  );


}