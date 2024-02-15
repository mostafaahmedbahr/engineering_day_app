import 'package:dio/dio.dart';
import 'package:engineering_day_app/features/auth/login/presentation/view_model/login_provider.dart';

import '../local_services/cache_keys.dart';
import 'endpoints.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> postData({
    required String endPoint,
    bool sendCode = false,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${currentUser.value.access}',
      if (sendCode) "code": "${CacheKeysManger.getUserCodeFromCache()}",
    };
    var response = await _dio.post(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    print("response realUri  =======> : ${response.realUri}");
    print("response data  =======>: ${response.data}");
    print("response headers  =======> : ${response.headers}");
    return response;
  }

  Future<Response> get({
    required String endPoint,
    bool sendCode = false,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${currentUser.value.access}',
      if (sendCode) "code": "${CacheKeysManger.getUserCodeFromCache()}"
    };
    var response = await _dio.get(
      '${EndPoints.baseUrl}$endPoint',
      queryParameters: query,
    );

    return response;
  }

  Future<Response> putData({
    required String endPoint,
    bool sendAuthToken = false,
    required FormData data,
  }) async {
    _dio.options.headers = {
      "accept": "*/*",
      'Authorization': 'Bearer ${currentUser.value.access}',
      "Content-Type": "multipart/form-data",
    };
    var response = await _dio.put(
      '${EndPoints.baseUrl}$endPoint',
      data: data,
    );
    print("response realUri  =======> : ${response.realUri}");
    print("response data  =======>: ${response.data}");
    print("response headers  =======> : ${response.headers}");
    return response;
  }

  Future<Response> deleteData({
    required String endPoint,
    bool sendCode = false,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer ${currentUser.value.access}',
      "Content-Type": "application/json",
      if (sendCode) "code": "${CacheKeysManger.getUserCodeFromCache()}"
    };
    var response = await _dio.delete(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    print("response realUri  =======> : ${response.realUri}");
    print("response data  =======>: ${response.data}");
    print("response headers  =======> : ${response.headers}");
    return response;
  }
}
