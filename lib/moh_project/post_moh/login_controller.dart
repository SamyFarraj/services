import 'dart:convert';

import 'package:http/http.dart' as http;
String t='';

class logincontroller {
  var token;
  var message;
  var baseUrl = 'https://sara-my-store.000webhostapp.com/api/login';
  Future<String> signIn(String email,String pass) async {
    var url = baseUrl + '/api/login';
    var uri = Uri.parse(baseUrl);
    var response = await http.post(

      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {'email':email,'password':pass},
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      token = responsejeson['access_token'];
// message=responsejeson['success'];
   t=token;
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }
}
