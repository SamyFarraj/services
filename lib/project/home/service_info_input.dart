import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_mohammad/project/constant.dart';


import 'package:http/http.dart' as http;
import 'package:project_mohammad/components/snack_bar.dart';

import '../../services/choices.dart';
import '../../services/requests_statue.dart';
import 'requests.dart';
// import '../../services/staff.dart';

class ServiceInformationInput extends StatefulWidget {
  final String gateName;

  const ServiceInformationInput({required this.gateName, Key? key})
      : super(key: key);

  @override
  _ServiceInformationInputState createState() =>
      _ServiceInformationInputState();
}

class _ServiceInformationInputState extends State<ServiceInformationInput> {
  //المتغير اللي رح يتخزن فيه التاريخ اللي تم اختيارو
  DateTime date = DateTime(
    2021,
    1,
    1,
  );
  DateTime choosedStartingDateTime = DateTime(2021);
  DateTime choosedEndDateTime = DateTime(2021);

  //المتغير اللي رح يتخزن فيه الوقت اللي تم اختيارو
  TimeOfDay time = const TimeOfDay(hour: 23, minute: 41);

  // مصفوفة لتخزين ال staff اللي تم اختيارون
  List choosedStaffsList = [];

  //المتغير اللي رح يتخزن فيه الخدمة اللي تم اختيارها
  String? selectedService = 'Select Service';

  //المتغير اللي رح يتخزن فيه مدة حجز للخدمة اللي تم اختيارها
  String? selectedMinuteDuration = 'Select Minute Duration';

  //المتغير اللي رح يتخزن فيه مدة حجز للخدمة اللي تم اختيارها
  String? selectedHoursDuration = 'Select Hours Duration';

  // ال controller اللي رح ناخد منو المدة بالساعات من ال textField
  final choosedDurationHoursController = TextEditingController();

  // ال controller اللي رح ناخد منو المدة بالدقايق من ال textField
  final choosedDurationMinuteController = TextEditingController();

  late String showedDate = 'select Date';
  late String showedTime = 'select Time';


  Future  book_resevices(
      String gate_name,
      String Start_time,
      String end_time,
      String service_id,
      String service_name
      )async
  {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzEwOWI1YjMzY2JmMjlhMDdjZTk3MGU3ZWYzOGQxMGQ4ODdlNDkzZThlNTgyMDJiOTNiMzU3MDNhNDBkYjY5YzQ0MDE4NDZiNWVkNjNlMzQiLCJpYXQiOjE2NTA5NDQ1NzkuMzcwMjAyLCJuYmYiOjE2NTA5NDQ1NzkuMzcwMjA4LCJleHAiOjE2ODI0ODA1NzkuMzAwNzk1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.LafISEKD8yn9StQjfbHT7yxAFqkDxpmcTgFyqshSmS6bCbuv1lzYc9DpBVT54siGXDkkVW4999pUX6U38S1zAAdK4LvfDip8k74ZA2HIodczwBeWK7AuF0-WG4PCnOwAzXXMe0Qg9_QjPh1FLJ7Dk1tws9MTAs0A42-Or1_hlb2LbUg0_9icWP6__hG78nvLKepCVd4CUNxjQWD1TQj-VA0oK9DZazF8N33dAC4w3TqeDtOfhsIS3cCnEfS13574eS_EhGdOaCwWKUanwyuwjxWOuwmWNf0xzhWljERnHIrC4cr7Yx0urpfYniZtb63Qz7mY8abLX-2dCr9EyFAzsUZyia2zuVZV1OVxTiaOQ6GZEmT6IyOKEMzFTNItRsaJnElYmCrB8eYL1DC4vA7B5txbUqATeR-TLGYwqhA7S18yxElg_peDAqfA-iznUDb90BH3y9toa-tYNYyrFWcCNt7fFH_DwYMxk0LPNz-jm1ATBwX7a9eSaillN8AEpuuq93IXiCicg9pURT_uG3KhafsXHwFJd-2reHRXUkHSgcONEQgHGd0P6McaJPbJnfAaIMcXS06aPNTjROSk3X8RsrICTKPrQDY1DTCtBNfm_6OI1oIDARMaTd2RE3rIPu0jqsTyfmw0NxKM8QvaWNnyPPHCZ5GzVsVBIWJ97-_nWNQ'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$base_Url/api/Reservation'));
    request.fields.addAll({
      'Gate_name': '${gate_name}',
      'start_time': '${Start_time}',
      'end_time': '${end_time}',
      'services_map[0][id]': '$service_id',
      'services_map[0][name]': '$service_name'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        // هي مشان نعرض اسم البوابة بال appBar
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
                    children: [
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
                                      0.055,
                                ),
                                Column(
                                  children: [
                                    // const Text(
                                    //   "Service",
                                    //   style: TextStyle(
                                    //       fontSize: 28,
                                    //       color: Colors.white,
                                    //       // backgroundColor: Colors.blue,
                                    //   ),
                                    // ),
                                    // const SizedBox(
                                    //   width: 10,
                                    // ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              // width: 2.0,
                                              color: Colors.blue,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        value: selectedService,
                                        items: servicesList
                                            .map(
                                              (service) =>
                                                  DropdownMenuItem<String>(
                                                value: service,
                                                child: Text(
                                                  service,
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (service) =>
                                            setState(() async {
                                          selectedService = service;
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),

                                //هي الزر تبع اختيار ال التاريخ date picker
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

                                    print("the dateeee : ${date}");
                                    showSelectedDate();
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                //هي الزر تبع اختيار ال وقت time picker
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
                                    // backgroundColor: Colors.blue,
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
                                // const Text(
                                //   "Assign Staff",
                                //   softWrap: true,
                                //   style: TextStyle(
                                //     fontSize: 30,
                                //     color: Colors.white,
                                //     backgroundColor: Colors.blue,
                                //   ),
                                // ),
                                // Container(
                                //   alignment: Alignment.topCenter,
                                //   margin: const EdgeInsets.only(
                                //     left: 25,
                                //     right: 25,
                                //   ),
                                //   padding: EdgeInsets.only(
                                //     left:
                                //         MediaQuery.of(context).size.width * 0.1,
                                //     top: 0.0001,
                                //   ),
                                //   width: double.infinity,
                                //   height: MediaQuery.of(context).size.height *
                                //       0.255,
                                //   decoration: BoxDecoration(
                                //     color:
                                //         const Color.fromARGB(80, 0, 105, 200),
                                //     borderRadius: BorderRadius.circular(25),
                                //     border: Border.all(
                                //       color: Colors.blue,
                                //       width: 2.0,
                                //     ),
                                //   ),
                                //   child: ListView(
                                //     padding: const EdgeInsets.all(0.1),
                                //     children: [
                                //       buildGroupStaffCheckbox(selectAllStaff),
                                //       const Divider(
                                //         color: Colors.white,
                                //       ),
                                //       ...chooseStaff
                                //           .map(buildStaffCheckbox)
                                //           .toList(),
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: MediaQuery.of(context).size.height *
                                //       0.025,
                                // ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        for (var staff in chooseStaff) {
                                          if (staff.isChecked == true) {
                                            choosedStaffsList
                                                .add(staff.staff_name);
                                          }
                                        }
                                        selectedMinuteDuration = choosedDurationMinuteController.text;
                                        selectedHoursDuration = choosedDurationHoursController.text;
                                        checkNewRequest(
                                          selectedMinuteDuration!,
                                          selectedHoursDuration!,
                                          selectedService!,
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
        showedDate = DateFormat("MM/dd/yyyy").format(date);
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
    if (serviceName == 'Select Service') {
      TheSnackBar(context, 'Please Select Service',
              const Color.fromARGB(255, 150, 10, 10),
      );
      // snackBar(context, 'Please Select Service',
      //     const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (date.year == 2021) {
      TheSnackBar(context, 'Please Select Date',
        const Color.fromARGB(255, 150, 10, 10),
      );
      // snackBar(context, 'Please Select Date',
      //     const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (time == const TimeOfDay(hour: 23, minute: 41)) {
      TheSnackBar(context, 'Please Select Time',
        const Color.fromARGB(255, 150, 10, 10),
      );
      // snackBar(context, 'Please Select Time',
      //     const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (time.hour > 18 && time.hour < 6) {
      TheSnackBar(context, 'This period is unavailable',
        const Color.fromARGB(255, 150, 10, 10),
      );
      // snackBar(context, 'This period is unavailable',
      //     const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (selectedMinuteDuration == "" && selectedHoursDuration == "") {
      TheSnackBar(context, 'Please Select Duration',
        const Color.fromARGB(255, 150, 10, 10),
      );
      // snackBar(context, 'Please Select Duration',
      //     const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      for (int i = 0; i < selectedHoursDuration.length; i++) {
        if (selectedHoursDuration[i] == '.' ||
            selectedHoursDuration[i] == ' ' ||
            selectedHoursDuration[i] == ',') {
          TheSnackBar(context, 'Please Select Correct Hours Duration',
            const Color.fromARGB(255, 150, 10, 10),
          );
          // snackBar(context, 'Please Select Correct Hours Duration',
          //     const Color.fromARGB(255, 150, 10, 10));
          return false;
        } else if (selectedMinuteDuration[i] == '.' ||
            selectedMinuteDuration[i] == ' ' ||
            selectedMinuteDuration[i] == ',') {
          TheSnackBar(context, 'Please Select Correct Minute Duration',
            const Color.fromARGB(255, 150, 10, 10),
          );
          // snackBar(context, 'Please Select Correct Minute Duration',
          //     const Color.fromARGB(255, 150, 10, 10));
          return false;
        }
      }
      if (selectedHoursDuration == "" ||
          selectedHoursDuration == " " ||
          selectedHoursDuration == "0") {
        selectedHoursDuration = "00";
      } else if (selectedMinuteDuration == "" ||
          selectedMinuteDuration == " " ||
          selectedMinuteDuration == "0") {
        selectedMinuteDuration = "00";
      }
      int closedHours = int.parse(selectedHoursDuration);
      int closedMinutes = int.parse(selectedMinuteDuration);
      if ((closedHours + time.hour) >= 18 &&
          (closedMinutes + time.minute) > 0) {
        TheSnackBar(context, 'Duration Exceeding closing time,'
            ' please Edit duration or time',
          const Color.fromARGB(255, 150, 10, 10),
        );
        // snackBar(
        //     context,
        //     'Duration Exceeding closing time,'
        //     ' please Edit duration or time',
        //     const Color.fromARGB(255, 150, 10, 10));
        return false;
      } else if ((closedHours + time.hour) >= 17 &&
          (closedMinutes + time.minute) > 60) {
        TheSnackBar(context, 'Duration Exceeding closing time,'
            ' please Edit duration or time',
          const Color.fromARGB(255, 150, 10, 10),
        );
        // snackBar(
        //     context,
        //     'Duration Exceeding closing time,'
        //     ' please Edit duration or time',
        //     const Color.fromARGB(255, 150, 10, 10));
        return false;
      }
      TheSnackBar(context, 'Service Requested Successfully',
        const Color.fromARGB(255, 15, 150, 10),
      );
      // snackBar(context, "Service Requested Successfully",
      //     const Color.fromARGB(255, 15, 150, 10));
      choosedEndDateTime = DateTime(
        choosedStartingDateTime.year,
        choosedStartingDateTime.month,
        choosedStartingDateTime.day,
        (choosedStartingDateTime.hour + int.parse(selectedHoursDuration)),
        (choosedStartingDateTime.minute + int.parse(selectedMinuteDuration)),
      );
      UserRequestsPage.requestList.add(
        RequestsStates(
          gateTitle: widget.gateName,
          serviceTitle: selectedService!,
          serviceDate:
              DateFormat("yyyy/MM/dd HH:mm").format(choosedStartingDateTime),
          serviceTime: time,
          hoursDuration: int.parse(selectedHoursDuration),
          minuteDuration: int.parse(selectedMinuteDuration),
          user: "user",
          endingDate: DateFormat("yyyy/MM/dd HH:mm").format(choosedEndDateTime),
          // choosedStaffs: choosedStaffsList,
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const UserRequestsPage()),
      );
      for (var staff in chooseStaff) {
        staff.isChecked = false;
      }
      return true;
    }
  }
}
