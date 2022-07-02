// To parse this JSON data, do
//
//     final showadmins = showadminsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Showadmins> showadminsFromJson(String str) => List<Showadmins>.from(json.decode(str).map((x) => Showadmins.fromJson(x)));

String showadminsToJson(List<Showadmins> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Showadmins {
  Showadmins({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  int id;
  String name;
  String email;
  String phone;

  factory Showadmins.fromJson(Map<String, dynamic> json) => Showadmins(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
  };
}
