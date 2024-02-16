import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/charts/data/models/get_statistics_model.dart';
import 'package:engineering_day_app/features/charts/data/repos/statistics_repos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsProvider with ChangeNotifier {
  StatisticsProvider(this.statisticsRepo);

  static StatisticsProvider get(context, {listen = true}) =>
      Provider.of<StatisticsProvider>(context, listen: listen);

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

  GetStatisticsModel static = GetStatisticsModel();

  Future<void> getStatistics(
      {required BuildContext context, bool listen = true}) async {
    _isLoading = true;
    if (listen == true) {
      notifyListeners();
    }
    var result = await statisticsRepo!.getStatistics(
      context: context,
    );
    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
    }, (data) {
      static = data;
      _isLoading = false;
      notifyListeners();
    });
  }
}
