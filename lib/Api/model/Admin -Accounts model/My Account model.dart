// To parse this JSON data, do
//
//     final myAccount = myAccountFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyAccount myAccountFromJson(String str) => MyAccount.fromJson(json.decode(str));

String myAccountToJson(MyAccount data) => json.encode(data.toJson());

class MyAccount {
  MyAccount({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String role;
  String email;
  DateTime emailVerifiedAt;
  String phone;
  String photo;
  DateTime createdAt;
  DateTime updatedAt;

  factory MyAccount.fromJson(Map<String, dynamic> json) => MyAccount(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    phone: json["phone"],
    photo: json["photo"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
    "email": email,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "phone": phone,
    "photo": photo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
