 import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
 import 'package:engineering_day_app/core/shared_widgets/custom_sized_box.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
 import 'package:engineering_day_app/features/home/presentation/views/view_model/home_provider.dart';
import 'package:engineering_day_app/lang/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';



class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.title, required this.value, required this.image});
  final String title;
  final String image;
  final int  value;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return SafeArea(child: Scaffold(
        // appBar: AppBar(
        //   title: Text("$title $value"),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
             Stack(
               alignment: Alignment.center,
               children: [
                 SizedBox(
                   width: double.infinity,
                   height: 200,
                   child: Image.asset(
                     AppImages.background,
                     fit: BoxFit.cover,
                   ),
                 ),
                 Positioned(
                     top: 10,
                     left: 0,
                     child: Image.asset(AppImages.cutLogo)),
                 Column(
                   children: [
                     Container(
                       padding: const EdgeInsets.all(10),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                           color: AppColors.whiteColor,
                         ),
                         child: SvgPicture.asset(image)),
                     const CustomSizedBox(height: 10,),
                     Text(title,
                     style: AppStyles.textStyle12BlackW400,),
                     const CustomSizedBox(height: 10,),
                     Text("عدد الفعاليات${value.toString()}",
                     style: AppStyles.textStyle12BlackW400,),
                   ],
                 ),
               ],
             ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("فعليات اليوم الهندسي",
                      style: AppStyles.textStyle16DarkMainColorW800,),
                    const CustomSizedBox(height: 10,),
                    DynamicHeightGridView(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        builder: (ctx, index) {
                          return  InkWell(
                            onTap: () {
                              homeProvider.changeShowTicketsValue();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              color: AppColors.greyColor2,
                              width: double.infinity,
                              child: const Center(child: Text("14 / 2 / 2024 ",
                                style: AppStyles.textStyle16DarkMainColorW800,)),
                            ),
                          );
                        }
                    ),
                    const CustomSizedBox(height: 10,),
                    if(homeProvider.showTickets == true)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                AppImages.ticketImage,
                                height: 145,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
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
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "title 1",
                                              style: AppStyles
                                                  .textStyle16DarkMainColorW800
                                                  .copyWith(
                                                  color: AppColors.whiteColor),
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "14 / 2 / 2024",
                                                    style: AppStyles
                                                        .textStyle14WhiteW800),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    print("object");
                                                    // showDialog(
                                                    //
                                                    //     context: context,
                                                    //     builder: (ctx) {
                                                    //       return TicketDetails();
                                                    //     });
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(8),
                                                      border: Border.all(
                                                          color: AppColors
                                                              .whiteColor),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        LocaleKeys.showDetails.tr(),
                                                        style: AppStyles
                                                            .textStyle16WhiteW400
                                                            .copyWith(
                                                          fontWeight: FontWeight
                                                              .w700,
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
                        return const SizedBox(height: 10,);
                      },
                      itemCount: 2,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }
      );

  }
}
