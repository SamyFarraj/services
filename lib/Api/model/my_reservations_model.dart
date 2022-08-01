// To parse this JSON data, do
//
//     final myReservations = myReservationsFromJson(jsonString);

import 'dart:convert';

Map<String, List<MyReservations>> myReservationsFromJson(String str) =>
    Map.from(json.decode(str)).map(
      (k, v) => MapEntry<String, List<MyReservations>>(
        k,
        List<MyReservations>.from(
          v.map(
            (x) => MyReservations.fromJson(x),
          ),
        ),
      ),
    );

String myReservationsToJson(Map<String, List<MyReservations>> data) =>
    json.encode(
      Map.from(data).map(
        (k, v) => MapEntry<String, dynamic>(
          k,
          List<dynamic>.from(
            v.map((x) => x.toJson()),
          ),
        ),
      ),
    );

class MyReservations {
  MyReservations({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.startTime,
    required this.endTime,
    required this.gateName,
    required this.isAccepted,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String userId;
  String serviceId;
  String startTime;
  String endTime;
  String gateName;
  String isAccepted;
  String createdAt;
  String updatedAt;

  factory MyReservations.fromJson(Map<String, dynamic> json) => MyReservations(
        id: json["id"].toString(),
        userId: json["user_id"].toString(),
        serviceId: json["service_id"].toString(),
        startTime: DateTime.parse(json["start_time"]).toString(),
        endTime: DateTime.parse(json["end_time"]).toString(),
        gateName: json["Gate_name"],
        isAccepted: json["IsAccepted"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "service_id": serviceId,
        "Gate_name": gateName,
        "IsAccepted": isAccepted,
      };
}
