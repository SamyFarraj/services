import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:project_mohammad/Api/model/my_accepted_model.dart';

import '../../Cubit/User Level Operation/user_operation_cubit.dart';
import '/components/snack_bar.dart';
import '/services/services_check_box.dart';
import '../../Api/model/list_services_to_send.dart';
import '../../Api/model/name_service.dart';
import '../../main.dart';
import '../../services/choices.dart';
import '../constant.dart';
import '../../Spam/requests/user_requests.dart';
import 'user_requests_new.dart';


/*
File in order to enter service reservation information such as
date, start and end time, gate and route, etc...

 */
class ServiceInfoInputNewEd extends StatefulWidget {
  final String gateName;
  final List<String> both;
  final List<String> bothId;

  final List<BothStreet> servicesList;

  const ServiceInfoInputNewEd(
      {required this.gateName,
      required this.both,
      required this.servicesList,
      required this.bothId});

  @override
  _ServiceInfoInputNewEdState createState() =>
      _ServiceInfoInputNewEdState(gateName, both, servicesList, bothId);
}

class _ServiceInfoInputNewEdState extends State<ServiceInfoInputNewEd> {
  late String gateName;
  late List<String> both;
  late List<String> bothId;

  late List<BothStreet> servicesList;
  late int id_service;

  _ServiceInfoInputNewEdState(String gateName, List<String> both,
      List<BothStreet> servicesList, List<String> bothID) {
    this.servicesList = servicesList;
    this.both = both;
    this.gateName = gateName;
    this.bothId = bothID;
  }

  //المتغير اللي رح يتخزن فيه التاريخ اللي تم اختيارو
  DateTime date = DateTime(
    2001,
    1,
    1,
  );
  DateTime choosedStartingDateTime = DateTime(2001);

  DateTime choosedEndingDateTime = DateTime(2001);

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

  ListServiceToSend ReservationToSend = new ListServiceToSend(
      servicesMap: [], startTime: '', endTime: '', gateName: '');

  List ListOfIdChoosingToSend = [];

  //text displayed on time Picked button
  late String showedTime = 'select Time';

  /*
  Future book_reservation(String gate_name, String Start_time, String end_time,
    ) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization':'Bearer   eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDQ5ZWRjODRiMWYzYzAzZmUzMjg4NTY0NDQwY2JjYmE0ZmIxY2JkNDBjYjk0ZThmYjY1OTYzZjcyOTA4MDAwM2YyMzczNzgxM2JiYzNkY2MiLCJpYXQiOjE2NTY5NTkxNjkuOTU5NDI4LCJuYmYiOjE2NTY5NTkxNjkuOTU5NDU3LCJleHAiOjE2ODg0OTUxNjkuNzY4MTM0LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.GTXRTTYJmuUSVl3nvm8RB19bYrCllhsLev5M4vpbOekT5waNGue4jO5n8mdkKyhQrw83uzr5PFFVZVPFqwtYtaCixN5uQPWw6pGtNPLu2MPucYL2hUZrl2Q_pu6atlFqHQ4zwIVEX-6Nf-OXdkMYEpL4bVcdgyumJMiMI_cl4T2sL-0WRCealvlY_uckcvomIsUFWzL8if1kLv2rxPt9xei0D6_-ciE0trrgmI7fLZ1DT6Nnb78VzEiSFOkYo4NuuHXmdPtjlIQ6c7sCSlax5-Sd9qX2mRDoTVlsXg75nw4lHzdhRpvg_wWYWsBPjgV2qE40y2Vhzl7TXtCc9gjEFxABrJ_QbWTJAaX5bRgXl7cW4f-laayYw14jzVtNwNz9Yuv6AGlwWQxBXKGckpluzO14zbc8XS_Bf3lrLxbx1L4mjbyI8tb0Ct6GrBG2dcGJ3mdcVwIBBhfSeCXoxUz4ZN-4Q9tMD0cacReXH3nlXbNa6m1_e6tVVUA2E7UUPExdECppV5H4T9sGfO3c_M8_jXTFPAgiNIynoSY7H1GNoEJ5i0O0Dhpa5384Fwc_fJuJHDNsGT4d-5K528u0NH9O1HZsRdSvaprV04l2mDADg_tF433CNeHMH7FMqEPqsj8MD8RyAw7UJY316bFVSgpw1hzsgE7l81sg0dn8VCxjvb8'
    };
    ReservationToSend.servicesMap.clear();
    for (int i=0;i<choosedServicesList.length;i++)
      {
        ReservationToSend.servicesMap.add(new ServicesMap(id:bothId[i].toString(),name:choosedServicesList[i]));
       // ReservationToSend.servicesMap[i].name=;

      }
    print("the list send is ${ReservationToSend.servicesMap[1].id}");

    print("the list send is ${ReservationToSend.servicesMap[1].name}");
    var request =
    http.MultipartRequest('POST', Uri.parse('$base_Url/api/Reservation'));
    request.fields.addAll({
      'Gate_name': '${gate_name}',
      'start_time': '${Start_time}',
      'end_time': '${end_time}',
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("the response is  ${response.statusCode} ");
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }


   */
  book_reservation(
    String gate_name,
    String Start_time,
    String end_time,
      List choosedServicesList, ListServiceToSend ReservationToSend
  ) async {
    for (int i = 0; i < choosedServicesList.length; i++) {
      ReservationToSend.servicesMap.add(
          new ServicesMap(id: bothId[i].toString(), name: choosedServicesList[i])
      );
      // ReservationToSend.servicesMap[i].name=;

    }
    ReservationToSend.gateName = gate_name;
    ReservationToSend.startTime = Start_time;
    ReservationToSend.endTime = end_time;
    print("the end time${ReservationToSend.endTime} ");
    print("the list send is ${ReservationToSend.servicesMap[1].id}");

    print("the list send is ${ReservationToSend.servicesMap[1].name}");
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
      return response;
    } else
      response;
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < both.length; i++) {
      chooseService.add(new ServicesCheckBox(serviceName: both[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    selectedService = both[0];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBarContent(),
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
            BlocConsumer<UserOperationCubit, UserOperationState>(
  listener: (context, state) {
    if (state is SuccessStatus) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserRequestsPage(),
        ),
      );

    }


    //في حال دخل كلمة سر خطأ
    if(state is FailureStatus)
    {
      //هون حط توست ماسج انو كلمة السر غلط
      print("رسالة الخطأ انو كلمة السر غلط");

    }
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=UserOperationCubit.get(context);
    return SingleChildScrollView(
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
                              children: <Widget>[
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                /*
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
                                        items: servicesList
                                            .map(
                                              (service) =>
                                              DropdownMenuItem<String>(
                                                child: Text(
                                                  service.name,
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


                                 */
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

                                ConditionalBuilder(
                                    condition: state is RefreshLevelState || state is UserOperationInitial,
                                    builder: (context) =>   ElevatedButton(
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
                                            print(
                                                "${UserRequestsPage.requestList.length}");
                                            print("start send reservation");
                                            cubit.book_reservation(
                                                gateName,
                                                DateFormat("yyyy-MM-dd HH:mm")
                                                    .format(choosedStartingDateTime)
                                                    .toString(),
                                                DateFormat("yyyy-MM-dd HH:mm")
                                                    .format(choosedEndingDateTime)
                                                    .toString(),choosedServicesList,ReservationToSend,bothId
                                            );
                                            UserRequestsPage.requestList.add(MyAccepted(
                                              id: 10,
                                              userId: 23,
                                              startTime: DateTime(2023),
                                              endTime: DateTime(2024),
                                              gateName: gateName,
                                              isAccepted: 0,
                                              createdAt: DateTime.now(),
                                              updatedAt: DateTime.now(),
                                              serviceName: "serviceName",
                                              serviceId: 12,
                                              userName: 'userName',),);
                                            print("end send reservation");
                                            print("${UserRequestsPage.requestList.length}");
                                            // book_reservation(gateName,time.toString(),choosedEndTime.toString());
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
                                    fallback: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    ))

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
  },
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

      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) => const UserRequestsPage(),
      //   ),
      // );
    }
  }
  AppBar _appBarContent() => AppBar(
    centerTitle: true,
    title: _appBarTitle(),
    backgroundColor: const Color.fromARGB(150, 0, 0, 65),
  );

  Text _appBarTitle() => Text(
    widget.gateName,
    style: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.deepOrange,
    ),
  );

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
        if (service.serviceName == "self Unloaded Delivery" &&
            service.isChecked == true) service.isChecked = false;
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
