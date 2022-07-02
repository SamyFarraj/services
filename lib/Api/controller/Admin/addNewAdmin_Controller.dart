import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

import '../../../moh_project/post_moh/login_controller.dart';
import '../login_controller.dart';
class AddNewAdmin_con
{

static  Future<String> Add_new_ADmiin(String email) async {
    var url = (base_Url +'/api/Admin/AddADmin');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
      body: {'email':email},
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


  static Future RemoveAdmin(int id )async
  {
    var response =await http.delete(Uri.parse('${base_Url}/api/Admin/deleteAdmin/$id'),
    headers: <String,String>
        {
      'Authorization': 'Bearer ${t}'

    }

    );
    print('field ${response.body} ');
    if(response.statusCode==200)
      {
        print('remove seccaful');


      }
    else
      {
        print('field ');
      }
  }
}
