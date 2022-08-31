// To parse this JSON data, do
//
//     final showAdmins = showAdminsFromJson(jsonString);

import 'dart:convert';

List<ShowAdmins> showAdminsFromJson(String str) => List<ShowAdmins>.from(json.decode(str).map((x) => ShowAdmins.fromJson(x),),);

String showAdminsToJson(List<ShowAdmins> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson(),),),);

class ShowAdmins {
  ShowAdmins({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  int id;
  String name;
  String email;
  String phone;

  factory ShowAdmins.fromJson(Map<String, dynamic> json) => ShowAdmins(
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
