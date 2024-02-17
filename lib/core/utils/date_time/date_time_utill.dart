import 'package:easy_localization/easy_localization.dart';

dateTimeFormatToDay(String? date) {
  if ((date?.isEmpty ?? true) || date == null) {
    return "";
  }else{

    DateTime dateTime = DateFormat('dd-MM-yyyy HH:mm:ss').parse(date);
    String formattedDate = DateFormat('EEEE, d MMMM', "ar").format(dateTime);

    return formattedDate;
  }


}

dateTimeFormatZTime(String ?date) {
   if ((date?.isEmpty ?? true) || date == null) {
    return "";
  }else {
     DateTime dateTime = DateTime.parse(date);
     String formattedDate = DateFormat('HH:mm a', "ar").format(dateTime);

     return formattedDate;
   }
}

dateTimeNormalFormat(String ?date) {

     if ((date?.isEmpty ?? true) || date == null) {
    return "";
  }else {
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('EEEE, d MMMM', "ar").format(dateTime);

  return formattedDate;
     }
}

startTime(String? time) {
  if (time == null) {
    return '';
  } else {
    return "الوقت $time";
  }
}
