// To parse this JSON data, do
//
//     final listServeiceToSend = listServeiceToSendFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListServeiceToSend listServeiceToSendFromJson(String str) => ListServeiceToSend.fromJson(json.decode(str));

String listServeiceToSendToJson(ListServeiceToSend data) => json.encode(data.toJson());

class ListServeiceToSend {
  ListServeiceToSend({
    required this.servicesMap,
    required this.startTime,
    required this.endTime,
    required this.gateName,
  });

  List<ServicesMap> servicesMap;
  String startTime;
  String endTime;
  String gateName;

  factory ListServeiceToSend.fromJson(Map<String, dynamic> json) => ListServeiceToSend(
    servicesMap: List<ServicesMap>.from(json["services_map"].map((x) => ServicesMap.fromJson(x))),
    startTime: json["start_time"],
    endTime: json["end_time"],
    gateName: json["Gate_name"],
  );

  Map<String, dynamic> toJson() => {
    "services_map": List<dynamic>.from(servicesMap.map((x) => x.toJson())),
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
