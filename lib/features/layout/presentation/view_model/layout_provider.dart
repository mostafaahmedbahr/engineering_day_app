import 'package:engineering_day_app/features/job_fair/presentation/views/add_job_fair_view.dart';
import 'package:flutter/material.dart';

import '../../../certificates_and_gifts/presentation/views/certificates_and_gifts_view.dart';
import '../../../charts/presentation/views/charts_view.dart';

class LayoutProvider with ChangeNotifier {

  int layoutIndex = 0;

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
    AddJobFairView(),

    Text("5"),
  ];


}