import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';
String t='';

class logincontroller {
  var token;
  var message;

  Future<String> signIn(String email,String pass,String plusurl) async {
    var url = (base_Url +'/api/Admin/login');
    var uri = Uri.parse(url);
    var response = await http.post(

      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {'email':email,
        'password':pass},
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      token = responsejeson['Token'];
// message=responsejeson['success'];
      t=token;
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }
}
