import 'package:http/http.dart' as http;

import '/project/constant.dart';
import '../../../moh_project/post_moh/login_controller.dart';

class AddNewAdmin_con {
  static Future<String> addNewAdmin(String email) async {
    var url = (baseUrl + '/api/Admin/AddAdmin');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $theToken'
      },
      body: {'email': email},
    );
    print("${response.statusCode}");

    if (response.statusCode == 200) {
      // var responsejeson = jsonDecode(response.body);
// message=responsejeson['success'];
      // return jsonDecode(response.body)['access_token'];
      return response.body;
    } else {
      return 'fail';
    }
  }

  static Future RemoveAdmin(int id) async {
    var response = await http.delete(
        Uri.parse('${baseUrl}/api/Admin/deleteAdmin/$id'),
        headers: <String, String>{'Authorization': 'Bearer ${theToken}'});
    print('field ${response.body} ');
    if (response.statusCode == 200) {
      print('remove successful');
    } else {
      print('field ');
    }
  }
}
