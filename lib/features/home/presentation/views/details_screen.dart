import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_button.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_global_app_bar.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_loading.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/date_time/date_time_utill.dart';
import 'package:engineering_day_app/features/home/data/models/get_events_details_model.dart';
import 'package:engineering_day_app/features/home/presentation/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.type,
    required this.image,
    required this.title,
  });

  final String type;
  final String image;
  final String title;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    HomeProvider.get(context, listen: false)
        .getEvents(context: context, type: widget.type, isLoad: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return SafeArea(
          child: Scaffold(
            appBar: CustomGlobalAppBar(title: "تفاصيل الفعالية", actions: []),
            body: ConditionalBuilder(
              condition: homeProvider.isLoading != true,
              fallback: (context) {
                return CustomLoading();
              },
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // Stack(
                      //   alignment: Alignment.center,
                      //   children: [
                      //     SizedBox(
                      //       width: double.infinity,
                      //       height: 200,
                      //       child: Image.asset(
                      //         AppImages.background,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //     Positioned(
                      //         top: 10,
                      //         left: 0,
                      //         child: Image.asset(AppImages.cutLogo)),
                      //     Column(
                      //       children: [
                      //         Container(
                      //             padding: const EdgeInsets.all(10),
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(50),
                      //               color: AppColors.whiteColor,
                      //             ),
                      //             child: SvgPicture.asset(
                      //               widget.image,
                      //             )),
                      //         const CustomSizedBox(
                      //           height: 10,
                      //         ),
                      //         Text(
                      //           "widget.title",
                      //           style: AppStyles.textStyle12BlackW400,
                      //         ),
                      //         const CustomSizedBox(
                      //           height: 10,
                      //         ),
                      //         Text(
                      //           " عدد الفعاليات  ${homeProvider.eventsModel.dateDetails![0].capacity}",
                      //           style: AppStyles.textStyle12BlackW400,
                      //         ),
                      //       ],
                      //     ),
                      //     Positioned(
                      //       right: 0,
                      //       top: 50,
                      //       child: IconButton(
                      //         onPressed: () {
                      //           Navigator.of(context).pop();
                      //         },
                      //         icon: const Icon(
                      //           Icons.arrow_back_outlined,
                      //           color: AppColors.whiteColor,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Image.asset(
                                AppImages.login,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                left: 0,
                                bottom: -0,
                                top: 0,
                                child: Image.asset(
                                  AppImages.cutLogo,
                                  width: 87,
                                  height: 134,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Image.asset(
                                  AppImages.cutLogo,
                                  width: 87,
                                  height: 134,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                top: 0,
                                right: 0,
                                left: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(
                                    //           100),
                                    //       color: AppColors.mainColor2),
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(8.0),
                                    //     child: SvgPicture.asset(
                                    //       widget.image,
                                    //       width: 68,
                                    //       height: 68,
                                    //       fit: BoxFit.cover,
                                    //     ),
                                    //   ),
                                    // ),

                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Image.asset(widget.image),
                                    ),
                                    Text(
                                      widget.title,
                                      style: AppStyles
                                          .textStyle16DarkMainColorW800
                                          .copyWith(
                                          color: AppColors.blackColor),
                                    ),
                                    Text(
                                      "يقدمها نخبة من المتحدثين",
                                      style: AppStyles
                                          .textStyle16DarkMainColorW800
                                          .copyWith(
                                          color: AppColors.blackColor,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "عدد الفعاليات :${homeProvider.eventsModel
                                          .dateDetails?.length}",
                                      style: AppStyles
                                          .textStyle16DarkMainColorW800
                                          .copyWith(
                                          color: AppColors.blackColor,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "فعليات اليوم الهندسي",
                              style: AppStyles.textStyle16DarkMainColorW800,
                            ),
                            const CustomSizedBox(
                              height: 10,
                            ),
                            DynamicHeightGridView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                homeProvider.eventsModel.dayList?.length ?? 0,
                                crossAxisCount: 3,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 8,
                                builder: (ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      homeProvider.selectedEventDay =
                                      homeProvider.eventsModel.dayList?[index];
                                      print(homeProvider.selectedEventDay);
                                      homeProvider.getSelectedItem(
                                          homeProvider.selectedEventDay);
                                      // homeProvider.changeShowTicketsValue();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          color: homeProvider
                                              .selectedEventDay ==
                                              homeProvider
                                                  .eventsModel.dayList?[index]
                                              ? AppColors.whiteColor
                                              : AppColors.greyColor2,
                                          border: Border.all(
                                              color:
                                              homeProvider.selectedEventDay ==
                                                  homeProvider.eventsModel
                                                      .dayList?[index]
                                                  ? AppColors.mainColor
                                                  : AppColors.greyColor2)),
                                      width: double.infinity,
                                      child: Center(
                                          child: Text(
                                            dateTimeNormalFormat(homeProvider
                                                .eventsModel.dayList![index])
                                                .toString(),
                                            style:
                                            AppStyles
                                                .textStyle16DarkMainColorW800,
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  );
                                }),
                            const CustomSizedBox(
                              height: 10,
                            ),
                            // if (homeProvider.showTickets == true)
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                              homeProvider.getSelectItemList?.length ?? 0,
                              itemBuilder: (context, index) {
                                DateDetails? details =
                                homeProvider.getSelectItemList?[index];
                                return InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return Dialog(
                                            backgroundColor:
                                            AppColors.lightBackGround,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: AppColors.redColor,
                                                    )),
                                                Container(
                                                  height: 250,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      details.description ?? '',
                                                      style: AppStyles
                                                          .textStyle16DarkMainColorW800
                                                          .copyWith()
                                                          .copyWith(
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .blackColor),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        AppImages.nobacgroundCard,
                                        // AppImages.ticketImage,
                                        height: 130,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        fit: BoxFit.fill,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              child: Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${dateTimeFormatZTime(
                                                          details!
                                                              .startTime!)} \n ${dateTimeFormatZTime(
                                                          details.endTime!)}',
                                                      style: AppStyles
                                                          .textStyle16DarkMainColorW800
                                                          .copyWith(
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .whiteColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child: SizedBox(
                                              height: 145,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      details.title ?? '',
                                                      style: AppStyles
                                                          .textStyle16DarkMainColorW800,
                                                      textAlign: TextAlign
                                                          .start,
                                                      maxLines: 2,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              details.place ??
                                                                  '',
                                                              style: AppStyles
                                                                  .textStyle16DarkMainColorW800
                                                                  .copyWith()
                                                                  .copyWith(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .location_on_sharp,
                                                              color: AppColors
                                                                  .mainColor,
                                                            ),
                                                          ],
                                                        ),


                                                        (widget.type ==
                                                            "sustainability" ||
                                                            widget.type == "contests")
                                                            ? SizedBox()
                                                            :
                                                        CustomButton(
                                                          margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                          width: 100,
                                                          borderRadius: 8,
                                                          backgroundColor:
                                                          AppColors.mainColor2,
                                                          btnTxt: "تسجيل",
                                                          onTap: () {
                                                            print(
                                                                "details.id.toString()details.id.toString()details.id.toString() ${details
                                                                    .id
                                                                    .toString()}");
                                                            homeProvider
                                                                .joinEvent(
                                                                id: details.id
                                                                    .toString(),
                                                                context: context);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          details.instructor ??
                                                              '',
                                                          style: AppStyles
                                                              .textStyle16DarkMainColorW800
                                                              .copyWith(
                                                            fontSize: 14,
                                                          ),
                                                          maxLines: 2,
                                                          textAlign:
                                                          TextAlign.center,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Positioned(
                                      //   left: 0,
                                      //   top: 0,
                                      //   bottom: 0,
                                      //   child: RotatedBox(
                                      //       quarterTurns: 1,
                                      //       child: Container(
                                      //         width: 140,
                                      //         height: 15,
                                      //         child: Center(
                                      //           child: new Text(
                                      //             "لم يتم تسجيل حضورك للملتقى",
                                      //             style: AppStyles
                                      //                 .textStyle16DarkMainColorW800
                                      //                 .copyWith(
                                      //                 color: AppColors.whiteColor,
                                      //                 fontSize: 10),
                                      //             maxLines: 1,
                                      //           ),
                                      //         ),
                                      //       )),
                                      // )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ));
    });
  }
}
