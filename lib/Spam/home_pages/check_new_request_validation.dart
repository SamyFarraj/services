import 'package:flutter/material.dart';

import '../../components/snack_bar.dart';


class CheckNewRequestValidation {}

bool checkServiceName(String serviceName , BuildContext context) {
  if (serviceName != "") {
    // chooseService.forEach((service) {
    //   if (service.isChecked) choosedServicesList.add(service.serviceName);
    // }
    return true;
  }
  else{
    TheSnackBar(
      context,
      'Please Select Service',
      const Color.fromARGB(255, 150, 10, 10),
    );
    return false;
  }
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


/*

bool checkNewRequest(
    String selectedMinuteDuration,
    String selectedHoursDuration,
    String serviceName,
  ) {



    );

    if (choosedServicesList.isEmpty) {
      TheSnackBar(
        context,
        'Please Select Service',
        const Color.fromARGB(255, 150, 10, 10),
      );
      return false;
    } else if (choosedServicesList.length > 1 &&
        choosedServicesList[0] == "self Unloaded Delivery") {
      TheSnackBar(
        context,
        "self Unloaded Can't be Used With Any Service",
        const Color.fromARGB(255, 150, 10, 10),
      );
      choosedServicesList.clear();
      return false;
    }
    if (date.year == 2021) {
      TheSnackBar(
        context,
        'Please Select Date',
        const Color.fromARGB(255, 150, 10, 10),
      );
      return false;
    } else if (time == const TimeOfDay(hour: 23, minute: 41)) {
      TheSnackBar(
        context,
        'Please Select Time',
        const Color.fromARGB(255, 150, 10, 10),
      );
      return false;
    } else if (time.hour >= 18 || time.hour < 6) {
      TheSnackBar(
        context,
        'This period is unavailable',
        const Color.fromARGB(255, 150, 10, 10),
      );
      return false;
    } else if (selectedMinuteDuration == "" && selectedHoursDuration == "") {
      TheSnackBar(
        context,
        'Please Select Duration',
        const Color.fromARGB(255, 150, 10, 10),
      );
      return false;
    } else {
      for (int i = 0; i < selectedHoursDuration.length; i++) {
        if (selectedHoursDuration[i] == '.' ||
            selectedHoursDuration[i] == ' ' ||
            selectedHoursDuration[i] == ',') {
          TheSnackBar(
            context,
            'Please Select Correct Hours Duration',
            const Color.fromARGB(255, 150, 10, 10),
          );
          return false;
        }
      }
      for (int i = 0; i < selectedMinuteDuration.length; i++) {
        if (selectedMinuteDuration[i] == '.' ||
            selectedMinuteDuration[i] == ' ' ||
            selectedMinuteDuration[i] == ',') {
          TheSnackBar(
            context,
            'Please Select Correct Minute Duration',
            const Color.fromARGB(255, 150, 10, 10),
          );
          return false;
        }
      }
      int closedHours = int.parse(selectedHoursDuration);
      int closedMinutes = int.parse(selectedMinuteDuration);
      if ((closedHours + time.hour) >= 18 &&
          (closedMinutes + time.minute) > 1) {
        TheSnackBar(
          context,
          'Duration Exceeding closing time,'
          ' please Edit duration or time',
          const Color.fromARGB(255, 150, 10, 10),
        );
        return false;
      }
      if ((closedHours + time.hour) >= 17 &&
          (closedMinutes + time.minute) > 65) {
        TheSnackBar(
          context,
          'Duration Exceeding closing time,'
          ' please Edit duration or time',
          const Color.fromARGB(255, 150, 10, 10),
        );
        return false;
      }
      if (int.parse(selectedMinuteDuration) < 5 &&
          int.parse(selectedHoursDuration) < 1) {
        TheSnackBar(
          context,
          'Service duration is too short : ${int.parse(selectedMinuteDuration)}',
          const Color.fromARGB(255, 150, 15, 10),
        );
        return false;
      }
      if (time.hour < 6) {
        TheSnackBar(
          context,
          'Duration Exceeding closing time,'
          ' please Edit duration or time',
          const Color.fromARGB(255, 150, 10, 10),
        );
        return false;
      }
      TheSnackBar(
        context,
        'Service Requested Successfully',
        const Color.fromARGB(255, 15, 150, 10),
      );
      choosedEndTime = TimeOfDay(
        hour: (choosedStartingDateTime.hour + int.parse(selectedHoursDuration)),
        minute: (choosedStartingDateTime.minute +
            int.parse(selectedMinuteDuration)),
      );
      choosedEndingDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        choosedEndTime.hour,
        choosedEndTime.minute,
      );

      return true;
    }
  }
 */