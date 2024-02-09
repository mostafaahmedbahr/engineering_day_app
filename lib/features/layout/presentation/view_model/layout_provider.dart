import 'package:engineering_day_app/features/certificates_and_gifts/presentation/views/certificates_and_gifts_view.dart';
import 'package:engineering_day_app/features/charts/presentation/views/charts_view.dart';
import 'package:engineering_day_app/features/job_fair/presentation/views/add_job_fair_view.dart';
import 'package:engineering_day_app/features/home/presentation/views/home_view.dart';
import 'package:engineering_day_app/features/job_fair/presentation/views/job_fair_view.dart';
import 'package:flutter/material.dart';


class LayoutProvider with ChangeNotifier {

  int layoutIndex = 0;

  PageController  controller = PageController();

  void changeLayoutIndex(int index) {
    layoutIndex = index;
     controller.jumpToPage(layoutIndex);
    notifyListeners();
  }

  final List<Widget> pages = const [
    HomeView(),
    ChartsView(),
    CertificatesAndGiftsView(),
    AddJobFairView(),
    JobFairView(),
  ];


}