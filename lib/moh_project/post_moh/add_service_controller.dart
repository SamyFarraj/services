import 'dart:convert';

import 'package:http/http.dart' as http;

import '/moh_project/model_moh/add_service_model.dart';
import 'login_controller.dart';

class AddService {
  var baseUrl = 'http://192.168.56.1:8000';

  ///
  /// هون ليش بعتت التايب تبع الفيوتشر سترينغ ؟
  ///
  Future<String> add_service(
    AddServiceModel adds,
  ) async {
    var url = baseUrl + '/api/signup';

    /// شو هي ؟
    var uri = Uri.parse(url);

    ///
    var response = await http.post(
      uri,
      body: adds.toJson(adds),
      headers: <String, String>{
        'Authorization': 'Bearer ${theToken}',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      ///
      /// هي الريترن شو فائدتها ؟
      return jsonDecode(response.body)['access_token'];
    } else {
      return 'fail';
    }
  }
}
