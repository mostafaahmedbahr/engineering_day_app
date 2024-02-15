import 'package:easy_localization/easy_localization.dart';

dateTimeFormatToDay(String date) {
  DateTime dateTime  = DateFormat('dd-MM-yyyy HH:mm:ss').parse(date);
  String formattedDate = DateFormat('EEEE, d MMMM',"ar").format(dateTime);

  return formattedDate;
}

startTime(String? time){
if(time==null){
  return '';
}else{
  return "الوقت $time";
}
}
