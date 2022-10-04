import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:project_mohammad/moh_project/post_moh/login_controller.dart';
import 'package:project_mohammad/project/constant.dart';
import 'package:project_mohammad/project/home/dash_board_pages/Settings/edit_account_info.dart';


import '../../../main.dart';
import '../../Api/model/Admin -Accounts model/My Account model.dart';
import '../../Api/shred_preference.dart';


part 'user_accountant_state.dart';

class UserAccountantCubit extends Cubit<UserAccountantState> {
  UserAccountantCubit() : super(UserAccountantInitial());


  static UserAccountantCubit get( context)
  {
    return BlocProvider.of(context);

  }
  late  MyAccount myAccount;

checkToken()
 async {
   print("hooola");
 await getSharedDataAdmin();
   userToken = '';

}

  var token;
  var message;
  /*

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

      adminToken = token;
      saveShared(theToken);
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }


   */

   Future<String> updateUserProfile(String name, String phone) async {
    emit(EditAccountInfo());
    theToken=userToken;
    theToken=adminToken;
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${theToken}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}/api/Admin/ProfileUpdate'));
    request.fields.addAll({'name': '${name}', 'phone': '${phone}'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('the statues is ${response.statusCode}');
    if (response.statusCode == 200) {

      emit(SuccessStatus());


      return (await response.stream.bytesToString());



    } else {
      emit(FailureStatus());
      emit(RefreshLevelState());

      return (response.reasonPhrase.toString());
    }
  }




  emitRefreshLevelState()
  {
    emit(RefreshLevelState());
  }
  Future<String> signInUser(String email, String pass) async {
    emit(CheckPassword());
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
    print("${response.statusCode}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      token = responsejeson['Token'];
// message=responsejeson['success'];
      saveSharedUser(token);
     print("the my token ${getSharedDataUser().toString()}") ;
      emit(Seccfullog());
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      emit(ErrorPasswordState());
      emit(RefreshLevelState());
      return 'fail';
    }
  }

  Future<String> signInAdmin(String email, String pass) async {
    emit(CheckPassword());

    var url = (baseUrl + '/api/Admin/login');
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
      saveSharedAdmin(token);
      emit(Seccfullog());

      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {

      emit(ErrorPasswordState());
      emit(RefreshLevelState());

      return 'fail';
    }
  }


  Future sign_Up_request(String name, String email, String password,
      String rePassword, String phone_num) async {
    emit(CheckInformation());
    var url = baseUrl + '/api/signup';
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: {
      'name': name,
      'email': email,
      'password': password,
      'c_password': rePassword,
      'phone': phone_num,
    });

    if (response.statusCode == 201) {
      var responsejeson = jsonDecode(response.body);
      Token = responsejeson['access_token'];
      Verifying = responsejeson['verification_code'];
      emit(SuccessSignUpState());
      emit(RefreshLevelState());

      return response;
    } else

      {
        emit(FailedSignUpState());

        return "601";

      }
  }





/*

  Future<String> logInadmin(String name,String pass, String id) async {
    var uri = Uri.parse('${baseUrl}api/User/login');
    var response = await http.post(

      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {
        'name':name,
        'password':pass,
        'id':id
      },
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
       adminToken = responsejeson['Token'];
// message=responsejeson['success'];
      // return jsonDecode(response.body)['access_token'];
      return adminToken;
    }
    else {
      return 'fail';
    }
  }
  Future<String> logInSupply(String name,String pass, String id) async {
    var uri = Uri.parse('${baseUrl}api/User/login');
    var response = await http.post(

      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {
        'name':name,
        'password':pass,
        'id':id
      },
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
       tokenSupply = responsejeson['Token'];
// message=responsejeson['success'];

      // return jsonDecode(response.body)['access_token'];
      return tokenSupply;
    }
    else {
      return 'fail';
    }
  }
  Future<Object> getMyAccountantForSell()async
  {
    var response=await http.get(Uri.parse('${baseUrl}api/User/MyProfile'),
        headers: <String,String>
        {
          'Authorization':'Bearer $tokenSell'
        }
    );
    print('thfsdfas s${response.statusCode}');

    print('the response i s${response.statusCode}');
    if(response.statusCode==200)
    {

      myAccount=myAccountFromJson(response.body);
      print('the response i s${(response.body)}');
      emit(RefreshLevelState());
      return response;
    }
    else return [];
  }

  Future<Object> getMyAccountantForSupply()async
  {
    var response=await http.get(Uri.parse('${baseUrl}api/User/MyProfile'),
        headers: <String,String>
        {
          'Authorization':'Bearer $tokenSupply'
        }
    );
    print('thfsdfas s${response.statusCode}');

    print('the response i s${response.statusCode}');
    if(response.statusCode==200)
    {

      myAccount=myAccountFromJson(response.body);
      print('the response i s${(response.body)}');
      emit(RefreshLevelState());
      return response;
    }
    else return [];
  }


//1
  resetPasswordForSell(String pass,String c_pass) async
  {
    emit(Editpassload());
    var response=await http.post(Uri.parse('${baseUrl}api/User/ResetPassword'),
        headers: <String,String>
        {
          'Accept':'application/json',
          'Authorization':'Bearer $tokenSupply'

        },
        body:<String,String>
        {
          'password':pass,
          'c_password':pass,

        }
    );
    print('the response i ss${response.statusCode}');
    if(response.statusCode==200)
    {
      emit(SeccfullEditPass());

      return response;
    }
    else return response;
  }



  resetPasswordForSyplly(String pass,String c_pass) async
  {
    emit(Editpassload());
    var response=await http.post(Uri.parse('${baseUrl}api/User/ResetPassword'),
        headers: <String,String>
        {
          'Accept':'application/json',
          'Authorization':'Bearer $tokenSupply'

        },
        body:<String,String>
        {
          'password':pass,
          'c_password':pass,

        }
    );
    print('the response i ss${response.statusCode}');
    if(response.statusCode==200)
    {
      emit(SeccfullEditPass());

      return response;
    }
    else return response;
  }

//2
  Future <String> resetPasswordRequestForSupply()async
  {
    var response=await http.get(Uri.parse('${baseUrl}api/User/ResetPasswordRequest')
        ,headers: {
          'Accept':'application/json'
          ,          'Authorization':'Bearer $tokenSupply'
        }
    );
    if (response.statusCode==200)
    {
      return 'seccccccc';
    }
    else return response.statusCode.toString();
  }





  resetPasswordForSuper(String pass,String c_pass) async
  {
    emit(Editpassload());
    var response=await http.post(Uri.parse('${baseUrl}api/Admin/ResetPassword'),
        headers: <String,String>
        {
          'Accept':'application/json',
          'Authorization':'Bearer $tokenSuperFiser'

        },
        body:<String,String>
        {
          'password':pass,
          'c_password':pass,

        }
    );
    print('the response i ss${response.statusCode}');
    if(response.statusCode==200)
    {
      emit(SeccfullEditPass());

      return response;
    }
    else return response;
    }


   Future <String> resetPasswordRequestForSuper()async
  {
    var response=await http.get(Uri.parse('${baseUrl}api/Admin/ResetPasswordRequest')
        ,headers: {
          'Accept':'application/json'
          ,          'Authorization':'Bearer $tokenSuperFiser'
        }
    );
    if (response.statusCode==200)
    {
      return 'seccccccc';
    }
    else return response.statusCode.toString();
  }




   Future <String> resetPasswordRequestForSell()async
   {
     var response=await http.get(Uri.parse('${baseUrl}api/User/ResetPasswordRequest')
         ,headers: {
           'Accept':'application/json'
           ,          'Authorization':'Bearer $tokenSupply'
         }
     );
     if (response.statusCode==200)
     {
       return 'seccccccc';
     }
     else return response.statusCode.toString();
   }

//3
   Future <String> logoutsell()async
  {
    //http://127.0.0.1:8000/api/Admin/logout
    var response=await http.get(Uri.parse('${baseUrl}api/User/logout')
        ,headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $tokenSell'
        }
    );
    print('the re ${response.statusCode}');
    if (response.statusCode==200)
    {
      return 'seccful';
    }
    else return response.statusCode.toString();
  }
   Future <String> logoutSyply()async
  {
    //http://127.0.0.1:8000/api/Admin/logout
    var response=await http.get(Uri.parse('${baseUrl}api/User/logout')
        ,headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $tokenSupply'
        }
    );
    print('the re ${response.statusCode}');
    if (response.statusCode==200)
    {
      return 'seccful';
    }
    else return response.statusCode.toString();
  }


  //4
  verifyCode(String email)async
  {
    var response=await http.post(Uri.parse('${baseUrl}api/User/verify'),
        headers: <String,String>
        {
          'Accept':'application/json',
        },
        body:<String,String>
        {
          'email':email
        }
    );
    print('111');
    print('the response i ss${response.statusCode}');
    if(response.statusCode==200)
    {
      print('222222222');
      TokenModel responsejeson = tokenModelFromJson(response.body);
      tokenSupply = responsejeson.token;
      print('tje tokeee is ${responsejeson.token}');
      emit(seccfulcodePass());
      emit(RefreshLevelState());

      return response;
    }
    else response;
  }
  verifyCodeforSuper(String email)async
  {
    var response=await http.post(Uri.parse('${baseUrl}api/Admin/verify'),
        headers: <String,String>
        {
          'Accept':'application/json',
        },
        body:<String,String>
        {
          'email':email
        }
    );
    print('111');
    print('the response i ss${response.statusCode}');
    if(response.statusCode==200)
    {
      print('222222222');
      TokenModel responsejeson = tokenModelFromJson(response.body);
      tokenSuperFiser = responsejeson.token;
      print('tje tokeee is ${responsejeson.token}');
      emit(seccfulcodePass());
      emit(RefreshLevelState());

      return response;
    }
    else response;
  }
  verifyCodeforsell(String email)async
  {
    var response=await http.post(Uri.parse('${baseUrl}api/User/verify'),
        headers: <String,String>
        {
          'Accept':'application/json',
        },
        body:<String,String>
        {
          'email':email
        }
    );
    print('111');
    print('the response i ss${response.statusCode}');
    if(response.statusCode==200)
    {
      print('222222222');
      TokenModel responsejeson = tokenModelFromJson(response.body);
      tokenSell=responsejeson.token;
      print('tje tokeee is ${responsejeson.token}');
      emit(seccfulcodePass());
      emit(RefreshLevelState());

      return response;
    }
    else response;
  }
String thecode='';
  //4
verifyAccount(String email)async
  {
    emit(getcode());
    String emptu='';
    var response=await http.post(Uri.parse('${baseUrl}api/User/AccountVerify'),
        headers: <String,String>
        {
          'Accept':'application/json',
        },
        body:<String,String>
        {
          'email':email
        }
    );
    print('the response i ssfdgdgdf${response.body}');
    if(response.statusCode==200)
    {
      Modelcode responsejeson = modelcodeFromJson(response.body);
      print('the code ussss${responsejeson.code}');
      thecode=responsejeson.code;
      emit(RefreshLevelState());

      emit(Seccfullog());
      emit(RefreshLevelState());


      return responsejeson.code;
    }
    else '';
  }
  verifyAccountForsuperAmdin(String email)async
  {
    emit(getcode());
    String emptu='';
    var response=await http.post(Uri.parse('${baseUrl}api/Admin/AccountVerify'),
        headers: <String,String>
        {
          'Accept':'application/json',
        },
        body:<String,String>
        {
          'email':email
        }
    );
    print('the response i ssfdgdgdf${response.body}');
    if(response.statusCode==200)
    {
      Modelcode responsejeson = modelcodeFromJson(response.body);
      print('the code ussss${responsejeson.code}');
      thecode=responsejeson.code;
      emit(RefreshLevelState());

      emit(Seccfullog());
      emit(RefreshLevelState());


      return responsejeson.code;
    }
    else '';
  }



 */
}
