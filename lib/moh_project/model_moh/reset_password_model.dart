class reset {
  String password;
  String c_password;

  ///
  ///
  /// الموديل رح يحملي كل الدااتا تبعي
  ///
  ///
  reset({
    required this.password,
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
  reset fromJson(Map<String, dynamic> json) {
    return reset(
      c_password: json['c_password'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson(reset userModel) {
    return {
      'c_password': userModel.c_password,
      'password': userModel.password,
    };
  }
}
