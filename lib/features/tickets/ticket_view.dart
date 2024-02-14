import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/CustomDivider.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_global_app_bar.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/features/tickets/dialogs/ticket_details.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';

class TicketView extends StatelessWidget {
  TicketView({super.key});

  final List ticketList = [
    {
      "title": "تذكرة حضور اليوم الهندسي",
      "dateFrom": DateTime.now(),
      "dateTo": DateTime.now().add(Duration(days: 10)),
    },
    {
      "title": "تذكرة حضور اليوم الهندسي",
      "dateFrom": DateTime.now(),
      "dateTo": DateTime.now().add(Duration(days: 10)),
    },
    {
      "title": "تذكرة حضور اليوم الهندسي",
      "dateFrom": DateTime.now(),
      "dateTo": DateTime.now().add(Duration(days: 10)),
    },
    {
      "title": "تذكرة حضور اليوم الهندسي",
      "dateFrom": DateTime.now(),
      "dateTo": DateTime.now().add(Duration(days: 10)),
    },
    {
      "title": "تذكرة حضور اليوم الهندسي",
      "dateFrom": DateTime.now(),
      "dateTo": DateTime.now().add(Duration(days: 10)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(title: "التذاكر", actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "عدد التذلكر :1",
            style: AppStyles.textStyle14WhiteW800
                .copyWith(color: AppColors.blackColor),
          ),
        )
      ]),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: ticketList.length,
        itemBuilder: (ctx, index) {
          return Stack(
            children: [
              Image.asset(
                AppImages.ticketImage,
                height: 145,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 145,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              ticketList[index]["title"],
                              style: AppStyles.textStyle16DarkMainColorW800
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    "${DateFormat('dd', 'ar').format(ticketList[index]["dateFrom"])} ${DateFormat('MMM', 'ar').format(ticketList[index]["dateFrom"])} -- ${DateFormat('dd', 'ar').format(ticketList[index]["dateTo"])} ${DateFormat('MMM', 'ar').format(ticketList[index]["dateTo"])}",
                                    style: AppStyles.textStyle14WhiteW800),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    print("object");
                                    showDialog(

                                        context: context,
                                        builder: (ctx) {
                                          return TicketDetails();
                                        });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.whiteColor),
                                    ),
                                    child: Center(
                                      child: Text(
                                        LocaleKeys.showDetails.tr(),
                                        style: AppStyles.textStyle16WhiteW400
                                            .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      width: 140,
                      height: 15,
                      child: Center(
                        child: new Text(
                          "لم يتم تسجيل حضورك للملتقى",
                          style: AppStyles.textStyle16DarkMainColorW800
                              .copyWith(
                                  color: AppColors.whiteColor, fontSize: 10),
                          maxLines: 1,
                        ),
                      ),
                    )),
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
              height: 70,
              child: CustomDivider(
                color: AppColors.mainColor,
              ));
        },
      ),
    );
  }
}
