import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {

  bool showTickets = false;

  changeShowTicketsValue()
  {
    showTickets = !showTickets;
    notifyListeners();
  }

}