import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String?> getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
      // ignore: avoid_slow_async_io
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }
  } catch (err) {
    print("Cannot get download folder path");
  }
  return directory?.path;
}

Future<File> savePdfInStorage(String fileName, File file) async {
  await checkPermission();
  String _localPath = (await getDownloadPath() ?? "");
  String filePath =
      "${_localPath + "/" + fileName.trim() + "" + DateTime.now().microsecondsSinceEpoch.toString()}.png";
  File fileDef = File(filePath);
  await fileDef.create(recursive: true);
  Uint8List bytes = await file.readAsBytes();
  await fileDef.writeAsBytes(bytes);
  print("${fileDef.writeAsBytes(bytes)} fileDef.writeAsBytes(bytes)fileDef.writeAsBytes(bytes)");
  return fileDef.writeAsBytes(bytes);
}

checkPermission() async {
  var status = await Permission.storage.request();
  if (status.isGranted) {
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}

