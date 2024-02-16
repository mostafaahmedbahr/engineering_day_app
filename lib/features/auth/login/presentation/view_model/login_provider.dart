import 'dart:convert';

import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:engineering_day_app/core/utils/app_services/local_services/cache_helper.dart';
import 'package:engineering_day_app/core/utils/app_services/local_services/cache_keys.dart';
import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/auth/login/data/models/TokenModel.dart';
import 'package:engineering_day_app/features/layout/presentation/views/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repos/login_repos.dart';

class LoginProvider with ChangeNotifier {
  LoginProvider(this.loginRepo);
  static LoginProvider get(context, {listen = true}) =>
      Provider.of<LoginProvider>(context, listen: listen);




  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();

  bool _isLoading = false;
  bool _isLoggedIn = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;

  bool get isLoggedIn => _isLoggedIn;

  String get errorMessage => _errorMessage;

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  LoginRepo? loginRepo;

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    var result = await loginRepo!
        .login(email: email, password: password, context: context);
    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
    }, (data) {
      AppNav.customNavigator(
          context: context, screen: const LayoutView(), finish: true);

      setCurrentUser(data.toJson());
      _isLoading = false;
      notifyListeners();
    });
  }
}

ValueNotifier<TokenModel> currentUser = ValueNotifier(TokenModel());

void setCurrentUser(Map<String, dynamic> jsonData) async {
  try {
    currentUser.value = TokenModel.fromJson(jsonData);
    await CacheHelper.saveData(
      key: CacheKeysManger.userTokens,
      value: json.encode(jsonData),
    );
  } catch (e) {
    throw new Exception(e);
  }
}

Future<TokenModel> getCurrentUser() async {
  if (CacheHelper.sharedPreferences.containsKey(CacheKeysManger.userTokens)) {
    currentUser.value = TokenModel.fromJson(
        json.decode(CacheHelper.getData(key: CacheKeysManger.userTokens)));
    currentUser.value.auth = true;
  } else {
    currentUser.value.auth = false;
  }
  print(currentUser.value.toJson().toString());
  // currentUser.notifyListeners();
  return currentUser.value;
}
