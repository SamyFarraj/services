// To parse this JSON data, do
//
//     final page1 = page1FromJson(jsonString);

import 'dart:convert';

Page1 page1FromJson(String str) => Page1.fromJson(json.decode(str));

String page1ToJson(Page1 data) => json.encode(data.toJson());

class Page1 {
  Page1({
    required   this.woodWard,
    required   this.farmer,
    required  this.bothStreets,
  });

  List<BothStreet> woodWard;
  List<BothStreet> farmer;
  List<BothStreet> bothStreets;

  factory Page1.fromJson(Map<String, dynamic> json) => Page1(
    woodWard: List<BothStreet>.from(json["WoodWard"].map((x) => BothStreet.fromJson(x))),
    farmer: List<BothStreet>.from(json["Farmer"].map((x) => BothStreet.fromJson(x))),
    bothStreets: List<BothStreet>.from(json["BothStreets"].map((x) => BothStreet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "WoodWard": List<dynamic>.from(woodWard.map((x) => x.toJson())),
    "Farmer": List<dynamic>.from(farmer.map((x) => x.toJson())),
    "BothStreets": List<dynamic>.from(bothStreets.map((x) => x.toJson())),
  };
}

class BothStreet {
  BothStreet({
    required  this.id,
    required  this.name,
    required this.street,
    required this.isActive,
    required  this.reservations,
  });

  int id;
  String name;
  String street;
  int isActive;
  List<Reservation> reservations;

  factory BothStreet.fromJson(Map<String, dynamic> json) => BothStreet(
    id: json["id"],
    name: json["name"],
    street: json["street"],
    isActive: json["IsActive"],
    reservations: List<Reservation>.from(json["reservations"].map((x) => Reservation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "street": street,
    "IsActive": isActive,
    "reservations": List<dynamic>.from(reservations.map((x) => x.toJson())),
  };
}

class Reservation {
  Reservation({
    required this.id,
    required  this.userId,
    required this.serviceId,
    required  this.date,
    required   this.hour,
    required this.isAccepted,
  });

  int id;
  int userId;
  int serviceId;
  DateTime date;
  String hour;
  int isAccepted;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    id: json["id"],
    userId: json["user_id"],
    serviceId: json["service_id"],
    date: DateTime.parse(json["date"]),
    hour: json["hour"],
    isAccepted: json["IsAccepted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "service_id": serviceId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "hour": hour,
    "IsAccepted": isAccepted,
  };
}
