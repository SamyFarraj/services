import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

import '../login_controller.dart';

class account {


  Future <String> update_user_account(String name,String email,String phone)async
  {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDIyZTQ0YmU1MDA0ZDQ2ZWYzNjM1NzYyMzYwNDEwODRkNjQzMGY1ZTIyMjE0Mjg4MzE4NmFjNzg4N2Q0MzY5YTdiMGFjYTc4OThjNzhmYjAiLCJpYXQiOjE2NTEwNTMyNzYuNDY5MjczLCJuYmYiOjE2NTEwNTMyNzYuNDY5Mjc5LCJleHAiOjE2ODI1ODkyNzYuMzQ5MzE4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.YjMmCHcV2OSbGb6B8fPB8iLHZ_QFj0RMavPOAH4AETdm4JbwfpxiXIpmKxHFgsDCEYgnqC9Xpcy_RqCC6wT3rcPmTbbcmsvQJqGqJTDM3bjVXxoCkk4c0U3HaBQ8r9UYhRNdfWoEX53S8qqYIfOiZ7STQUiIyh6WQMny19lt6EG2qBCKDvrM68HHLj4tkBqPvsWfac27k_xPwKEtMeFjuAzU7LRIYo-1oEGq0d7n5rw3XXqteF-bsYzDgGclbvo8NZ6RAIfcknLSkNDlQmlLav6wU5oI_YrrDaK_wUjpxlacxQd-4eP0MF24urcrL3eI5epN0hbQmeH22Ejt9ouEwCw7QrgDZve4vKyp3m4Wcv9LDyONnvvAKeR2T6UTXXZbegWkd1ZOon-KViPZVJC7ICWNHLeKAk85IrqD5f4Ub2HzIXK_WIiQL4f9BGkaH7YQ2F50LGBfixPrgmlGw5EQgux8pMcQe0oIxFCpbNlA0FZn4iKxgBjQW6_tMkZ8ZwXwowbrHXyPMZgU71qOX_kznDSt8XFjxc8k-bZd6VC60JZc9gwDwR-Pl5rs-06QF4th_rRvV13U2L7xyphSauJlMgT1FkgdycAO2fFXRcj0lNubvDpvA_Kvoue5iRviWP_F_Kq_reuIO155EgqSlPYMSyUdhl0aN5JecnnTIIk-xRU'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${base_Url}/api/Admin/ProfileUpdate'));
    request.fields.addAll({
      'name': name,
      'email': email,
      'phone': phone
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      return await response.stream.bytesToString();
    }
    else {
      return response.reasonPhrase.toString();
    }

  }

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

  Future<String> signIn(String email,String pass,String plusurl) async {
    var url = (base_Url +'/api/Admin/login');
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
     var token = responsejeson['Token'];
// message=responsejeson['success'];
      t=token;
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }

  Future<String> resetPassword(String pass,String c_pass) async {

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTE1OGE4ZjRjYjNlZjk1Yjk0MWNkYjYzZDFmZmVlOWYyOGQ1MDM0MDllZTZjNWE1OGRjYjc0ZDU3MGQ0MTE1NWFlNWM5ZWMxNGRhNTAyNzMiLCJpYXQiOjE2NTAyNzQzMjIuMTEyNDQ4LCJuYmYiOjE2NTAyNzQzMjIuMTEyNDUzLCJleHAiOjE2ODE4MTAzMjEuOTcyNzg1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.fM5hNrndRTA84bCoNTO5XbOewJGVN0hF-FDmL7rJXvDQONPqqgr2XeN6ffTGM0TZJa80VUE3Iswgdlv7OLfI758aJE2ZykxRsxtfhrTVyATHkTMuxTyPupHpbzX_djblLL2JTyZ_n4dJfoCM5FR3RMopq4GqAD_kOB8s6l2fyozFm9Zdp5hGI5bK1k7NEW6mWRkkiSdbuZT5kxz58palJGKHV2zXKiOJk_h-BNxOn7Nm6tIFVM2OubhJG1JfjUdK478pz_pCEeojEqo48X5UhJwABwqNMMrqEmpMrUDB2ar327zy-ebs99u5LnzhtN04HrxBovD4d0Ba0UMPzc9FQuAN8A_fqlITwxVcLFhoiKwR1q-stBJizG9tr1pM8GnNHaaHrYbe0jXnY1PYv75Hkfy7VJZmHQc6-GHV3R_PTQjqwPIIRR2ygXzGGb4tIVvnppMRwaEMMWmTmnM2Li24Hlm8UGaMyl74OE2GWQpaY0DhWtZbc6Rg6Cpal-sMrwKj89BPoowVg-tr0M8OK-fWyS7K2Vn2M5wqH6wbtkdca-dBnMZR3_9IkYwwcZMpA0-_vIVV5h5o_JTLur2xP-7eo9hQCqNyIHeIY1v_z2X2RhUKASsKDNrBTn_NVCRX1skTtLvx4MCwQWkYs1BVujNegjoT5zzdfjswYg3Q2EHPRyc'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${base_Url}/api/Admin/ResetPassword'));
    request.fields.addAll({
      'password': pass,
      'c_password': c_pass
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return(await response.stream.bytesToString());
    }
    else {
      return(response.reasonPhrase.toString());
    }

  }

Future <String> logout()async
{
  var response=await http.get(Uri.parse('${base_Url}/api/Admin/logout')
  ,headers: {
    'Accept':'application/json'
        ,'Authorization':t }
  );
  if (response.statusCode==200)
    {
      return 'seccful';
    }
  else return response.statusCode.toString();
}

  Future <String> ResetPasswordRequest()async
  {
    var response=await http.get(Uri.parse('${base_Url}/api/ResetPasswordRequest')
        ,headers: {
          'Accept':'application/json'
          ,'Authorization':t }
    );
    if (response.statusCode==200)
    {
      return 'seccccccc';
    }
    else return response.statusCode.toString();
  }
}

