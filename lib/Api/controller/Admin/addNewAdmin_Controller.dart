import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

import '../login_controller.dart';
class AddNewAdmin_con
{

static  Future<String> Add_new_ADmiin(String name) async {
    var url = (base_Url +'/api/Admin/AddADmin');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOGViM2ViYmIzMjYxZTUzMGE5NWYwZmE5ZjcwZGMxNDA4NTRhOTQ2NzkxZjFiYjU2ZWZmNDBlZjE5NjhiYzM4MjczODVhOTFlODU5Mjk3MWQiLCJpYXQiOjE2NTA1NDQxMjkuODg2NDA0LCJuYmYiOjE2NTA1NDQxMjkuODg2NDA5LCJleHAiOjE2ODIwODAxMjkuODc4NjM2LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.Z9bV15AJhpZz_n1OglM0WTMDmktlMZjB2g2UVS0DYx3Isuw_bSMrgHnv4fQcNBO32CZLHqT7WSYyYUeqzY57GZwUp37-kOUoVlHwHKKr0ltmKpI0DflPYWPbBb1tAokMI1wqC8NiyYvIcSUAwjFnZ1IqciM7c-TRJE1-AUJgqgxJ1kWOLcKw4QQdogxy4qDPOWqXkVA8w2KTuI8zTp04EcP7aNCuNQ5JAr2LgL_LYRACBLl_l-gpYxMyd0O_G_W6V6Axso8oZJFbcUv12Pr8XmhAJSXCzhUSIQ_CPBjavw28tuzyyD1J5rchY6oPOBYuDpglXsA-onWKGag15yQl7rMyW7n3DsFRV9JLUJduYaC-plul0o1Xf2-LGfWntv0yMOUZKrtZYuTLMYmqL_1Mov-Fxu9hAJarBl15QC6V8M6ZmTTo4NEF8N38IPNryfDH6FPIs6VtDDncGlllTIEPn-4y528Dwbdz9m7eDzxsnRvVb8m6GHU1rC1eZCizuVGSXxMMRBqwQJYGLOWCjJAfB_n7YcjnOALyd-Mt03JNnUlGRJF577TW5jBLLyupMkIIc2J3Jf5-B1c0K8JKoGylkrGqzlZR8Hz4cuqp58JBRB55VmwxRMjqNgK9H_cumSqG2BO8OZGWg1mb4w_0_XnL9JgvoPvwLCUeZ2d1qUlAYSM',
      },
      body: {'Admin':name,},
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
