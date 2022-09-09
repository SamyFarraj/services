class AddServiceModel {
  String name;
  String street;
  String IsActive;
  String id;

  ///
  ///
  /// الموديل رح يحملي كل الدااتا تبعي
  ///
  ///
  AddServiceModel({
    required this.street,
    required this.name,
    required this.IsActive,
    required this.id,
  });

////
  ///
  /// يستخدم ال الفروم جيسن لما بدي جيب من الباك
  ///
  ///
  /// وبستخدم تو جيسن لما بدي ابعت للباك ؟ ليش؟
  /// لانو انا عم شفر للجيسون واببعت الو
  /// نقطة انتهى
  /// نقطى على السطر
  ///
  ///
  AddServiceModel fromJson(Map<String, dynamic> json) {
    return AddServiceModel(
      id: json['id'],
      street: json['street'],
      name: json['name'],
      IsActive: json['IsActive'],
    );
  }

  Map<String, dynamic> toJson(AddServiceModel addService) {
    return {
      'id': addService.id,
      'name': addService.name,
      'street': addService.street,
      'IsActive': addService.IsActive,
    };
  }
}
