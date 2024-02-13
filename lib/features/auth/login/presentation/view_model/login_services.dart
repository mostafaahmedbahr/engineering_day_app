import 'dart:convert';

import 'package:engineering_day_app/core/utils/app_services/local_services/cache_helper.dart';
import 'package:engineering_day_app/core/utils/app_services/remote_services/api_service.dart';
import 'package:engineering_day_app/features/auth/login/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_services/remote_services/endpoints.dart';

class LoginServices {
  final ApiService client;

  LoginServices(this.client);

  Future<UserModel> login(
      {required String email, required String password}) async {
    var res = await client.postData(endPoint: EndPoints.login, data: {
      "Emp_Mail": email,
      "Password": password,
    });
    dynamic x = res.data;
    return UserModel.fromJson(x);
  }
}

ValueNotifier<UserData> currentUser = ValueNotifier(UserData());

void setCurrentUser(Map<String, dynamic> jsonData) async {
  try {
    currentUser.value = UserData.fromJson(jsonData);
    await CacheHelper.saveData(
      key: 'current_user',
      value: json.encode(jsonData),
    );
  } catch (e) {
    throw new Exception(e);
  }
}

Future<UserData> getCurrentUser() async {
  if (CacheHelper.sharedPreferences.containsKey('current_user')) {
    currentUser.value = UserData.fromJson(
        json.decode(CacheHelper.getData(key: 'current_user')));
    currentUser.value.auth = true;
  } else {
    currentUser.value.auth = false;
  }
  print(currentUser.value.toJson().toString());
  // currentUser.notifyListeners();
  return currentUser.value;
}
