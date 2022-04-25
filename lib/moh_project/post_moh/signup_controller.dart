import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/moh_project/model_moh/sign_model.dart';

class UserController {
  var baseUrl = 'http://192.168.43.203:8000';
  ///
  /// هون ليش بعتت التايب تبع الفيوتشر سترينغ ؟
  ///
  Future<String> signUp(UserModel userModel) async {
    var url = baseUrl + '/api/signup';
    /// شو هي ؟
    var uri = Uri.parse(url);
    ///
    var response = await http.post(
      uri,
      body:
    userModel.toJson(userModel),
    );

    print(userModel.email);
    print(response.body);
    if(response.statusCode == 200){
      ///
      /// هي الريترن شو فائدتها ؟
      ///
      return jsonDecode(response.body)['access_token'];
    }

    else {
      return 'fail';
    }
  }
}