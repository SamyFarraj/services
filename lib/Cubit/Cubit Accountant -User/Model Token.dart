// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  TokenModel({
    required this.message,
    required this.user,
    required this.tokenType,
    required this.token,
  });

  String message;
  User user;
  String tokenType;
  String token;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
    tokenType: json["TokenType"],
    token: json["Token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
    "TokenType": tokenType,
    "Token": token,
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.photo,
    required this.bonus,
    required this.isExist,
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
  var bonus;
  var isExist;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    phone: json["phone"],
    photo: json["photo"],
    bonus: json["bonus"],
    isExist: json["is_exist"],
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
    "bonus": bonus,
    "is_exist": isExist,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
