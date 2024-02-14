import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
import 'package:engineering_day_app/core/utils/new_toast/new_toast.dart';
import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/layout/presentation/views/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../data/repos/login_repos.dart';

 class LoginProvider with ChangeNotifier {
   LoginProvider(this.loginRepo);
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
  Future<void> login({required String email , required String password , required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    var result = await loginRepo!.login(email: email, password: password , context: context);
    return result.fold((failure) {
      print("mostafa 5");
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
      print(failure.errMessage);
    }, (data) {
      print("mostafa 6");
      AppNav.customNavigator(context: context, screen: const LayoutView(), finish: true);
      NewToast.showNewSuccessToast(msg: "${data.message}", context: context);
      _isLoading = false;
      notifyListeners();
    });
  }
}

//
// if (response.statusCode == 200) {
// _isLoggedIn = true;
// } else {
// // Handle login failure
// _errorMessage = 'Invalid username or password';
// _isLoggedIn = false;
// }
// } catch (error) {
// // Handle network or any other errors
// _errorMessage = 'An error occurred. Please try again later.';
// _isLoggedIn = false;
// } finally {
// // Reset loading state
// _isLoading = false;
// notifyListeners();
// }