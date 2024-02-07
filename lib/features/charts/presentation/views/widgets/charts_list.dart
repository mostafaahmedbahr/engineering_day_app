import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/shared_widgets/custom_sized_box.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_styles/app_styles.dart';
import '../../../../../lang/locale_keys.dart';
import 'charts_list_item.dart';

class ChartsList extends StatelessWidget {
  const ChartsList({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.statistics.tr(),
            style: AppStyles.textStyle16DarkMainColorW800.copyWith(
              color: AppColors.whiteColor,
            ),),
          const CustomSizedBox(height: 30,),
          Expanded(
            child: DynamicHeightGridView(
                itemCount: 10,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 17,
                builder: (ctx, index) {
                  return  const ChartsListItem();
                }
            ),
          ),
        ],
      ),
    );
  }
}
