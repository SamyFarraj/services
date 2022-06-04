import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_mohammad/moh_project/model_moh/AddService_model.dart';

import 'login_controller.dart';
class addserv {
  var baseUrl = 'http://192.168.56.1:8000';
  ///
  /// هون ليش بعتت التايب تبع الفيوتشر سترينغ ؟
  ///
  Future<String> add_service(addservice adds) async {
    var url = baseUrl + '/api/signup';
    /// شو هي ؟
    var uri = Uri.parse(url);
    ///
    var response = await http.post(uri, body:adds.toJson(adds),
       headers: <String, String>{
    'Authorization': 'Bearer ${t}',
    },
    );
    print(response.body);
    if(response.statusCode == 200){
      ///
      /// هي الريترن شو فائدتها ؟
      return jsonDecode(response.body)['access_token'];
    }
    else {return 'fail';}
  }
}