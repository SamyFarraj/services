// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

List<Reservation> reservationFromJson(String str) => List<Reservation>.from(json.decode(str).map((x) => Reservation.fromJson(x)));

String reservationToJson(List<Reservation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reservation {
  Reservation({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.gateName,
    required this.isAccepted,
  });

  int id;
  int userId;
  int serviceId;
  String startTime;
  String endTime;
  DateTime date;
  dynamic gateName;
  int isAccepted;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    id: json["id"],
    userId: json["user_id"],
    serviceId: json["service_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    date: DateTime.parse(json["date"]),
    gateName: json["Gate_name"],
    isAccepted: json["IsAccepted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "service_id": serviceId,
    "start_time": startTime,
    "end_time": endTime,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "Gate_name": gateName,
    "IsAccepted": isAccepted,
  };
}
