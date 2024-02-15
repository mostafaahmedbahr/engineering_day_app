class GetTicketModel {
  GetTicketModel({
      this.eventTicket, 
      this.eventsQr,});

  GetTicketModel.fromJson(dynamic json) {
    eventTicket = json['event_ticket'] != null ? EventTicket.fromJson(json['event_ticket']) : null;
    if (json['events_qr'] != null) {
      eventsQr = [];
      json['events_qr'].forEach((v) {
        eventsQr?.add(EventsQr.fromJson(v));
      });
    }
  }
  EventTicket? eventTicket;
  List<EventsQr>? eventsQr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (eventTicket != null) {
      map['event_ticket'] = eventTicket?.toJson();
    }
    if (eventsQr != null) {
      map['events_qr'] = eventsQr?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class EventsQr {
  EventsQr({
      this.id, 
      this.event, 
      this.verificationLink, 
      this.qrCode, 
      this.verficationCode, 
      this.image, 
      this.attend, 
      this.time, 
      this.user,});

  EventsQr.fromJson(dynamic json) {
    id = json['id'];
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
    verificationLink = json['verification_link'];
    qrCode = json['qr_code'];
    verficationCode = json['verfication_code'];
    image = json['image'];
    attend = json['attend'];
    time = json['time'];
    user = json['user'];
  }
  num? id;
  Event? event;
  String? verificationLink;
  dynamic qrCode;
  String? verficationCode;
  String? image;
  bool? attend;
  String? time;
  num? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (event != null) {
      map['event'] = event?.toJson();
    }
    map['verification_link'] = verificationLink;
    map['qr_code'] = qrCode;
    map['verfication_code'] = verficationCode;
    map['image'] = image;
    map['attend'] = attend;
    map['time'] = time;
    map['user'] = user;
    return map;
  }

}

class Event {
  Event({
      this.id, 
      this.title, 
      this.startTime, 
      this.isConsultation,});

  Event.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    startTime = json['start_time'];
    isConsultation = json['is_consultation'];
  }
  num? id;
  String? title;
  String? startTime;
  bool? isConsultation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['start_time'] = startTime;
    map['is_consultation'] = isConsultation;
    return map;
  }

}

class EventTicket {
  EventTicket({
      this.eventAttendQr, 
      this.attendanceQr,});

  EventTicket.fromJson(dynamic json) {
    eventAttendQr = json['event_attend_qr'];
    attendanceQr = json['attendance_qr'];
  }
  String? eventAttendQr;
  bool? attendanceQr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event_attend_qr'] = eventAttendQr;
    map['attendance_qr'] = attendanceQr;
    return map;
  }

}