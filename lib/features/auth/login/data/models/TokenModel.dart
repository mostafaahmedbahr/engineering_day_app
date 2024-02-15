class TokenModel {
  TokenModel({
      this.refresh, 
      this.access,});

  TokenModel.fromJson(dynamic json) {
    refresh = json['refresh'];
    access = json['access'];
  }
  String? refresh;
  String? access;
  bool? auth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = refresh;
    map['access'] = access;
    return map;
  }

}