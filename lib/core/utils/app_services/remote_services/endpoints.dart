class EndPoints {
  static const baseUrl = "https://kauengday.mftcevents.com/";
  static const loginUrl = "auth/jwt/create/";
  static const register1 = "accounts/registration/step1/";
  static const register2 = "accounts/registration/step2/";
  static const register3 = "accounts/registration/step3/";
  static const loginVerify = "auth/jwt/verify/";
  static const statisticsUrl = "api/get_statistics/";
  static const ticketUrl = "newsletter/qrcodes/";
  static const certificatedUrl = "newsletter/show_all_qr_api/";
  static const eventsUrl = "api/events/";
  static   joinEvent (eventId)=> "api/events/join_event/$eventId/";



  static const getRecruitmentCvUrl = "recruitment/cv/";
  static const updateRecruitmentCvUrl = "recruitment/cv/update/";
  static const addRecruitmentCvUrl = "recruitment/cv/create/";



  static const getAuthUser = "auth/users/me/";
  static const changePassword = "auth/users/set_password/";



}
