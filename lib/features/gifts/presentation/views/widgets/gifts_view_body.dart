import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:flutter/cupertino.dart';

import 'gifts_view_body_item.dart';


class GiftsViewBody extends StatelessWidget {
  const GiftsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: ListView.separated(
        itemBuilder:  (context , index ){
          return const GiftsViewBodyItem();
        },
        separatorBuilder: (context , index ){
          return const CustomSizedBox(height: 20,);
        },
        itemCount: 5,
      ),
    );
  }
}
