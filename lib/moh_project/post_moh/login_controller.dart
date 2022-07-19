import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Api/shredpreference.dart';
String t='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODJkMmFhZDhkNjBkMGIxMjAzYzhlZTY0NjA3NTcxZWEyNmM5NzNmYWUyNWE2MzI2MTIzYjNmNDVhNzgxYzBjM2VkZmM3NTNiOGUwOTg1OWUiLCJpYXQiOjE2NTY1NzQxMTQuMzQ0NDIyLCJuYmYiOjE2NTY1NzQxMTQuMzQ0NDI3LCJleHAiOjE2ODgxMTAxMTQuMzM2OTUyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.fZlWy8pszDPkcFTJ0BST2RmlNDKq3lmhoT-9ik5zMIN6Q4mg41TgEzoQNyPkO34_-zB9t3078c1UqHqTsolqZ5N6JiA1XlA36iEmj1Hs8dN04dozyb4cFzrG0HKhkLMAQlDBDbjsTOFh8rS4xVNouBDdyMaUtBfn2-zes9u8_Q0VD5he9cQCE9lp6I1TDxKr6fu0ur7DyH7NktDATwR75eUoPF9r8tFsBQzB0avaiulDD3lRuk9OkRti3GwDB1-A-J9zyTfzJ_Jri6rstgpGvL9LtXwTfIjohFla2sMke8lLEInuquMQe5DsUpRArSRtHo2kNeubPRlXtzc_Kjdux-L9SXwwGoc1jTz992iU2KOswhONsKcqCedyIQoFd8ehqQhjxuLUfXkPgCvi_1lFW-ZTmg4LOvsmlARHJmzJ-yDjm6v92gJUrLSZQld-udcAZhrar6OpoDcQXTXrrChXkwYZwiZyHR1QCNQtihjkFm8UJQ8Zvys3O2-3sE2qPwQQVkNOggafsc7N-TbXGp_hUJUN8FdaEwMChE3Bv96l1p7-djRN2LvGXAR1cN_V3pQMVms8lh17DrpuB-UjFVkK7ld2yfg_aE7hTbLHzW7IBYeXjTuG2StVRqER_DTmtSsykbdMwef3RMGN4ahfjn5XWMYfJlVWKuhTlcG9QQUbbMo';
// String t='';
class logincontroller {
  var token;
  var message;
  var baseUrl = 'https://sara-my-store.000webhostapp.com/api/login';
  Future<String> signIn(String email,String pass) async {
    var url = baseUrl + '/api/login';
    var uri = Uri.parse(baseUrl);
    var response = await http.post(

      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {'email':email,'password':pass},
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      token = responsejeson['access_token'];
// message=responsejeson['success'];
   t=token;
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }
}
