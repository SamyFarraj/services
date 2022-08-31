// To parse this JSON data, do
//
//     final listService = listServiceFromJson(jsonString);

import 'dart:convert';

ListService listServiceFromJson(String str) =>
    ListService.fromJson(json.decode(str));

String listServiceToJson(ListService data) => json.encode(data.toJson());

class ListService {
  ListService({
    required this.services,
  });

  Services services;

  factory ListService.fromJson(Map<String, dynamic> json) => ListService(
        services: Services.fromJson(json["services"]),
      );

  Map<String, dynamic> toJson() => {
        "services": services.toJson(),
      };
}

class Services {
  Services({
    required this.woodward,
    required this.farmer,
    required this.bothStreet,
  });

  List<BothStreet> woodward;
  List<BothStreet> farmer;
  List<BothStreet> bothStreet;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        woodward: List<BothStreet>.from(
          json["Woodward"].map(
            (x) => BothStreet.fromJson(x),
          ),
        ),
        farmer: List<BothStreet>.from(
          json["Farmer"].map(
            (x) => BothStreet.fromJson(x),
          ),
        ),
        bothStreet: List<BothStreet>.from(
          json["BothStreet"].map(
            (x) => BothStreet.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "Woodward": List<dynamic>.from(
          woodward.map(
            (x) => x.toJson(),
          ),
        ),
        "Farmer": List<dynamic>.from(
          farmer.map(
            (x) => x.toJson(),
          ),
        ),
        "BothStreet": List<dynamic>.from(
          bothStreet.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class BothStreet {
  BothStreet({
    required this.id,
    required this.name,
    required this.street,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String street;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory BothStreet.fromJson(Map<String, dynamic> json) => BothStreet(
        id: json["id"],
        name: json["name"],
        street: json["street"],
        isActive: json["IsActive"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "street": street,
        "IsActive": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
