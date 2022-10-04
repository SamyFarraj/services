import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../main.dart';
import '../../project/constant.dart';
import 'package:http/http.dart' as http;

part 'admin_level_state.dart';

class AdminLevelCubit extends Cubit<AdminLevelState> {
  AdminLevelCubit() : super(AdminLevelInitial());
  static AdminLevelCubit get( context)
  {
    return BlocProvider.of(context);

  }


  Future<String> addService(String name, String Street) async {
    emit(AddToDataBase());
    var url = (baseUrl + '/api/Admin/AddService');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $adminToken'
      },
      body: {'name': name, 'street': Street},
    );
    print("${response.body}");

    if (response.statusCode == 201) {
      emit(SuccessStatus());
      emit(RefreshLevelState());

      // var responsejeson = jsonDecode(response.body);
// message=responsejeson['success'];
      // return jsonDecode(response.body)['access_token'];
      return response.body;
    } else {
      emit(FailureStatus());
      emit(RefreshLevelState());

      return 'fail';
    }
  }


  Future<String> Block_Service(int id) async {
    emit(AlterDataBase());

    final response = await http.get(
      Uri.parse('${baseUrl}/api/Admin/BlockServices/${id}'),
      headers: {'Authorization': 'Bearer $adminToken'},
    );
    print(' the response ${response.body}');
    if (response.statusCode == 200) {
      emit(SuccessStatus());
      emit(RefreshLevelState());

      return jsonDecode(response.body);
    } else {
      emit(FailureStatus());
      emit(RefreshLevelState());

      return "Error code is ${response.statusCode}";
    }
  }

   Future<String> deleteService(int id) async {

    emit(AlterDataBase());

    var response = await http
        .delete(Uri.parse("${baseUrl}/api/Admin/DeleteService/$id"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${adminToken}'
    });


    if (response.statusCode == 200) {
      emit(SuccessStatus());
      emit(RefreshLevelState());

      return response.body;
    } else
      {
        emit(FailureStatus());
        emit(RefreshLevelState());
        return ("the error is :  ${response.body}");

      }
  }

  Future <String> Un_Block_Service(int id)async
  {
    emit(AlterDataBase());

    final response = await http.get(
      Uri.parse('${baseUrl}/api/Admin/BlockServices/${id}'),
      headers: {
        'Authorization': 'Bearer $adminToken'
      },
    );
    if(response.statusCode==200)
    {
      emit(SuccessStatus());
      emit(RefreshLevelState());

      return jsonDecode(response.body);
    }
    else
    {
      emit(FailureStatus());
      emit(RefreshLevelState());
      return "Error code is ${response.statusCode}";
    }
  }
 Future<String> addNewAdmin(String email) async {
   emit(AlterDataBase());
    var url = (baseUrl + '/api/Admin/AddAdmin');
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $adminToken'
      },
      body: {'email': email},
    );
    print("${response.statusCode}");

    if (response.statusCode == 200) {
      emit(SuccessStatus());
      emit(RefreshLevelState());

      // var responsejeson = jsonDecode(response.body);
// message=responsejeson['success'];
      // return jsonDecode(response.body)['access_token'];
      return response.body;
    } else {
      emit(FailureStatus());
      emit(RefreshLevelState());
      return 'fail';
    }
  }


   Future<String> Accept_reservation(int id) async {

     emit(AlterDataBase());

     var response = await http.get(
        Uri.parse('${baseUrl}/api/Admin/AcceptReservation/$id'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $adminToken'});
    print('the res is ${response.statusCode}');
    if (response.statusCode == 200) {
      emit(SuccessStatus());
      emit(RefreshLevelState());

      return 'sec';
    } else
      {
        emit(FailureStatus());
        emit(RefreshLevelState());
        return response.statusCode.toString();

      }
  }

   Future<String> delete_reservation(int id) async {
     emit(AlterDataBase());

     var response = await http.delete(
        Uri.parse('${baseUrl}/api/Admin/DeleteReservation/$id'),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $adminToken'});
    print('the res is ${response.body}');
    if (response.statusCode == 200) {
      emit(SuccessStatus());
      emit(RefreshLevelState());

      return 'sec';
    } else
      {
        emit(FailureStatus());
        emit(RefreshLevelState());
        return response.statusCode.toString();

      }
  }
}
