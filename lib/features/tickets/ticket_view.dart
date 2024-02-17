import 'package:easy_localization/easy_localization.dart';
import 'package:engineering_day_app/core/shared_widgets/CustomDivider.dart';
import 'package:engineering_day_app/core/shared_widgets/condition_builder.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_global_app_bar.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/date_time/date_time_utill.dart';
import 'package:engineering_day_app/core/utils/nodate/nodatea_widget.dart';
import 'package:engineering_day_app/features/tickets/data/models/ticket_model.dart';
import 'package:engineering_day_app/features/tickets/dialogs/ticket_details.dart';
import 'package:engineering_day_app/features/tickets/presentation/view_model/ticket_provider.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketView extends StatefulWidget {
  TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  void initState() {
    TicketProvider.get(context, listen: false)
        .getTicket(context: context, isLoad: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TicketProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomGlobalAppBar(title: "التذاكر", actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "عدد التذلكر :${provider.ticket.eventsQr?.length ?? 0}",
                style: AppStyles.textStyle14WhiteW800
                    .copyWith(color: AppColors.blackColor),
              ),
            )
          ]),
          body: ConditionBuilderWidget(
            isLoading: provider.isLoading,
            child:

            (provider.ticket.eventsQr?.isEmpty??true)?


            EmptyWidget()
                :    ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: provider.ticket.eventsQr?.length ?? 0,
              itemBuilder: (ctx, index) {
                EventsQr? eventsQr = provider.ticket.eventsQr?[index];
                return Stack(
                  children: [
                    Image.asset(
                      eventsQr?.attend == true
                          ? AppImages.attendTicketImage
                          : AppImages.ticketImage,
                      height: 145,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            height: 145,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    eventsQr?.event?.title ?? '',
                                    style: AppStyles
                                        .textStyle16DarkMainColorW800
                                        .copyWith(color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          "${dateTimeFormatToDay(eventsQr!.event!.startTime!)} ${startTime(eventsQr.time)}",
                                          // "${DateFormat('dd', 'ar').format(ticketList[index]["dateFrom"])} ${DateFormat('MMM', 'ar').format(ticketList[index]["dateFrom"])} -- ${DateFormat('dd', 'ar').format(ticketList[index]["dateTo"])} ${DateFormat('MMM', 'ar').format(ticketList[index]["dateTo"])}",
                                          style:
                                              AppStyles.textStyle14WhiteW800),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) {
                                                return TicketDetails(
                                                  eventsQr: eventsQr,
                                                );
                                              });
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: AppColors.whiteColor),
                                          ),
                                          child: Center(
                                            child: Text(
                                              LocaleKeys.showDetails.tr(),
                                              style: AppStyles
                                                  .textStyle16WhiteW400
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        )
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
                              child: Text(
                                (eventsQr.attend == true)
                                    ? "تم تسجيل حضورك"
                                    : "لم يتم تسجيل حضورك للملتقى",
                                style: AppStyles.textStyle16DarkMainColorW800
                                    .copyWith(
                                        color: (eventsQr.attend == true)
                                            ? AppColors.blackColor
                                            : AppColors.whiteColor,
                                        fontSize: 10),
                                maxLines: 1,
                              ),
                            ),
                          )),
                    ),
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
          ),
        );
      },
    );
  }
}
