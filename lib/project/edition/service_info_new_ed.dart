import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_mohammad/components/snack_bar.dart';
import 'package:project_mohammad/services/services_check_box.dart';

import '../../services/choices.dart';
import '../../services/requests_form.dart';
import '../home/requests.dart';

/*
File in order to enter service reservation information such as
date, start and end time, gate and route, etc...

 */
class ServiceInfoInputNewEd extends StatefulWidget {
  final String gateName;

  const ServiceInfoInputNewEd({required this.gateName, Key? key})
      : super(key: key);

  @override
  _ServiceInfoInputNewEdState createState() => _ServiceInfoInputNewEdState();
}

class _ServiceInfoInputNewEdState extends State<ServiceInfoInputNewEd> {
  //المتغير اللي رح يتخزن فيه التاريخ اللي تم اختيارو
  DateTime date = DateTime(
    2021,
    1,
    1,
  );
  DateTime choosedStartingDateTime = DateTime(2021);

  DateTime choosedEndingDateTime = DateTime(2021);

  //المتغير اللي رح يتخزن فيه وقت البداية اللي تم اختيارو
  TimeOfDay time = const TimeOfDay(hour: 23, minute: 41);

  //المتغير اللي رح يتخزن فيه وقت  النهاية اللي تم اختيارو
  TimeOfDay choosedEndTime = const TimeOfDay(hour: 23, minute: 41);

  // DateTime choosedEndDateTime = DateTime(2021);

  // مصفوفة لتخزين ال staff اللي تم اختيارون
  // Array to store choosed Staffs
  List choosedStaffsList = [];

//  ال Services اللي تم اختيارون
//  Array to store choosed Services
  List choosedServicesList = [];

  //المتغير اللي رح يتخزن فيه الخدمة اللي تم اختيارها
  // Service Name variable
  String? selectedService = 'Select Service';

  //المتغير اللي رح يتخزن فيه مدة حجز للخدمة اللي تم اختيارها
  // service reservation time by minutes
  String? selectedMinuteDuration = 'Select Minute Duration';

  //المتغير اللي رح يتخزن فيه مدة حجز للخدمة اللي تم اختيارها
  // service reservation time by hours
  String? selectedHoursDuration = 'Select Hours Duration';

  // ال controller اللي رح ناخد منو المدة بالساعات من ال textField
  //reservation Hours TextField
  final choosedDurationHoursController = TextEditingController();

  // ال controller اللي رح ناخد منو المدة بالدقايق من ال textField
  //reservation Minute TextField
  final choosedDurationMinuteController = TextEditingController();

  //text displayed on date Picked button
  late String showedDate = 'select Date';

  //text displayed on time Picked button
  late String showedTime = 'select Time';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        // هي مشان نعرض اسم البوابة بال appBar
        // choosed gate name display
        title: Text(
          widget.gateName,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(150, 0, 0, 65),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "asset/images/background_picture.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(150, 60, 60, 80),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.14,
                  ),
                  Image.asset(
                    "asset/images/logo.png",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.095,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.010,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 8,
                            top: 5,
                            bottom: 5,
                          ),
                          alignment: Alignment.topCenter,
                          height: MediaQuery.of(context).size.height * 0.716,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(180, 0, 0, 65),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                // Column(
                                //   children: <Widget>[
                                //     Container(
                                //       alignment: Alignment.center,
                                //       width: MediaQuery.of(context).size.width *
                                //           0.7,
                                //       child: DropdownButtonFormField<String>(
                                //         decoration: InputDecoration(
                                //           enabledBorder: UnderlineInputBorder(
                                //             borderSide: const BorderSide(
                                //               // width: 2.0,
                                //               color: Colors.blue,
                                //             ),
                                //             borderRadius:
                                //             BorderRadius.circular(25),
                                //           ),
                                //         ),
                                //         value: selectedService,
                                //         items: servicesList
                                //             .map(
                                //               (service) =>
                                //               DropdownMenuItem<String>(
                                //                 value: service,
                                //                 child: Text(
                                //                   service,
                                //                   style: const TextStyle(
                                //                     fontSize: 22,
                                //                     color: Colors.blue,
                                //                   ),
                                //                 ),
                                //               ),
                                //         )
                                //             .toList(),
                                //         onChanged: (service) =>
                                //             setState(() async {
                                //               selectedService = service;
                                //             }),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                //
                                const Text(
                                  "Select Services",
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    // backgroundColor: const Color.fromARGB(80, 0, 105, 200),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  margin: const EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * 0.1,
                                    top: 0.0001,
                                  ),
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height *
                                      0.265,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(80, 0, 105, 200),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: ListView(
                                    padding: const EdgeInsets.all(0.1),
                                    children: [
                                      buildGroupServicesCheckbox(
                                          selectAllServices),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                          ),
                                          const Divider(
                                            color: Colors.white,
                                            thickness: 1,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                          ),
                                        ],
                                      ),
                                      ...chooseService
                                          .map(buildServiceCheckbox)
                                          .toList(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),

                                //date Picker Button
                                TextButton(
                                  child: Text(
                                    showedDate,
                                    style: const TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    final choosedDate = await pickDate(context);
                                    date = DateTime(
                                      choosedDate!.year,
                                      choosedDate.month,
                                      choosedDate.day,
                                      choosedDate.hour,
                                      choosedDate.minute,
                                    );
                                    showSelectedDate();
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                //time picker button
                                TextButton(
                                  onPressed: () async {
                                    final choosedTime = await pickTime(context);
                                    time = TimeOfDay(
                                      hour: choosedTime!.hour,
                                      minute: choosedTime.minute,
                                    );
                                    choosedStartingDateTime = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                    );
                                    showSelectedTime();
                                  },
                                  child: Text(
                                    showedTime,
                                    style: const TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                const Text(
                                  "Duration",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller:
                                            choosedDurationHoursController,
                                        decoration: const InputDecoration(
                                          // Icon(
                                          //   Icons.access_time,
                                          //   color: Colors.deepOrange,
                                          // ),
                                          label: Text(
                                            "select hours",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2.0,
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2.0,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller:
                                            choosedDurationMinuteController,
                                        decoration: const InputDecoration(
                                          label: Text(
                                            "select minute",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2.0,
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2.0,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        selectedMinuteDuration =
                                            choosedDurationMinuteController
                                                .text;
                                        selectedHoursDuration =
                                            choosedDurationHoursController.text;
                                        // checkNewRequest(
                                        //   selectedMinuteDuration!,
                                        //   selectedHoursDuration!,
                                        //   selectedService!,
                                        // );
                                        if (selectedHoursDuration == "" ||
                                            selectedHoursDuration == " " ||
                                            selectedHoursDuration == "0") {
                                          selectedHoursDuration = "00";
                                        } else if (selectedMinuteDuration ==
                                                "" ||
                                            selectedMinuteDuration == " " ||
                                            selectedMinuteDuration == "0") {
                                          selectedMinuteDuration = "00";
                                        }
                                        requestSender(
                                          checkNewRequest(
                                            selectedMinuteDuration!,
                                            selectedHoursDuration!,
                                            selectedService!,
                                          ),
                                          selectedMinuteDuration!,
                                          selectedHoursDuration!,
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*

                ////////////      date picker       ////////////

   */

  // هاد التابع تيع ال Date picker
  Future<DateTime?> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(initialDate.year + 1),
    );
    if (selectedDate == null) return null;
    return selectedDate;
  }

  showSelectedDate() {
    setState(() {
      if (date != DateTime(2021)) {
        showedDate = DateFormat("yyyy/MM/dd").format(date);
      }
    });
  }

  /*

                ////////////      time picker       ////////////

   */

  // هاد التابع تيع ال time picker
  Future<TimeOfDay?> pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 8, minute: 20);
    final newTime = await showTimePicker(
      context: context,
      // ignore: unnecessary_null_comparison
      initialTime: time != null
          ? TimeOfDay(
              hour: time.hour,
              minute: time.minute,
            )
          : initialTime,
    );
    if (newTime == null) return null;
    return newTime;
  }

  showSelectedTime() {
    setState(() {
      if (time != const TimeOfDay(hour: 23, minute: 41)) {
        showedTime = time.format(context);
      }
    });
  }

  /*

            ///////////       service check       ///////////

  */

  //هاد التابع اللي رح يتحقق من انو طلب الحجز كامل قبل ما ينبعت ع ال dataBase
  bool checkNewRequest(
    String selectedMinuteDuration,
    String selectedHoursDuration,
    String serviceName,
  ) {
    // if (serviceName == 'Select Service') {
    //   TheSnackBar(
    //     context,
    //     'Please Select Service',
    //     const Color.fromARGB(255, 150, 10, 10),
    //   );
    //   return false;
    // } else
    chooseService.forEach((service) {
      if (service.isChecked) choosedServicesList.add(service.serviceName);
    });
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
      if(time.hour < 6){
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

  TimeOfDay endTimeFormatting(
    int endHours,
    int endMinutes,
  ) {
    int endHour = 0, endMinute = endMinutes;
    TimeOfDay endingTime = TimeOfDay(
      hour: 00,
      minute: 00,
    );
    while (endMinute >= 60) {
      endHour++;
      endMinute -= 60;
    }
    endHour += endHours;
    endingTime = TimeOfDay(
      hour: endHour,
      minute: endMinute,
    );

    return endingTime;
  }

  void requestSender(
    bool checkNewRequest,
    String selectedMinuteDuration,
    String selectedHoursDuration,
  )
  {
    if (checkNewRequest) {
      /*
      UserRequestsPage.requestList.add(

        RequestsStates(
          gateTitle: widget.gateName,
          serviceTitleList: choosedServicesList,
          // serviceTitle: selectedService!,
          serviceStartDate:
              DateFormat("yyyy/MM/dd").format(choosedStartingDateTime),
          serviceEndDate:
              DateFormat("yyyy/MM/dd HH:mm").format(choosedEndingDateTime),
          serviceTime: time,
          hoursDuration: int.parse(selectedHoursDuration),
          minuteDuration: int.parse(selectedMinuteDuration),
          user: "user",
          endingTime: endTimeFormatting(
            choosedEndTime.hour,
            choosedEndTime.minute,
          ),
        ),
        */


      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const UserRequestsPage()),
      );
    }
  }

////////////////////////////////////////////
//هي ال widget  اللي بتعرض خيار ال  select all Services ك checkBox

  Widget buildGroupServicesCheckbox(ServicesCheckBox serviceCheckBox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          serviceCheckBox.serviceName,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.orange,
          ),
        ),
        activeColor: Colors.blue,
        value: serviceCheckBox.isChecked,
        onChanged: toggleGroupServiceCheckbox,
      );

// for choosing all Services in one choice
// its called select all staffs
// هاد تابع بيتقق اذا تم اختبار ال كل ال Services او لأ
// مشان الخيار select all Services

  void toggleGroupServiceCheckbox(bool? isChecked) {
    if (isChecked == null) return;
    setState(() {
      selectAllServices.isChecked = isChecked;
      // ignore: avoid_function_literals_in_foreach_calls
      chooseService.forEach((service) {
        if(service.serviceName == "self Unloaded Delivery" && service.isChecked == true)
          service.isChecked= false;
        if (service.serviceName != "self Unloaded Delivery")
          service.isChecked = isChecked;
      });
    });
  }

//هي ال widget  اللي بتعرض ال Services ك checkBox

  Widget buildServiceCheckbox(ServicesCheckBox servicesCheckBox) =>
      CheckboxListTile(
        onChanged: (serviceValue) => setState(() {
          servicesCheckBox.isChecked = serviceValue!;
          selectAllServices.isChecked =
              chooseService.every((service) => service.isChecked == true);
        }),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.blue,
        value: servicesCheckBox.isChecked,
        title: Text(
          servicesCheckBox.serviceName,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
