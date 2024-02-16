class GetProfileModel {
  GetProfileModel({
      this.username, 
      this.gender, 
      this.nationalId, 
      this.phone, 
      this.nameInCertificate, 
      this.email,});

  GetProfileModel.fromJson(dynamic json) {
    username = json['username'];
    gender = json['gender'];
    nationalId = json['national_id'];
    phone = json['phone'];
    nameInCertificate = json['name_in_certificate'];
    email = json['email'];
  }
  String? username;
  String? gender;
  String? nationalId;
  String? phone;
  String? nameInCertificate;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['gender'] = gender;
    map['national_id'] = nationalId;
    map['phone'] = phone;
    map['name_in_certificate'] = nameInCertificate;
    map['email'] = email;
    return map;
  }

}