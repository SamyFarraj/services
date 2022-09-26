import 'dart:convert';

import 'package:http/http.dart' as http;

import '/project/constant.dart';
import '../../../moh_project/post_moh/login_controller.dart';

class Account_User {
  Future sign_Up_request(String name, String email, String password,
      String rePassword, String phone_num) async {
    var url = baseUrl + '/api/signup';
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: {
      'name': name,
      'email': email,
      'password': password,
      'c_password': rePassword,
      'phone': phone_num
    });

    if (response.statusCode == 201) {
      var responsejeson = jsonDecode(response.body);
      Token = responsejeson['access_token'];
      Verifying = responsejeson['verification_code'];
      return response;
    } else
      return "601";
  }

  var token;
  var message;

  Future<String> signIn(String email, String pass, String plusurl) async {
    var url = (baseUrl + '/api/login');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {'email': email, 'password': pass},
    );

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      token = responsejeson['Token'];
// message=responsejeson['success'];
      theToken = token;
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }

  static Future<String> updateUserProfile(String name, String phone) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${theToken}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}'));
    request.fields.addAll({'name': '${name}', 'phone': '${phone}'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return (await response.stream.bytesToString());
    } else {
      return (response.reasonPhrase.toString());
    }
  }

  static Future<String> getVerificationCode(String theToken) async {
    var response = await http.get(
        Uri.parse('$baseUrl/api/Admin/ResetPasswordRequest'),
        headers: <String, String>{'Authorization': 'Bearer $theToken'});
    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      var Var = responsejeson['reset password code'];
      return Var;
    } else
      return "";
  }

//عدل رابط ارسال الريكوست هون ماتنسى ياحب
  static Future<String> Reset_password(String password, String confirmPassword,String theToken) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${theToken}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/'));
    request.fields.addAll({'password': '$password', 'c_password': '$confirmPassword',});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return (await response.stream.bytesToString());
    } else {
      return (response.reasonPhrase.toString());
    }
  }
}
