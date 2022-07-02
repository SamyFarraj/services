import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

import '../../../moh_project/post_moh/login_controller.dart';

// import '../login_controller.dart';
class Add_sercive_Admin
{
  Future<String> Add_Servicee(String name,String Street) async {
    var url = (base_Url +'/api/Admin/AddService');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
      body: {'name':name,
        'street':Street},
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
// message=responsejeson['success'];
      // return jsonDecode(response.body)['access_token'];
      return response.body;
    } else {
      return 'fail';
    }
  }
}
