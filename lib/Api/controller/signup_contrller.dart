import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

class sign_Up {


  Future <String> update_user_account(String name,String email,String phone)async
  {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDIyZTQ0YmU1MDA0ZDQ2ZWYzNjM1NzYyMzYwNDEwODRkNjQzMGY1ZTIyMjE0Mjg4MzE4NmFjNzg4N2Q0MzY5YTdiMGFjYTc4OThjNzhmYjAiLCJpYXQiOjE2NTEwNTMyNzYuNDY5MjczLCJuYmYiOjE2NTEwNTMyNzYuNDY5Mjc5LCJleHAiOjE2ODI1ODkyNzYuMzQ5MzE4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.YjMmCHcV2OSbGb6B8fPB8iLHZ_QFj0RMavPOAH4AETdm4JbwfpxiXIpmKxHFgsDCEYgnqC9Xpcy_RqCC6wT3rcPmTbbcmsvQJqGqJTDM3bjVXxoCkk4c0U3HaBQ8r9UYhRNdfWoEX53S8qqYIfOiZ7STQUiIyh6WQMny19lt6EG2qBCKDvrM68HHLj4tkBqPvsWfac27k_xPwKEtMeFjuAzU7LRIYo-1oEGq0d7n5rw3XXqteF-bsYzDgGclbvo8NZ6RAIfcknLSkNDlQmlLav6wU5oI_YrrDaK_wUjpxlacxQd-4eP0MF24urcrL3eI5epN0hbQmeH22Ejt9ouEwCw7QrgDZve4vKyp3m4Wcv9LDyONnvvAKeR2T6UTXXZbegWkd1ZOon-KViPZVJC7ICWNHLeKAk85IrqD5f4Ub2HzIXK_WIiQL4f9BGkaH7YQ2F50LGBfixPrgmlGw5EQgux8pMcQe0oIxFCpbNlA0FZn4iKxgBjQW6_tMkZ8ZwXwowbrHXyPMZgU71qOX_kznDSt8XFjxc8k-bZd6VC60JZc9gwDwR-Pl5rs-06QF4th_rRvV13U2L7xyphSauJlMgT1FkgdycAO2fFXRcj0lNubvDpvA_Kvoue5iRviWP_F_Kq_reuIO155EgqSlPYMSyUdhl0aN5JecnnTIIk-xRU'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:8000/api/Admin/ProfileUpdate'));
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


}