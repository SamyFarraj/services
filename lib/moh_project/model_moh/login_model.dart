class login_model {
  late String email;
  late String password;
  String? token;

  login_model({
    required this.email,
    required this.token,
    required this.password,
  });

  login_model fromJson(Map<String, dynamic> json) {
    return login_model(
      email: json['email'],
      token: json['access_token'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson(login_model Login_model) {
    return {
      'email': Login_model.email,
      // 'access_token' : Login_model.token,
      'password': Login_model.password,
    };
  }
}
