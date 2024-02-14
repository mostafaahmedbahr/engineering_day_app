class UserModel {
  bool? status;
  String? massageEn;
  String? massageAr;
  UserData? data;

  UserModel({this.status, this.massageEn, this.massageAr, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massageEn = json['massageEn'];
    massageAr = json['massageAr'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['massageEn'] = this.massageEn;
    data['massageAr'] = this.massageAr;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  bool rememberMe=false;
  bool? auth;
  bool? isAdmin;
  String? password;

  String? empName;
  String? empID;
  String? empNameAr;
  String? empMobile;
  String? empMail;
  String? loginAcc;
  int? empGroup;
  bool? empStatus;
  int? empCode;
  String? defaultLang;
  String? empCard;
  bool? empDistribution;
  bool? approved;
  String? restorePassSession;
  String? departID;
  String? lang;
  String? compNameEn;
  String? compNameAr;
  String? logo;
  String? mob;
  String? phone;
  String? email;
  String? address;
  // String? defaultLang;
  String? fax;
  String? currencyEn;
  String? currencyAr;
  String? timeZone;
  String? token;
  List<EInvoice>? eInvoice;
  String? clientID;
  String? clientSecret;
  String? accessToken;
  String? accessTokenDecript;
  String? tokenStartDateTime;
  List<EInvoiceSetting>? eInvoiceSetting;
  String? result;

  UserData(
      {this.id,
        this.rememberMe=false,
        this.isAdmin,
        this.password,

        this.empName,
        this.empID,
        this.empNameAr,
        this.empMobile,
        this.empMail,
        this.loginAcc,
        this.empGroup,
        this.empStatus,
        this.empCode,
        this.defaultLang,
        this.empCard,
        this.empDistribution,
        this.approved,
        this.restorePassSession,
        this.departID,
        this.lang,
        this.compNameEn,
        this.compNameAr,
        this.logo,
        this.mob,
        this.phone,
        this.email,
        this.address,
        // this.defaultLang,
        this.fax,
        this.currencyEn,
        this.currencyAr,
        this.timeZone,
        this.token,
        this.eInvoice,
        this.clientID,
        this.clientSecret,
        this.accessToken,
        this.accessTokenDecript,
        this.tokenStartDateTime,
        this.eInvoiceSetting,
        this.result});

  UserData.fromJson(Map<String, dynamic> json) {
    rememberMe = json['rememberMe']??false;
    isAdmin = json['Depart_ID'].toString()=="-1"?true:false;
    password = json['password'];

    id = json['id'];
    empName = json['Emp_Name'];
    empID = json['Emp_ID'];
    empNameAr = json['Emp_Name_ar'];
    empMobile = json['Emp_Mobile'];
    empMail = json['Emp_Mail'];
    loginAcc = json['Login_Acc'];
    empGroup = json['Emp_Group'];
    empStatus = json['Emp_Status'];
    empCode = json['Emp_Code'];
    defaultLang = json['Default_Lang'];
    empCard = json['Emp_Card'];
    empDistribution = json['emp_distribution'];
    approved = json['approved'];
    restorePassSession = json['Restore_Pass_Session'];
    departID = json['Depart_ID'];
    lang = json['Lang'];
    compNameEn = json['comp_name_en'];
    compNameAr = json['comp_name_ar'];
    logo = json['logo'];
    mob = json['mob'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    defaultLang = json['default_lang'];
    fax = json['fax'];
    currencyEn = json['currency_en'];
    currencyAr = json['currency_ar'];
    timeZone = json['time_zone'];
    token = json['Token'];
    if (json['eInvoice'] != null) {
      eInvoice = <EInvoice>[];
      json['eInvoice'].forEach((v) {
        eInvoice!.add(new EInvoice.fromJson(v));
      });
    }
    clientID = json['client_ID'];
    clientSecret = json['Client_secret'];
    accessToken = json['Access_Token'];
    accessTokenDecript = json['Access_TokenDecript'];
    tokenStartDateTime = json['Token_start_date_time'];
    if (json['eInvoiceSetting'] != null) {
      eInvoiceSetting = <EInvoiceSetting>[];
      json['eInvoiceSetting'].forEach((v) {
        eInvoiceSetting!.add(new EInvoiceSetting.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rememberMe'] = this.rememberMe;
    data['password'] = this.password;

    data['id'] = this.id;
    data['Emp_Name'] = this.empName;
    data['Emp_ID'] = this.empID;
    data['Emp_Name_ar'] = this.empNameAr;
    data['Emp_Mobile'] = this.empMobile;
    data['Emp_Mail'] = this.empMail;
    data['Login_Acc'] = this.loginAcc;
    data['Emp_Group'] = this.empGroup;
    data['Emp_Status'] = this.empStatus;
    data['Emp_Code'] = this.empCode;
    data['Default_Lang'] = this.defaultLang;
    data['Emp_Card'] = this.empCard;
    data['emp_distribution'] = this.empDistribution;
    data['approved'] = this.approved;
    data['Restore_Pass_Session'] = this.restorePassSession;
    data['Depart_ID'] = this.departID;
    data['Lang'] = this.lang;
    data['comp_name_en'] = this.compNameEn;
    data['comp_name_ar'] = this.compNameAr;
    data['logo'] = this.logo;
    data['mob'] = this.mob;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['default_lang'] = this.defaultLang;
    data['fax'] = this.fax;
    data['currency_en'] = this.currencyEn;
    data['currency_ar'] = this.currencyAr;
    data['time_zone'] = this.timeZone;
    data['Token'] = this.token;
    if (this.eInvoice != null) {
      data['eInvoice'] = this.eInvoice!.map((v) => v.toJson()).toList();
    }
    data['client_ID'] = this.clientID;
    data['Client_secret'] = this.clientSecret;
    data['Access_Token'] = this.accessToken;
    data['Access_TokenDecript'] = this.accessTokenDecript;
    data['Token_start_date_time'] = this.tokenStartDateTime;
    if (this.eInvoiceSetting != null) {
      data['eInvoiceSetting'] =
          this.eInvoiceSetting!.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class EInvoice {
  int? id;
  int? depID;
  String? clientID;
  String? clientSecret;
  String? accessToken;
  String? tokenStartDateTime;
  String? tokenCertificateIssuer;
  bool? isProduction;

  EInvoice(
      {this.id,
        this.depID,
        this.clientID,
        this.clientSecret,
        this.accessToken,
        this.tokenStartDateTime,
        this.tokenCertificateIssuer,
        this.isProduction,
      });

  EInvoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    depID = json['Dep_ID'];
    clientID = json['client_ID'];
    clientSecret = json['Client_secret'];
    accessToken = json['Access_Token'];
    tokenStartDateTime = json['Token_start_date_time'];
    tokenCertificateIssuer = json['TokenCertificateIssuer'];
    isProduction = json['IsProduction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Dep_ID'] = this.depID;
    data['client_ID'] = this.clientID;
    data['Client_secret'] = this.clientSecret;
    data['Access_Token'] = this.accessToken;
    data['Token_start_date_time'] = this.tokenStartDateTime;
    data['TokenCertificateIssuer'] = this.tokenCertificateIssuer;
    data['IsProduction'] = this.isProduction;
    return data;
  }
}

class EInvoiceSetting {
  int? id;
  String? loginApiUrl;
  String? invoicingApiUrl;
  bool? active;

  EInvoiceSetting(
      {this.id, this.loginApiUrl, this.invoicingApiUrl, this.active});

  EInvoiceSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loginApiUrl = json['login_api_url'];
    invoicingApiUrl = json['invoicing_api_url'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login_api_url'] = this.loginApiUrl;
    data['invoicing_api_url'] = this.invoicingApiUrl;
    data['active'] = this.active;
    return data;
  }
}