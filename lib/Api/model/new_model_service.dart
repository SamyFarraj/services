
import 'dart:convert';

FinalService finalServiceFromJson(String str) => FinalService.fromJson(
      json.decode(str),
    );

String finalServiceToJson(FinalService data) => json.encode(
      data.toJson(),
    );

class FinalService {
  FinalService({
    required this.services,
  });

  Services services;

  factory FinalService.fromJson(Map<String, dynamic> json) => FinalService(
        services: Services.fromJson(
          json["services"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "services": services.toJson(),
      };
}

class Services {
  Services({
    required this.woodWard,
    required this.farmer,
    required this.bothStreet,
  });

  List<BothStreet> woodWard;
  List<BothStreet> farmer;
  List<BothStreet> bothStreet;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        woodWard: List<BothStreet>.from(
          json["WoodWard"].map(
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
        "WoodWard": List<dynamic>.from(
          woodWard.map(
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
    required this.reservations,
  });

  int id;
  String name;
  String street;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> reservations;

  factory BothStreet.fromJson(Map<String, dynamic> json) => BothStreet(
        id: json["id"],
        name: json["name"],
        street: json["street"],
        isActive: json["IsActive"],
        createdAt: DateTime.parse(
          json["created_at"],
        ),
        updatedAt: DateTime.parse(
          json["updated_at"],
        ),
        reservations: List<dynamic>.from(
          json["reservations"].map((x) => x),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "street": street,
        "IsActive": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "reservations": List<dynamic>.from(
          reservations.map(
            (x) => x,
          ),
        ),
      };
}
