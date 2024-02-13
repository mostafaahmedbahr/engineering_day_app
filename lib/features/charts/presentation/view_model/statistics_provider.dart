import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
 import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/charts/data/repos/statistics_repos.dart';
import 'package:engineering_day_app/features/layout/presentation/views/layout_view.dart';
import 'package:flutter/material.dart';


class StatisticsProvider with ChangeNotifier {
  StatisticsProvider(this.statisticsRepo);
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


  StatisticsRepo? statisticsRepo;
  Future<void> getStatistics({required BuildContext context , required String token}) async {
    _isLoading = true;
    notifyListeners();
    var result = await statisticsRepo!.getStatistics(context: context , token: "");
    return result.fold((failure) {
      print("mostafa 5");
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
      print(failure.errMessage);
    }, (data) {
      print("mostafa 6");
      AppNav.customNavigator(context: context, screen: const LayoutView(), finish: true);
      NewToast.showNewSuccessToast(msg: "${data.allAttendance}", context: context);
      _isLoading = false;
      notifyListeners();
    });
  }
}

