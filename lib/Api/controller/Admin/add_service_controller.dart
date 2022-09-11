import 'package:http/http.dart' as http;

import '../../../main.dart';
import '/project/constant.dart';
import '../../../moh_project/post_moh/login_controller.dart';

// import '../login_controller.dart';
class addServiceAdmin {
  Future<String> addService(String name, String Street) async {
    var url = (baseUrl + '/api/Admin/AddService');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $adminToken'
      },
      body: {'name': name, 'street': Street},
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      // var responsejeson = jsonDecode(response.body);
// message=responsejeson['success'];
      // return jsonDecode(response.body)['access_token'];
      return response.body;
    } else {
      return 'fail';
    }
  }
}
