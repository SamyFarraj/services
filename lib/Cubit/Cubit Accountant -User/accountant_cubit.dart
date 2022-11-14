import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:project_mohammad/moh_project/post_moh/login_controller.dart';
import 'package:project_mohammad/project/constant.dart';
import 'package:project_mohammad/project/home/dash_board_pages/Settings/edit_account_info.dart';


import '../../../main.dart';
import '../../Api/model/Admin -Accounts model/My Account model.dart';
import '../../Api/shred_preference.dart';


part 'accountant_state.dart';
pushRe(BuildContext context,var Page)
{
  return  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) =>  Page(),
    ),
  );
}
class AccountantCubit extends Cubit<UserAccountantState> {
  AccountantCubit() : super(UserAccountantInitial());


  static AccountantCubit get( context)
  {
    return BlocProvider.of(context);

  }
  late  MyAccount myAccount;

  checkToken()
  async {
    await getSharedDataAdmin();
    await getSharedDataUser();
  }

  var token;
  var message;
  Future<String> Reset_passwordUser(String password, String confirmPassword) async {
    emit(EditAccountInfo());
    var url = (baseUrl + '/api/ResetPassword');
    var uri = Uri.parse(url);

    var response = await http.post(uri, body: {
      'password': '$password', 'c_password': '$confirmPassword'
    }
        ,headers: <String,String>
        {
          'Authorization': 'Bearer $userToken'

        }
    );

    if (response.statusCode == 200) {

      emit(SuccessStatus());
      emit(RefreshLevelState());

      return 'yes';
    } else

    {
      emit(FailureStatus());
      emit(RefreshLevelState());

      return "601";

    }

  }
  Future<String> Reset_passwordAdmin(String password, String confirmPassword) async {
    emit(EditAccountInfo());
    var url = (baseUrl + '/api/ResetPassword');
    var uri = Uri.parse(url);

    var response = await http.post(uri, body: {
      'password': '$password', 'c_password': '$confirmPassword'
    }
        ,headers: <String,String>
        {
          'Authorization': 'Bearer $adminToken'

        });

    if (response.statusCode == 200) {

      emit(SuccessStatus());
      emit(RefreshLevelState());

      return 'yes';
    } else

    {
      emit(FailureStatus());
      emit(RefreshLevelState());

      return "601";

    }

  }

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
      emit(RefreshLevelState());


      return (await response.stream.bytesToString());



    } else {

      emit(SuccessStatus());
      emit(RefreshLevelState());


      return (response.reasonPhrase.toString());
    }
  }




  emitRefreshLevelState()
  {
    emit(RefreshLevelState());
  }

  Future<String> signInUser(String email, String pass) async {
    print("userfsdfsdfsdfsd");
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
      userToken = responsejeson['Token'];
// message=responsejeson['success'];
      await  saveSharedUser(userToken);
      emit(Seccfullog());
      emit(RefreshLevelState());

      // return jsonDecode(response.body)['access_token'];
      return userToken;
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
    print(" admin response log in sssss: ${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      adminToken = responsejeson['Token'];
// message=responsejeson['success'];
      await  saveSharedAdmin(adminToken);
      emit(Seccfullog());
      emit(RefreshLevelState());

      // return jsonDecode(response.body)['access_token'];
      return adminToken;
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
print("${response.statusCode}");
print("${response.body})");
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
      emit(RefreshLevelState());

      return "601";

    }
  }





}
