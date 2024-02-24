// class GetEventsDetailsHomeModel {
//   List<DateDetails>? dateDetails;
//
//   GetEventsDetailsHomeModel({this.dateDetails});
//
//   factory GetEventsDetailsHomeModel.fromJson(Map<String, dynamic> json) {
//     List<DateDetails> dateDetails = [];
//
//     json.forEach((key, value) {
//       return dateDetails.add(DateDetails.fromJson(value));
//     });
//
//     return GetEventsDetailsHomeModel(dateDetails: dateDetails);
//
//     // json.forEach((v) { dateDetails!.add(  DateDetails.fromJson(v)); });
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (dateDetails != null) {
//       // data['2024-02-18'] = dateDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

import 'package:flutter/foundation.dart';

class GetEventsDetailsHomeModel {
  final List<DateDetails>? dateDetails;
  List<String>? dayList;

  GetEventsDetailsHomeModel({
    this.dateDetails,
    this.dayList
  });

  factory GetEventsDetailsHomeModel.fromJson(Map<String, dynamic> json) {
    List<DateDetails> newDateDetails = [];
    List<String> newDayList = [];
    json.forEach((key, value) {
      newDayList.add(key);
      if (kDebugMode) {
        print("keyeyeyeyeyye $key");
      }
      List newValue = value;
      for (var i in newValue) {
        newDateDetails.add(DateDetails.fromJson(i));
      }
    });
    // dayList = newDayList;
    return GetEventsDetailsHomeModel(dateDetails: newDateDetails,dayList: newDayList);
  }
}

class DateDetails {
  int? id;

  // List<Null>? time;
  bool? isActive;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? title;
  String? description;
  String? image;
  String? place;
  String? instructor;
  String? attendanceType;
  String? startTime;
  String? endTime;
  bool? isConsultation;
  int? capacity;
  String? verificationCode;
  int? user;

  DateDetails(
      {this.id,
      // required this.time,
      this.isActive,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.title,
      this.description,
      this.image,
      this.place,
      this.instructor,
      this.attendanceType,
      this.startTime,
      this.endTime,
      this.isConsultation,
      this.capacity,
      this.verificationCode,
      this.user});

  DateDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
//     if (json['time'] != null) {
//       // time = <Null>[];
// // json['time'].forEach((v) { time!.add(new Null.fromJson(v)); });
//     }
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    place = json['place'];
    instructor = json['instructor'];
    attendanceType = json['attendance_type'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isConsultation = json['is_consultation'];
    capacity = json['capacity'];
    verificationCode = json['verification_code'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
//     if (this.time != null) {
// // data['time'] = this.time!.map((v) => v.toJson()).toList();
//     }
    data['is_active'] = isActive;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['place'] = place;
    data['instructor'] = instructor;
    data['attendance_type'] = attendanceType;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['is_consultation'] = isConsultation;
    data['capacity'] = capacity;
    data['verification_code'] = verificationCode;
    data['user'] = user;
    return data;
  }
}
