import 'package:engineering_day_app/core/shared_widgets/loading_dialog.dart';
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

  changeShowTicketsValue() {
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

  String? selectedEventDay;
  List<DateDetails>? eventDetails;

  initializeselectedEventDay() {
    if (eventsModel.dayList?.isNotEmpty ?? false) {
      selectedEventDay = eventsModel.dayList?.first;
    } else {
      selectedEventDay = null;
    }
    notifyListeners();
  }

  get getSelectItemList {
    if (eventsModel.dayList?.isNotEmpty ?? false) {
      selectedEventDay = selectedEventDay ?? eventsModel.dayList?.first;
    } else {
      selectedEventDay = null;
    }

    if (selectedEventDay != null) {
      eventDetails = eventsModel.dateDetails
          ?.where((element) =>
              (element.startTime?.contains(selectedEventDay!) ?? false))
          .toList();
    } else {
      eventDetails = [];
    }
    return eventDetails;
  }

  getSelectedItem(selectedEventDay) {
    eventDetails = eventsModel.dateDetails
        ?.where((element) =>
            (element.startTime?.contains(selectedEventDay!) ?? false))
        .toList();
    print(eventDetails);
    notifyListeners();
  }

  Future<void> joinEvent(
      {required String id, required BuildContext context}) async {
    // notifyListeners();
    showLoaderDialog(context);
    var result = await homeRepo!.joinEvent(id: id);
    return result.fold((failure) {
      _isLoading = false;
      Navigator.pop(context);
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
    }, (data) {
      NewToast.showNewSuccessToast(msg: "تم الاشتراك بنجاح", context: context);
      Navigator.pop(context);
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> getEvents(
      {required BuildContext context,
      required String type,
      isLoad = true}) async {
    _isLoading = true;
    if (isLoad == true) {
      notifyListeners();
    }
    var result = await homeRepo!.getEvents(
      context: context,
      type: type,
    );
    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
    }, (data) {
      initializeselectedEventDay();
      // print(data.toJson());
      eventsModel = data;
      _isLoading = false;
      notifyListeners();
    });
  }
}
