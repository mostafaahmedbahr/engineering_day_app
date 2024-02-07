import 'package:flutter/material.dart';

import '../../../certificates_and_gifts/presentation/views/certificates_and_gifts_view.dart';
import '../../../charts/presentation/views/charts_view.dart';

class LayoutProvider with ChangeNotifier {

  int layoutIndex = 1;

  PageController  controller = PageController();

  void changeLayoutIndex(int index) {
    layoutIndex = index;
     controller.jumpToPage(layoutIndex);
    notifyListeners();
  }

  final List<Widget> pages = const [
    Text("1"),
    ChartsView(),
    CertificatesAndGiftsView(),
    Text("4"),
    Text("5"),
  ];


}