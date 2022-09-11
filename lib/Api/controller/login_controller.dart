import 'dart:convert';

import 'package:http/http.dart' as http;

import '/project/constant.dart';
import '../../moh_project/post_moh/login_controller.dart';
import '../shred_preference.dart';

//String t='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjJmN2ZjNTU5OGYyZWNlMDYzYjgxYWNiNjBlMTE5YTgyM2ViNzMxMmI1OGYyMjJmY2M4NDI4YzVhMjM0OWQxZTYzMmQyM2IxMjQ5NGI2Y2QiLCJpYXQiOjE2NTY0MTkwMTQuMzgxMDYxLCJuYmYiOjE2NTY0MTkwMTQuMzgxMDY3LCJleHAiOjE2ODc5NTUwMTQuMzcwMTk1LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.oSdbn1b7cT4E9vhCDQxzS0A_96s79_u8jBtY4ZgFkibriLBK_F4UK4XvnYv6uE1Ke5JJDgk8kGGJFhAkUTetoNplOBPvSTRdqzas6x5DCqyB__3J_6nVYmkwXBQtn7sYdunmFOc5kHCNREMBs6DfOwuX7ZRc7kleYnVTO3DZ54KH6ODPgXjlhjTyq5aPkrh2DZAWk7D4LlWYu5QnmhcCFAu6ZktU8dGK8KyvrDjSmd1q2TU9DAOUBsO-VXJAB1_vOgJsG2up5Ezxt_sDmOVu2hBLPNe0OL5aimsiJR9pwhjNXF0JdlEcyfOHVZKQUk_8sqaQqWGPl_0DhpE6riizTW48UjuaUWiiZskIuoicL4P03nhUO5dtkVS-ta91AsSs_qoZugMYfqFyxJvawtZXaGYFyaOI1tumn1KBq1Wjkj-EvOdjqQ-8Coxrim-xoYgTQOTQWI64AfwsMmsJPC9zd4ze0o3aRbPCZ7kR_WiLAs0HbUY6ZsB6ZRUWKeduNEGL-s6jLsELYoqf0iIa3MxAzSnkMt8294_oNqHVYAlW0f600ppJ8Yf0syJZW-NgQccDc5G-n21TRdkmGKWrDg_70ZIjJVjURuSWL-Fs7g80QOShAExg8U1R8dAw2TFPVHO-rG6omhYaKNcdmBK8JZ_0Qo9-8iPviUbByiKz43NHVwQ';

class LoginController {
  var token;
  var message;

  Future<String> signIn(String email, String pass) async {
    var url = (baseUrl + '/api/Admin/login');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {
        'email': email,
        'password': pass,
      },
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      token = responsejeson['Token'];
// message=responsejeson['success'];

      theToken = token;
      saveShared(theToken);
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }

  Future<String> signInUser(String email, String pass) async {
    var url = (baseUrl + '/api/login');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {'email': email,
        'password': pass},
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      token = responsejeson['Token'];
// message=responsejeson['success'];
      saveSharedUser(token);
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }

}