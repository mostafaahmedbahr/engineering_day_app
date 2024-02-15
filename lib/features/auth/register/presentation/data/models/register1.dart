class Register1Model {
  Register1Model({
      this.status, 
      this.message, 
      this.sessionid,});

  Register1Model.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    sessionid = json['sessionid'];
  }
  String? status;
  String? message;
  String? sessionid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['sessionid'] = sessionid;
    return map;
  }

}