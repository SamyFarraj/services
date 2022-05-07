import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/constant.dart';

import '../login_controller.dart';

class account_user {


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


  Future <String> upadte_user_profile() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzEwOWI1YjMzY2JmMjlhMDdjZTk3MGU3ZWYzOGQxMGQ4ODdlNDkzZThlNTgyMDJiOTNiMzU3MDNhNDBkYjY5YzQ0MDE4NDZiNWVkNjNlMzQiLCJpYXQiOjE2NTA5NDQ1NzkuMzcwMjAyLCJuYmYiOjE2NTA5NDQ1NzkuMzcwMjA4LCJleHAiOjE2ODI0ODA1NzkuMzAwNzk1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.LafISEKD8yn9StQjfbHT7yxAFqkDxpmcTgFyqshSmS6bCbuv1lzYc9DpBVT54siGXDkkVW4999pUX6U38S1zAAdK4LvfDip8k74ZA2HIodczwBeWK7AuF0-WG4PCnOwAzXXMe0Qg9_QjPh1FLJ7Dk1tws9MTAs0A42-Or1_hlb2LbUg0_9icWP6__hG78nvLKepCVd4CUNxjQWD1TQj-VA0oK9DZazF8N33dAC4w3TqeDtOfhsIS3cCnEfS13574eS_EhGdOaCwWKUanwyuwjxWOuwmWNf0xzhWljERnHIrC4cr7Yx0urpfYniZtb63Qz7mY8abLX-2dCr9EyFAzsUZyia2zuVZV1OVxTiaOQ6GZEmT6IyOKEMzFTNItRsaJnElYmCrB8eYL1DC4vA7B5txbUqATeR-TLGYwqhA7S18yxElg_peDAqfA-iznUDb90BH3y9toa-tYNYyrFWcCNt7fFH_DwYMxk0LPNz-jm1ATBwX7a9eSaillN8AEpuuq93IXiCicg9pURT_uG3KhafsXHwFJd-2reHRXUkHSgcONEQgHGd0P6McaJPbJnfAaIMcXS06aPNTjROSk3X8RsrICTKPrQDY1DTCtBNfm_6OI1oIDARMaTd2RE3rIPu0jqsTyfmw0NxKM8QvaWNnyPPHCZ5GzVsVBIWJ97-_nWNQ'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:8000/api/ProfileUpdate'));
    request.fields.addAll({
      'name': 'sara',
      'email': 'sarah.kar@outlook.sa',
      'phone': '0978965412'
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


  Future <String> Reset_password() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTk5NmIzNWI3YmZiZTcwZjVjMjkyNGJjNzNlYTM0YTgxNDFjZTRjZDNhODRlNTdjODc3OWFjODAwZmY1MjBmNmRjZjM2ZjA4OWI5YTQyOTAiLCJpYXQiOjE2NDk0NjU0ODguMzE3MjA3LCJuYmYiOjE2NDk0NjU0ODguMzE3MjEyLCJleHAiOjE2ODEwMDE0ODguMzEwMTIsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.keJDS5HZ0OnA7FXSuU6X5ALQQSAvCnP2ENd453P3PDWhe-lHo31XGZff1I5nfslVISuxNMMHTiOixn5dCZ4KhKfs8ZriBiOYeLXBsw7Gzh3wToLgntZ65bwCn4pBFkJ1jNqpNpUBnVSzP2ncS6_iQN31gvLeGniVaTf3wyLkZy__W9wL0Ad-tCMv40hYJjoREn_2r8unqi9av90QM9JgVBgFxe2qJC0X8JuPSmSsXuBAPjNEToXxlXDJlgfe4q5g6aea_TSN2aUrkzArwPK4hbWud_CdiaWLRBi1aBqhig60jUdUGIcC70AvNrTNFXZmtdgLjqCl0uQ-myYUbOITjfX_rMI-W-OJsZ0q7vtWyZiHQ4lWtSWageZo03lDtevNxPcjNh5isEZHcut8Sr5m7K8fr8hQvDhsKiQhkotUBfax2vvKoqo0jKDDo_vSW32ajA2izBARAk0oT_P9wFzLrDYUoMsea0JhQey_8y9KtJuWQ-1RFz1wnELW2p_-QUyZYmtBI5KiLTHD4GOsjzyE3SXoakrboDcLOCwRcr-SXEMON9xIOYkEYiw0jKQwmdYuMY-5Dkmo8YfCpyyY7dDkUmcaSI4jriumaIN66JoM8xBlLmZYSj9eCDur0Waqi-2ftehOkGNh9cC9V0z6e5Fzaz8YNZ4-wnGTKi6RZfeYRsI'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:8000/api/ResetPassword'));
    request.fields.addAll({
      'password': '1234567890',
      'c_password': '1234567890'
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