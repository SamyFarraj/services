import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_mohammad/Api/model/name_service.dart';
import 'package:project_mohammad/project/constant.dart';

import 'package:http/http.dart' as http;
import 'package:project_mohammad/components/snack_bar.dart';


import '../../project/user/user_requests.dart';
import '../../project/home/requests_page_managment.dart';

/*
File in order to enter service reservation information such as
date, start and end time, gate and route, etc...

 */
class ServiceInformationInput extends StatefulWidget {
  final String gateName;
  final List<String> both;
  final List<BothStreet> listservice;
  const ServiceInformationInput(
      {required this.gateName,
      required this.both,
      required this.listservice,
      Key? key})
      : super(key: key);

  @override
  _ServiceInformationInputState createState() =>
      _ServiceInformationInputState(gateName, both, listservice);
}

class _ServiceInformationInputState extends State<ServiceInformationInput> {
  //المتغير اللي رح يتخزن فيه التاريخ اللي تم اختيارو

  late String gateName;
  late List<String> both;
  late List<BothStreet> listservice;
late int id_service;
  _ServiceInformationInputState(
      String gateName, List<String> both, List<BothStreet> listservice) {
    this.listservice = listservice;
    this.both = both;
    this.gateName = gateName;
  }

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

  Future book_resevices(String gate_name, String Start_time, String end_time,
      String service_id, String service_name) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization':'Bearer   eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDQ5ZWRjODRiMWYzYzAzZmUzMjg4NTY0NDQwY2JjYmE0ZmIxY2JkNDBjYjk0ZThmYjY1OTYzZjcyOTA4MDAwM2YyMzczNzgxM2JiYzNkY2MiLCJpYXQiOjE2NTY5NTkxNjkuOTU5NDI4LCJuYmYiOjE2NTY5NTkxNjkuOTU5NDU3LCJleHAiOjE2ODg0OTUxNjkuNzY4MTM0LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.GTXRTTYJmuUSVl3nvm8RB19bYrCllhsLev5M4vpbOekT5waNGue4jO5n8mdkKyhQrw83uzr5PFFVZVPFqwtYtaCixN5uQPWw6pGtNPLu2MPucYL2hUZrl2Q_pu6atlFqHQ4zwIVEX-6Nf-OXdkMYEpL4bVcdgyumJMiMI_cl4T2sL-0WRCealvlY_uckcvomIsUFWzL8if1kLv2rxPt9xei0D6_-ciE0trrgmI7fLZ1DT6Nnb78VzEiSFOkYo4NuuHXmdPtjlIQ6c7sCSlax5-Sd9qX2mRDoTVlsXg75nw4lHzdhRpvg_wWYWsBPjgV2qE40y2Vhzl7TXtCc9gjEFxABrJ_QbWTJAaX5bRgXl7cW4f-laayYw14jzVtNwNz9Yuv6AGlwWQxBXKGckpluzO14zbc8XS_Bf3lrLxbx1L4mjbyI8tb0Ct6GrBG2dcGJ3mdcVwIBBhfSeCXoxUz4ZN-4Q9tMD0cacReXH3nlXbNa6m1_e6tVVUA2E7UUPExdECppV5H4T9sGfO3c_M8_jXTFPAgiNIynoSY7H1GNoEJ5i0O0Dhpa5384Fwc_fJuJHDNsGT4d-5K528u0NH9O1HZsRdSvaprV04l2mDADg_tF433CNeHMH7FMqEPqsj8MD8RyAw7UJY316bFVSgpw1hzsgE7l81sg0dn8VCxjvb8'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('$base_Url/api/Reservation'));
    request.fields.addAll({
      'Gate_name': '${gate_name}',
      'start_time': '${Start_time}',
      'end_time': '${end_time}',
      'services_map[0][id]': '$service_id',
      'services_map[0][name]': '$service_name',
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
print("the response is yesssss ${response.statusCode} ");
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    selectedService = both[0];
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
                                      0.055,
                                ),
                                Column(
                                  children: <Widget>[
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
                                        items: both
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
                                        onChanged: (service) => setState(
                                            () // انا علقتها كانت عم تضرب ايرور  async
                                            {
                                          selectedService = service;
                                          for(int i=0; i <listservice.length;i++ )
                                            {
                                              if(selectedService==listservice[i].name)
                                                {
                                                  id_service=listservice[i].id;
                                                  break;
                                                }
                                            }
                                          /////1111 seconde parameter
                                          print("the services is $selectedService");
                                          print("the services is $id_service");

                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
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

                                    print("the dateeee : ${date}");
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
                                        
                                        book_resevices(gateName,'$choosedStartingDateTime','$choosedEndingDateTime',id_service.toString(),selectedService!);
                                       //  book_resevices(gateName,selectedService,start time ,end time,id_service )
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
    if (serviceName == 'Select Service') {
      TheSnackBar(
        context,
        'Please Select Service',
        const Color.fromARGB(255, 150, 10, 10),
      );
      return false;
    } else if (date.year == 2021) {
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
    } else if (time.hour > 18 && time.hour < 6) {
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

      // if (selectedHoursDuration == "" ||
      //     selectedHoursDuration == " " ||
      //     selectedHoursDuration == "0") {
      //   selectedHoursDuration = "00";
      // } else if (selectedMinuteDuration == "" ||
      //     selectedMinuteDuration == " " ||
      //     selectedMinuteDuration == "0") {
      //   selectedMinuteDuration = "00";
      // }
      int closedHours = int.parse(selectedHoursDuration);
      int closedMinutes = int.parse(selectedMinuteDuration);
      if ((closedHours + time.hour) >= 18 &&
          (closedMinutes + time.minute) > 5) {
        TheSnackBar(
          context,
          'Duration Exceeding closing time,'
          ' please Edit duration or time',
          const Color.fromARGB(255, 150, 10, 10),
        );
        return false;
      } else if ((closedHours + time.hour) >= 17 &&
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
  ) {
    if (checkNewRequest) {
      /*
      UserRequestsPage.requestList.add(
/*
        RequestsStates(
          gateTitle: widget.gateName,
          serviceTitleList: selectedService!,
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
      );
      */

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const UserRequestsPage()),
      );
    }
  }

////////////////////////////////////////////

}
