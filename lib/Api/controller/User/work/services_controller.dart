import 'package:http/http.dart' as http;

import '/project/constant.dart';
import '../../../../main.dart';

class Service {
//for user
  Future book_service() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}/api/Reservation'));
    request.fields.addAll({
      'Gate_name': 'Gate 1',
      'start_time': '2022/5/7 15:00',
      'end_time': '2022/5/7 17:00',
      'services_map[0][id]': '12',
      'services_map[0][name]': 'Ramp-BSE',
      'services_map[1][id]': '10',
      'services_map[1][name]': 'Tower Crane 2'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

    } else {

    }
  }

  //for user

  Future Reservation_update(String Gate_name, String end_time,
      String start_time, String service_id, String id) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}/api/Reservation/update/${id}'));
    request.fields.addAll({
      'Gate_name': 'Gate 1',
      'end_time': '2022/04/28 02:00',
      'start_time': '2022/04/28 02:30',
      'service_id': '12'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

    } else {

    }
  }

//for user
  static Future<String> delete_reservation(int id) async {
    var response = await http
        .delete(Uri.parse("${baseUrl}/api/Reservation/$id"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    });


    if (response.statusCode == 200) {
      return response.body;
    } else
      return ("the error is :  ${response.body}");
  }

  //for admin
  static Future<String> deleteService(int id) async {
    var response = await http
        .delete(Uri.parse("${baseUrl}/api/Admin/DeleteService/$id"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${adminToken}'
    });


    if (response.statusCode == 200) {

      return response.body;
    } else
      return ("the error is :  ${response.body}");
  }
}
