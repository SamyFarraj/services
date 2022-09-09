// To parse this JSON data, do
//
//     final listServiceToSend = listServiceToSendFromJson(jsonString);

import 'dart:convert';

ListServiceToSend listServiceToSendFromJson(String str) =>
    ListServiceToSend.fromJson(
      json.decode(str),
    );

String listServiceToSendToJson(ListServiceToSend data) => json.encode(
      data.toJson(),
    );

class ListServiceToSend {
  ListServiceToSend({
    required this.servicesMap,
    required this.startTime,
    required this.endTime,
    required this.gateName,
  });

  List<ServicesMap> servicesMap;
  String startTime;
  String endTime;
  String gateName;

  factory ListServiceToSend.fromJson(Map<String, dynamic> json) =>
      ListServiceToSend(
        servicesMap: List<ServicesMap>.from(
            json["services_map"].map((x) => ServicesMap.fromJson(x))),
        startTime: json["start_time"],
        endTime: json["end_time"],
        gateName: json["Gate_name"],
      );

  Map<String, dynamic> toJson() => {
        "services_map": List<dynamic>.from(
          servicesMap.map(
            (x) => x.toJson(),
          ),
        ),
        "start_time": startTime,
        "end_time": endTime,
        "Gate_name": gateName,
      };
}

class ServicesMap {
  ServicesMap({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory ServicesMap.fromJson(Map<String, dynamic> json) => ServicesMap(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
