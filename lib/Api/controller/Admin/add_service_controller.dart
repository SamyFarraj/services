import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

import '../login_controller.dart';
class Add_sercive_Admin
{
  Future<String> Add_Servicee(String name,String Street) async {
    var url = (base_Url +'/api/Admin/AddService');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkM2Y0NTJhMzU2YTI4M2Y4ZGQ5MGQ3NzgxYjU0ZmIyMzE0ZDVkNjBlNmI0YTM0YmNmZWFlMTJkNWRkODc1MzMxZTI3ZWZhOGQzMTM3NzYiLCJpYXQiOjE2NTEyMzQ3NDIuOTkxMTM0LCJuYmYiOjE2NTEyMzQ3NDIuOTkxMTU0LCJleHAiOjE2ODI3NzA3NDIuOTc4MjAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ek1NrqJvLbvZvqQdDecQqUXgqKLef3-Ye7FG39soEesiHyk3DUlcGgIpYoHbHKCH6YBThrqb5PoDQx42DPqbY3cbK895PhKF-Js7gcy2_MEsqrNE8zVTa8yHMRbBNM2wYVaykkyvkz5acWwofqg7dGkXjvTDObilBGRQddOQEIdxwZ_9qIjtjn-_5pMPzhBChJbGddacGc0ryUFHF89MW107cJ4bsaDPhY_rSGTm9NBm3xilBHHFhwEWIcxevuw_bIs9ayuK6aYiaB3d6w-mLuJR9he8W8vTCbkVvqQOk5AnL_3hlKzQ86B8Ce5g-c01OMrkWsIuADFbVv-QgysQGy1zn_kyUwuYmJLiGKYcDtndcW-0ZpJXn-io0UyGdwYFahaofHH7xD_DyW_9kleOGN0BIjaV4GhhMLskb7TFAs2CquLn3E8mCuxKx7MQgWRL-GNL1QHMWuyFezjPWJnTCXJlv-fJQrKYAlwWTsN1UoTchzyolpPEeAEo5AiyH6WQgOyd2ZxaKHikBBu8vKtEE-zONIronEQWJRmauccYKjlpNW3CHoY63rDt2nnskC9FcI3OHX3p_3y8cy9l6wMab8aUBrXwRnebrSA-jAuv6jvHfakf_CelUcB1HnEFIIss5aXxlzYtoyQNUbaOPtW_xer26mZYC1uHcvMynzScejw'
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
