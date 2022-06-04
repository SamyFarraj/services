// To parse this JSON data, do
//
//     final blockedModel = blockedModelFromJson(jsonString);

import 'dart:convert';

List<BlockedModel> blockedModelFromJson(String str) => List<BlockedModel>.from(json.decode(str).map((x) => BlockedModel.fromJson(x)));

String blockedModelToJson(List<BlockedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlockedModel {
  BlockedModel({
   required this.id,
    required this.name,
    required this.street,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.reservations,
  });

  int id;
  String name;
  String street;
  int isActive;
  DateTime createdAt;
  String updatedAt;
  List<dynamic> reservations;

  factory BlockedModel.fromJson(Map<String, dynamic> json) => BlockedModel(
    id: json["id"],
    name: json["name"],
    street: json["street"],
    isActive: json["IsActive"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    reservations: List<dynamic>.from(json["reservations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "street": street,
    "IsActive": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "reservations": List<dynamic>.from(reservations.map((x) => x)),
  };
}
