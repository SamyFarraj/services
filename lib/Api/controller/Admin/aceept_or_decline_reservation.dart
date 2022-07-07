
import 'package:http/http.dart' as http;

import '../../../moh_project/post_moh/login_controller.dart';
import '../../../project/constant.dart';

class Acc_dec {

  static Future <String> Accept_reservation(int id) async
  {
    var response = await http.get(
        Uri.parse('${base_Url}/api/Admin/AcceptReservation/$id')
        , headers: {
      'Accept': 'application/json'
      ,
      'Authorization': 'Bearer $t'
    }
    );
    print('the res is ${response.statusCode}');
    if (response.statusCode == 200) {
      return 'seccccccc';
    }
    else
      return response.statusCode.toString();
  }


 static Future <String> delete_reservation(int id) async
  {
    var response = await http.delete(
        Uri.parse('${base_Url}/api/Admin/DeleteReservation/$id')
        , headers: {
      'Accept': 'application/json'
      ,
      'Authorization': 'Bearer $t'
    }
    );
    print('the res is ${response.body}');
    if (response.statusCode == 200) {
      return 'seccccccc';
    }
    else
      return response.statusCode.toString();
  }


}