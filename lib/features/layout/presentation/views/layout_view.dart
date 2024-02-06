
import 'package:engineering_day_app/features/layout/presentation/views/widgets/bottom_nav_bar_item.dart';
 import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

 import '../view_model/layout_provider.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<LayoutProvider>(context);
    return Consumer<LayoutProvider>(builder: (context, layoutProvider, child) {
      return Scaffold(
        body: PageView(
          controller: layoutProvider.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: layoutProvider.pages,
        ),
        bottomNavigationBar: const BottomNavBarItems(),

      );
    });
  }
}
