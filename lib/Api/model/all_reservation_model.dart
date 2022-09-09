// To parse this JSON data, do
//
//     final allReservations = allReservationsFromJson(jsonString);

import 'dart:convert';

List<AllReservations> allReservationsFromJson(String str) =>
    List<AllReservations>.from(
      json.decode(str).map(
            (x) => AllReservations.fromJson(x),
          ),
    );

String allReservationsToJson(List<AllReservations> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class AllReservations {
  AllReservations({
    required this.id,
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.gateName,
    required this.isAccepted,
    required this.createdAt,
    required this.updatedAt,
    required this.serviceName,
    required this.userName,
  });

  int id;
  int userId;
  DateTime startTime;
  DateTime endTime;
  String gateName;
  int isAccepted;
  DateTime createdAt;
  DateTime updatedAt;
  String serviceName;
  String userName;

  factory AllReservations.fromJson(Map<String, dynamic> json) =>
      AllReservations(
        id: json["id"],
        userId: json["user_id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        gateName: json["Gate_name"],
        isAccepted: json["IsAccepted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        serviceName: json["service_name"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "Gate_name": gateName,
        "IsAccepted": isAccepted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "service_name": serviceName,
        "user_name": userName,
      };
}
