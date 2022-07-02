




import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

import '../../../../moh_project/post_moh/login_controller.dart';
import '../../login_controller.dart';

class Servicee
{


  Future book_service()async
  {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzEwOWI1YjMzY2JmMjlhMDdjZTk3MGU3ZWYzOGQxMGQ4ODdlNDkzZThlNTgyMDJiOTNiMzU3MDNhNDBkYjY5YzQ0MDE4NDZiNWVkNjNlMzQiLCJpYXQiOjE2NTA5NDQ1NzkuMzcwMjAyLCJuYmYiOjE2NTA5NDQ1NzkuMzcwMjA4LCJleHAiOjE2ODI0ODA1NzkuMzAwNzk1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.LafISEKD8yn9StQjfbHT7yxAFqkDxpmcTgFyqshSmS6bCbuv1lzYc9DpBVT54siGXDkkVW4999pUX6U38S1zAAdK4LvfDip8k74ZA2HIodczwBeWK7AuF0-WG4PCnOwAzXXMe0Qg9_QjPh1FLJ7Dk1tws9MTAs0A42-Or1_hlb2LbUg0_9icWP6__hG78nvLKepCVd4CUNxjQWD1TQj-VA0oK9DZazF8N33dAC4w3TqeDtOfhsIS3cCnEfS13574eS_EhGdOaCwWKUanwyuwjxWOuwmWNf0xzhWljERnHIrC4cr7Yx0urpfYniZtb63Qz7mY8abLX-2dCr9EyFAzsUZyia2zuVZV1OVxTiaOQ6GZEmT6IyOKEMzFTNItRsaJnElYmCrB8eYL1DC4vA7B5txbUqATeR-TLGYwqhA7S18yxElg_peDAqfA-iznUDb90BH3y9toa-tYNYyrFWcCNt7fFH_DwYMxk0LPNz-jm1ATBwX7a9eSaillN8AEpuuq93IXiCicg9pURT_uG3KhafsXHwFJd-2reHRXUkHSgcONEQgHGd0P6McaJPbJnfAaIMcXS06aPNTjROSk3X8RsrICTKPrQDY1DTCtBNfm_6OI1oIDARMaTd2RE3rIPu0jqsTyfmw0NxKM8QvaWNnyPPHCZ5GzVsVBIWJ97-_nWNQ'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${base_Url}/api/Reservation'));
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
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }
Future Reservation_update(String Gate_name,String end_time,String start_time,String service_id,String id) async
{
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${t}'
  };
  var request = http.MultipartRequest('POST', Uri.parse('${base_Url}/api/Reservation/update/${id}'));
  request.fields.addAll({
    'Gate_name': 'Gate 1',
    'end_time': '2022/04/28 02:00',
    'start_time': '2022/04/28 02:30',
    'service_id': '12'
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
}
else {
print(response.reasonPhrase);
}

}

Future <String > delete_reservation (String id)async
  
  {
    var response =await http.delete(Uri.parse("${base_Url}/api/Reservation/$id"),
    headers: {
      'Accept':'application/json',
      'Authorization':'Bearer $t'
    }
    );

print("i am hereee");
    if (response.statusCode==200)
      {
        return response.body;
      }
    else
      return ("the error isss :  ${response.body}");

    
  }

 static Future <String > delte_Service (int id)async

  {
    var response =await http.delete(Uri.parse("${base_Url}/api/Admin/DeleteService/$id"),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${t}'
    }
    );
    print("i am hereee");
print(response.statusCode);
    if (response.statusCode==200)
    {
      print("sklmgdm");
      return response.body;
    }
    else
      return ("the error isss :  ${response.body}");


  }
}