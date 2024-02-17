import 'dart:io';

import 'package:dio/dio.dart';
import 'package:engineering_day_app/core/shared_widgets/custom_loading.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:engineering_day_app/core/utils/app_images/app_images.dart';
import 'package:engineering_day_app/core/utils/app_styles/app_styles.dart';
import 'package:engineering_day_app/core/utils/date_time/date_time_utill.dart';
import 'package:engineering_day_app/core/utils/download_helper/download_helper.dart';
import 'package:engineering_day_app/core/utils/new_toast/new_toast_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter_new/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

// ignore: must_be_immutable
class TicketDetails extends StatelessWidget {
  // final EventsQr eventsQr;
  String? title;
  String? date;
  String? time;
  String? qrImage;
  bool? showQr;

  TicketDetails(
      {super.key, this.title, this.date, this.time, this.qrImage, this.showQr});

  ScreenshotController screenshotController = ScreenshotController();

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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "تذكرة حضور ${title ?? ''}",
                        style: AppStyles.textStyle16DarkMainColorW800
                            .copyWith(color: AppColors.whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("${dateTimeFormatToDay(date)} ${startTime(time)}",
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
                  child: Screenshot(
                    controller: screenshotController,
                    child: (showQr == true)
                        ? QrImageView(
                            foregroundColor: AppColors.lightMainColor,
                            data: qrImage ?? "",
                            version: QrVersions.auto,
                            size: 130,
                            eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.square,
                            ),
                          )
                        : Image.network(
                            qrImage ?? "",
                            height: 130,
                            width: 130,
                            fit: BoxFit.fill,
                            loadingBuilder: (ctx, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }

                              return Center(
                                child: CustomLoading(),
                              );
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Container(
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'لا يمكن تحميل ال Qr',
                                    style: AppStyles.textStyle16WhiteW400
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.redColor),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    final status = await Permission.storage.request();

                    if (status.isGranted) {
                      await download2(Dio(), qrImage ?? '',
                              '${(await getDownloadPath())}')
                          .then((value) {
                        NewToast.showNewSuccessToast(
                            msg: 'تم تحميل التذكره بنجاح', context: context);
                      }).catchError((e) {
                        print("e");
                      });

                      //   // String fileName =
                      //   //     DateTime.now().microsecondsSinceEpoch.toString();
                      //   // String? path = await getDownloadPath();
                      //   // print(path);
                      //
                      //   screenshotController
                      //       .capture()
                      //       .then((capturedImage) async {
                      //     File.fromRawPath(capturedImage!);
                      //     File sourceFile = File.fromRawPath(capturedImage);
                      //     print(sourceFile);
                      //     // await savePdfInStorage("assasa", sourceFile);
                      //     NewToast.showNewSuccessToast(
                      //         msg: 'تم تحميل التذكره بنجاح', context: context);
                      //     // ShowCapturedWidget(context, capturedImage!);
                      //   }).catchError((e) async {
                      //     await Permission.storage.request();
                      //     print("eee ${e}");
                      //     NewToast.showNewErrorToast(
                      //         msg: "يرجي السماح للوصول الي مساحة التخزين",
                      //         context: context);
                      //   });
                    } else {
                      await Permission.storage.request();
                      NewToast.showNewErrorToast(
                          msg: "يرجي السماح للوصول الي مساحة التخزين",
                          context: context);
                    }
                  },
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

Future<String?> getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      // print("await Directory('/storage/emulated/0/Download').exists() ${await Directory('/storage/emulated/0/Download').exists()}");
      directory = await getTemporaryDirectory();

      // if (await Directory('/storage/emulated/0/Download').exists()) {
      //   directory =  Directory('/storage/emulated/0/Download');
      // }else{
      //   directory = await getExternalStorageDirectory();
      //
      // }
    }
  } catch (err) {
    print("Cannot get download folder path");
  }

  String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  String fullPath = "${directory?.path}/$fileName.png'";

  return fullPath;
}

Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Captured widget screenshot"),
      ),
      body: Center(child: Image.memory(capturedImage)),
    ),
  );
}

Future download2(Dio dio, String url, String savePath) async {
  try {
    Response response = await dio.get(
      url,
      onReceiveProgress: showDownloadProgress,
      //Received data with List<int>
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return (status ?? 0) < 500;
          }),
    );
    print(response.realUri);
    print(savePath);
    File file = File(savePath);
    var raf = file.openSync(mode: FileMode.write);
    savePdfInStorage(
        DateTime.now().microsecondsSinceEpoch.toString(), File(savePath));
    // response.data is List<int> type
    raf.writeFromSync(response.data);
    await raf.close();
  } catch (e) {
    print(e);
  }
}

void showDownloadProgress(received, total) {
  if (total != -1) {
    print((received / total * 100).toStringAsFixed(0) + "%");
  }
}
