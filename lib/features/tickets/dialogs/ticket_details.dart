import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter_new/qr_flutter.dart';

class TicketDetails extends StatelessWidget {
  const TicketDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        backgroundColor: Colors.transparent,
        content: Stack(children: [
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              AppImages.ticketDialog,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            bottom: 80,
            top: 0,
            right: 0,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "تذكرة حضور اليوم الهندسي",
                      style: AppStyles.textStyle16DarkMainColorW800
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "${DateFormat('dd', 'ar').format(DateTime.now())} ${DateFormat('MMM', 'ar').format(DateTime.now().add(Duration(days: 3)))} -- ${DateFormat('dd', 'ar').format(DateTime.now())} ${DateFormat('MMM', 'ar').format(DateTime.now().add(Duration(days: 0)))}",
                    style: AppStyles.textStyle14WhiteW800),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -40,
            top: 250,
            right: 0,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "الرجاء ابراز التذكرة لأحد المنظمين",
                      style: AppStyles.textStyle14WhiteW800,
                    ),
                  ),
                ),
                Center(
                  child: QrImageView(
                    foregroundColor: AppColors.lightMainColor,
                    data: 'Rainbow after the rain',
                    version: QrVersions.auto,
                    size: 130,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.whiteColor),
                    ),
                    child: Center(
                      child: Text(
                        "تحميل التذكره",
                        style: AppStyles.textStyle16WhiteW400.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
