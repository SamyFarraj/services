import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

class sign_Up {

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


}