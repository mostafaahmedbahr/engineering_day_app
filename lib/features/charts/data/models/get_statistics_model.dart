class GetStatisticsModel {
  int? visitors;
  int? usersHaveQr;
  int? userHaveQrAndAttend;
  int? allAttendance;
  int? cvCount;
  int? allUsersCount;

  GetStatisticsModel(
      {this.visitors,
        this.usersHaveQr,
        this.userHaveQrAndAttend,
        this.allAttendance,
        this.cvCount,
        this.allUsersCount});

  GetStatisticsModel.fromJson(Map<String, dynamic> json) {
    visitors = json['visitors'];
    usersHaveQr = json['users_have_qr'];
    userHaveQrAndAttend = json['user_have_qr_and_attend'];
    allAttendance = json['all_attendance'];
    cvCount = json['cv_count'];
    allUsersCount = json['all_users_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['visitors'] = visitors;
    data['users_have_qr'] = usersHaveQr;
    data['user_have_qr_and_attend'] = userHaveQrAndAttend;
    data['all_attendance'] = allAttendance;
    data['cv_count'] = cvCount;
    data['all_users_count'] = allUsersCount;
    return data;
  }
}
