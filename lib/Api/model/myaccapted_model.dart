// To parse this JSON data, do
//
//     final myascapted = myascaptedFromJson(jsonString);

import 'dart:convert';

List<Myascapted> myascaptedFromJson(String str) => List<Myascapted>.from(json.decode(str).map((x) => Myascapted.fromJson(x)));

String myascaptedToJson(List<Myascapted> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Myascapted {
  Myascapted({
  required  this.id,
    required  this.userId,
    required this.serviceId,
    required  this.startTime,
    required this.endTime,
    required   this.gateName,
    required    this.isAccepted,
    required this.createdAt,
    required   this.updatedAt,
  });

  int id;
  int userId;
  int serviceId;
  DateTime startTime;
  DateTime endTime;
  String gateName;
  int isAccepted;
  DateTime createdAt;
  DateTime updatedAt;

  factory Myascapted.fromJson(Map<String, dynamic> json) => Myascapted(
    id: json["id"],
    userId: json["user_id"],
    serviceId: json["service_id"],
    startTime: DateTime.parse(json["start_time"]),
    endTime: DateTime.parse(json["end_time"]),
    gateName: json["Gate_name"],
    isAccepted: json["IsAccepted"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "service_id": serviceId,
    "start_time": "${startTime.year.toString().padLeft(4, '0')}-${startTime.month.toString().padLeft(2, '0')}-${startTime.day.toString().padLeft(2, '0')}",
    "end_time": "${endTime.year.toString().padLeft(4, '0')}-${endTime.month.toString().padLeft(2, '0')}-${endTime.day.toString().padLeft(2, '0')}",
    "Gate_name": gateName,
    "IsAccepted": isAccepted,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
