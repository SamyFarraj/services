// To parse this JSON data, do
//
//     final allAccountantRegster = allAccountantRegsterFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AllAccountantRegster> allAccountantRegsterFromJson(String str) => List<AllAccountantRegster>.from(json.decode(str).map((x) => AllAccountantRegster.fromJson(x)));

String allAccountantRegsterToJson(List<AllAccountantRegster> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAccountantRegster {
  AllAccountantRegster({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  int id;
  String name;
  String email;
  String phone;
  String photo;
  DateTime createdAt;
  DateTime updatedAt;
  String role;

  factory AllAccountantRegster.fromJson(Map<String, dynamic> json) => AllAccountantRegster(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    photo: json["photo"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    role: json["role"] == null ? null : json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "photo": photo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "role": role == null ? null : role,
  };
}
