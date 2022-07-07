import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

import '../../../moh_project/post_moh/login_controller.dart';
import '../login_controller.dart';

class Account_User {


  Future  sign_Up_request(String name, String email, String password
      , String repassowrd, String phone_num)async
  {
    var url = base_Url+'/api/signup';
    var uri = Uri.parse(url);
    var response= await http.post(uri,
        body:
        {
          'name':name,
          'email':email,
          'password':password,
          'c_password':repassowrd,
          'phone':phone_num
        }
    ) ;
    print ("dasfksdjkghsjkdhjk+=   ${response.body}");

    if(response.statusCode==201)
    {
      var responsejeson = jsonDecode(response.body);
      Token = responsejeson['access_token'];
      Verifying=responsejeson['verification_code'];
      print("vvvvvvv= ${Verifying}");
      print("ttttttttt= ${Token}");
      return response;
    }
    else
      return "601";

  }


  var token;
  var message;

  Future<String> signIn(String email,String pass,String plusurl) async {
    var url = (base_Url +'/api/login');
    var uri = Uri.parse(url);
    var response = await http.post(

      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {'email':email,
        'password':pass},
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      token = responsejeson['Token'];
// message=responsejeson['success'];
      t=token;
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }


 static Future <String> upadte_user_profile(String name ,String phone) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${t}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${base_Url}'));
    request.fields.addAll({
      'name': '${name}',
      'phone': '${phone}'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return (await response.stream.bytesToString());
    }
    else {
      return (response.reasonPhrase.toString());
    }
  }

static Future <String > get_varvecation_code()async
{
  print ('the token is ${t}');
  var response = await http.get(Uri.parse('$base_Url/api/Admin/ResetPasswordRequest'),
  headers: <String ,String >

      {
      'Authorization':'Bearer $t'
      }
  );
print('the response is ${response.statusCode}');
  if(response.statusCode==200)
    {

      var responsejeson = jsonDecode(response.body);
       var Var= responsejeson['reset password code'];
       print('the varrr is $Var');
   return   Var ;
    }
  else
    return "";
}

//عدل رابط ارسال الريكوست هون ماتنسى ياحب
  static Future <String> Reset_password(String pass,String c_pass) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${t}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${base_Url}/'));
    request.fields.addAll({
      'password': '${pass}',
      'c_password': '${c_pass}'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return (await response.stream.bytesToString());
    }
    else {
      return (response.reasonPhrase.toString());
    }
  }
}