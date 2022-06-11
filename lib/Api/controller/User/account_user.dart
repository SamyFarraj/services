import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

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
  
  var response = await http.get(Uri.parse('$base_Url/api/ResetPasswordRequest'),
  headers: <String ,String >

      {
        'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmM4OTU1NmI5MWI0Mzg2ODk3Nzg0NWRiYWJjMTAxMTM2NTI2NTQyNzIwYjNjMDJmYzNlZjI1NTUzOWQ4NzAyMDlkY2RlYjVmNWQwNmE4ZjYiLCJpYXQiOjE2NTAyNzgxODkuODMzMDA4LCJuYmYiOjE2NTAyNzgxODkuODMzMDEzLCJleHAiOjE2ODE4MTQxODkuODI1NzMzLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.fXEerbG_WvyVkOtDsCRsWlk6RJ0J9Q3dEzHjMtsPf0k1DbmJS2RN_Fspy07Uf6p8Gv7CMNML73fVt4f6JIb9bPGqzve3PuFqmpbyC9yEhFQtWBCS_R3FKrrtkek9UzQCvfG5SoyBa7cGYyma_00w9dcLy9zYXzWErfDAavmYPnex8Q7L-M58DKEpF7nJosDyXL5OzMgdAO50rD2VxOq48U1Ey6yd0TZyDKFolp3YeEJKM-G_Lee8cqA_hIEclJhvxCeyXnDk6eqjspBCyh6MuArxi-dJpQ0qXtoCrgAErDcdVRG5KH9oJ0Qz052pcQpIAI69i3Ip0kULxRlfk_aJDFXAyi1CGXMOpk1Wc4L29aApkTSnqesXPnsnpWs9Al4qtfNZypf7jDIj-nOWXcSyFxiM9PRZ4OgfLeDNcLoo_1yTZ8ib-LEydUzKLp7nqOnuUA9VBVQIZzJ1NoDzwvV73yLgv6QuiNFcH6nc_jJXxlgFodwZa2dx-etyexj4ACWZp6x7agkD1oR3BuiwxOp8d4AWCmllzFjr5MlcMA2GMRJzIS0IoSvMAUbxumAh-__VMQT7e_Pk928LD2Fj-bYQjTWuv88zpeWDiAYNBdYm5R8sCKyHRvzM0hOv-e6LKQOSCmv5skfpsaqv8JznF5b7f_smAG_D4PKxPEr67NTkHFE'
  }
  );

  if(response.statusCode==200)
    {
      var responsejeson = jsonDecode(response.body);
       var Var= responsejeson['reset password code'];
   return   Var ;
    }
  else
    return "";
}
  static Future <String> Reset_password(String pass,String c_pass) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${t}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${base_Url}'));
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