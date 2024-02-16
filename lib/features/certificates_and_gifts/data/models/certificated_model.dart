class CertificatedModel {
  List<UserCetificates>? userCetificates;

  CertificatedModel({this.userCetificates});

  CertificatedModel.fromJson(Map<String, dynamic> json) {
    if (json['user_cetificates'] != null) {
      userCetificates = <UserCetificates>[];
      json['user_cetificates'].forEach((v) {
        userCetificates!.add(new UserCetificates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userCetificates != null) {
      data['user_cetificates'] =
          this.userCetificates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserCetificates {
  String? url;
  String? eventTitle;

  UserCetificates({this.url, this.eventTitle});

  UserCetificates.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    eventTitle = json['event_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['event_title'] = this.eventTitle;
    return data;
  }
}
