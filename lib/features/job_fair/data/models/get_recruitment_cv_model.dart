class GetRecruitmentCvModel {
  GetRecruitmentCvModel({
      this.id, 
      this.cv, 
      this.cvLink, 
      this.linkedin,});

  GetRecruitmentCvModel.fromJson(dynamic json) {
    id = json['id'];
    cv = json['cv'];
    cvLink = json['cv_link'];
    linkedin = json['linkedin'];
  }
  num? id;
  String? cv; 
  String? cvLink;
  String? linkedin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cv'] = cv;
    map['cv_link'] = cvLink;
    map['linkedin'] = linkedin;
    return map;
  }

}