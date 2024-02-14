import 'package:dio/dio.dart';
import 'package:engineering_day_app/core/utils/app_nav/app_nav.dart';
 import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/charts/data/models/get_statistics_model.dart';
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
  int? x ;
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
      print(data);
      x = data.allUsersCount!;
      print(x);
      print("mostafa 6");
      print("sssss");
       NewToast.showNewSuccessToast(msg: "${data.allAttendance}", context: context);
      _isLoading = false;
      notifyListeners();
    });
  }



  var data;
  bool _isLoading2 = false;
   get dataList => data;
  bool get isLoading2 => _isLoading2;

  Future<void> fetchData() async {
    _isLoading2 = true;
    notifyListeners();

    try {
      final response = await Dio().get('https://kauengday.mftcevents.com/api/get_statistics/');
      final List<dynamic> data2 = response.data;
     print(data);
     print("ffff");
    } catch (error) {
      // Handle error
    }

    _isLoading2 = false;
    notifyListeners();
  }

}

