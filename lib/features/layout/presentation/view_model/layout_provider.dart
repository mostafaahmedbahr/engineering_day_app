import 'package:flutter/material.dart';

class LayoutProvider with ChangeNotifier {

  int layoutIndex = 1;

  PageController  controller = PageController();

  void changeLayoutIndex(int index) {
    layoutIndex = index;
     controller.jumpToPage(layoutIndex);
    notifyListeners();
  }

  final List<Widget> pages = [
    Text("1"),
    Text("2"),
    Text("3"),
    Text("4"),
    Text("5"),
  ];


}