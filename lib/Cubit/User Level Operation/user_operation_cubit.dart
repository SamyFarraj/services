import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../Api/model/list_services_to_send.dart';
import '../../main.dart';
import '../../project/constant.dart';

part 'user_operation_state.dart';

class UserOperationCubit extends Cubit<UserOperationState> {
  UserOperationCubit() : super(UserOperationInitial());


  static UserOperationCubit get( context)
  {
    return BlocProvider.of(context);

  }

  book_reservation(
      String gate_name,
      String Start_time,
      String end_time,
      List choosedServicesList, ListServiceToSend ReservationToSend,List<String> bothId
      ) async {
    for (int i = 0; i < choosedServicesList.length; i++) {
      ReservationToSend.servicesMap.add(
          new ServicesMap(id: bothId[i].toString(), name: choosedServicesList[i])
      );
      // ReservationToSend.servicesMap[i].name=;

    }
    emit(BookReservation());
    ReservationToSend.gateName = gate_name;
    ReservationToSend.startTime = Start_time;
    ReservationToSend.endTime = end_time;
    print("the gateName${ReservationToSend.gateName} ");
    print("the start time${ReservationToSend.startTime} ");
    print("the end time${ReservationToSend.endTime} ");
    print("the list servicesMap id is ${ReservationToSend.servicesMap[0].id}");
    print("the list servicesMap name is ${ReservationToSend.servicesMap[0].name}");
    print("the list servicesMap id is ${ReservationToSend.servicesMap[1].id}");
    print("the list servicesMap name is ${ReservationToSend.servicesMap[1].name}");
    var response = await http.post(
      Uri.parse('$baseUrl/api/Reservation'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
      body: listServiceToSendToJson(ReservationToSend),
    );
    print('the response i ss${response.body}');
    print('the response i ss${response.statusCode}');

    if (response.statusCode == 201) {
      emit(SuccessStatus());

      emit(RefreshLevelState());

      return response;
    } else
      {
        emit(FailureStatus());
        emit(RefreshLevelState());
        response;
      }

  }
  Future<String> delete_reservation(int id) async {
    emit(DeleteReservation());

    var response = await http
        .delete(Uri.parse("${baseUrl}/api/Reservation/$id"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    });


    if (response.statusCode == 200) {
      emit(SuccessStatus());

      return response.body;
    } else
      {
        emit(FailureStatus());
        emit(RefreshLevelState());
        return ("the error is :  ${response.body}");

      }
  }


}
