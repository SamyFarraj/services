
import 'dart:convert';

List<MyAccepted> myAcceptedFromJson(String str) => List<MyAccepted>.from(
      json.decode(str).map(
            (x) => MyAccepted.fromJson(x),
          ),
    );

String myAcceptedToJson(List<MyAccepted> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class MyAccepted {
  MyAccepted({
    required this.id,
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.gateName,
    required this.isAccepted,
    required this.createdAt,
    required this.updatedAt,
    required this.serviceName,
    required this.serviceId,
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
  int serviceId;
  String userName;

  factory MyAccepted.fromJson(Map<String, dynamic> json) => MyAccepted(
        id: json["id"],
        userId: json["user_id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        gateName: json["Gate_name"],
        isAccepted: json["IsAccepted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        serviceName: json["service_name"],
        serviceId: json["service_id"],
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
        "service_id": serviceId,
        "user_name": userName,
      };
}
