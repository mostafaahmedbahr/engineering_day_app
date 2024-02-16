import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/home/data/models/get_events_details_model.dart';
import 'package:engineering_day_app/features/home/data/repos/home_repo.dart';
 import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
   HomeProvider(this.homeRepo);

  static HomeProvider get(context, {listen = true}) =>
      Provider.of<HomeProvider>(context, listen: listen);

  bool showTickets = false;

  changeShowTicketsValue()
  {
    showTickets = !showTickets;
    notifyListeners();
  }


  bool _isLoading = false;
  bool _isLoggedIn = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;

  bool get isLoggedIn => _isLoggedIn;

  String get errorMessage => _errorMessage;

  HomeRepo? homeRepo;

  GetEventsDetailsHomeModel eventsModel = GetEventsDetailsHomeModel();

  Future<void> getEvents({required BuildContext context
    , required String type }) async {
    _isLoading = true;
    notifyListeners();
    var result = await homeRepo!.getEvents(
      context: context,
      type: type,
    );
    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
    }, (data) {
      eventsModel = data;
      _isLoading = false;
      notifyListeners();
    });
  }

}