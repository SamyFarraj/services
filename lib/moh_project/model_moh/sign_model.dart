class UserModel {
  String name;
  String email;
  String password;
  String c_password;
  String phone;

  ///
  ///
  /// الموديل رح يحملي كل الدااتا تبعي
  ///
  ///
  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
    required this.c_password,
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
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      c_password: json['c_password'],
      email: json['email'],
      name: json['name'],
      password: json['password'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson(UserModel userModel) {
    return {
      'c_password': userModel.c_password,
      'name': userModel.name,
      'email': userModel.email,
      'password': userModel.password,
      'phone': userModel.phone,
    };
  }
}
