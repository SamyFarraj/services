import 'package:flutter/material.dart';


class CheckNewRequestValidation {}

bool checkServiceName(String serviceName) {
  if (serviceName != "") return true;
  return false;
}

bool checkServiceDate(DateTime serviceDate, DateTime initialDate) {
  if (serviceDate.year != initialDate) return true;
  return false;
}

bool checkServiceTime(TimeOfDay serviceTime, TimeOfDay initialTime) {
  if (serviceTime != initialTime) return true;
  return false;
}

bool checkServiceInOpenTime(TimeOfDay serviceTime) {
  if (serviceTime.hour > 18 && serviceTime.hour < 6) return false;
  return true;
}

bool checkServiceDuration(
  String selectedMinuteDuration,
  String selectedHoursDuration,
) {
  if (selectedMinuteDuration == "" && selectedHoursDuration == "") return false;
  return true;
}
bool checkLengthValidation(String selectedHoursDuration , String selectedMinuteDuration,){
  for (int i = 0; i < selectedHoursDuration.length; i++) {
    if (selectedHoursDuration[i] == '.' ||
        selectedHoursDuration[i] == ' ' ||
        selectedHoursDuration[i] == ',') {
      // TheSnackBar(
      //   context,
      //   'Please Select Correct Hours Duration',
      //   const Color.fromARGB(255, 150, 10, 10),
      // );
      return false;
    } else if (selectedMinuteDuration[i] == '.' ||
        selectedMinuteDuration[i] == ' ' ||
        selectedMinuteDuration[i] == ',') {
      // TheSnackBar(
      //   context,
      //   'Please Select Correct Minute Duration',
      //   const Color.fromARGB(255, 150, 10, 10),
      // );
      return false;
    }
  }
  return true;
}