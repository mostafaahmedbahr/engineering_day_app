import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:engineering_day_app/features/tickets/data/models/ticket_model.dart';
import 'package:engineering_day_app/features/tickets/data/repos/ticket_repos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketProvider with ChangeNotifier {
  TicketProvider(this.ticketRepo);
  TicketRepo? ticketRepo;

  static TicketProvider get(context, {listen = true}) =>
      Provider.of<TicketProvider>(context, listen: listen);

  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  GetTicketModel ticket = GetTicketModel();

  Future<void> getTicket(
      {required BuildContext context, bool isLoad = true}) async {
    _isLoading = true;
    if (isLoad) {
      notifyListeners();
    }
    var result = await ticketRepo!.getTicket(
      context: context,
    );
    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      NewToast.showNewErrorToast(msg: failure.errMessage, context: context);
    }, (data) {
      if (kDebugMode) {
        if (kDebugMode) {
          print("data.toJson()data.toJson() ${data.toJson()}");
        }
      }
      ticket = data;
      _isLoading = false;
      notifyListeners();
    });
  }
}
