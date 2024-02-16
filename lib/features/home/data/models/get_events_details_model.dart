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
      print("keyeyeyeyeyye ${key}");
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
//     if (this.time != null) {
// // data['time'] = this.time!.map((v) => v.toJson()).toList();
//     }
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['place'] = this.place;
    data['instructor'] = this.instructor;
    data['attendance_type'] = this.attendanceType;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_consultation'] = this.isConsultation;
    data['capacity'] = this.capacity;
    data['verification_code'] = this.verificationCode;
    data['user'] = this.user;
    return data;
  }
}
