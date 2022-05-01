import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../project/home/requests.dart';
import 'choices.dart';
import 'requests_statue.dart';
import 'staff.dart';

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
  DateTime date = DateTime(2021, 1, 1);

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

  String showedDate = "Select Date";

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
                                    showSelectedDate(),
                                    style: const TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(
                                      () async {
                                        final choosedDate =
                                            await pickDate(context);
                                        date = DateTime(
                                          choosedDate!.year,
                                          choosedDate.month,
                                          choosedDate.day,
                                        );
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                //هي الزر تبع اختيار ال وقت time picker
                                TextButton(
                                  onPressed: () {
                                    setState(
                                      () async {
                                        final choosedTime =
                                            await pickTime(context);
                                        time = TimeOfDay(
                                          hour: choosedTime!.hour,
                                          minute: choosedTime.minute,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    showSelectedTime(),
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
                                      margin:
                                          const EdgeInsets.only(right: 10),
                                      width: MediaQuery.of(context)
                                              .size
                                              .width *
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
                                          enabledBorder:
                                              UnderlineInputBorder(
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
                                      margin:
                                          const EdgeInsets.only(right: 10),
                                      width: MediaQuery.of(context)
                                              .size
                                              .width *
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
                                          enabledBorder:
                                              UnderlineInputBorder(
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
                                        selectedMinuteDuration =
                                            choosedDurationMinuteController
                                                .text;
                                        selectedHoursDuration =
                                            choosedDurationHoursController.text;
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

  String showSelectedDate() {
    if (date == DateTime(2021)) {
      return 'select Date';
    }
    return DateFormat("MM/dd/yyyy").format(date);
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

  String showSelectedTime() {
    if (time == const TimeOfDay(hour: 23, minute: 41)) {
      return 'select Time';
    }
    return time.format(context);
  }

  /*

              ////////////        staffs        ////////////

  */

  //هي ال widget  اللي بتعرض خيار ال  select all staffs ك checkBox

  Widget buildGroupStaffCheckbox(StaffCheckBox staffCheckBox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          staffCheckBox.staff_name,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.orange,
          ),
        ),
        activeColor: Colors.blue,
        value: staffCheckBox.isChecked,
        onChanged: toggleGroupStaffCheckbox,
      );

  // for choosing all staffs in one choice
  // its called select all staffs
  // هاد تابع بيتقق اذا تم اختبار ال كل ال staffs او لأ
  //مشان الخيار select all staffs

  void toggleGroupStaffCheckbox(bool? isChecked) {
    if (isChecked == null) return;
    setState(() {
      selectAllStaff.isChecked = isChecked;
      // ignore: avoid_function_literals_in_foreach_calls
      chooseStaff.forEach((staff) => staff.isChecked = isChecked);
    });
  }

  //هي ال widget  اللي بتعرض ال staffs ك checkBox

  Widget buildStaffCheckbox(StaffCheckBox staffCheckBox) => CheckboxListTile(
        onChanged: (staffValue) => setState(() {
          staffCheckBox.isChecked = staffValue!;
          selectAllStaff.isChecked =
              chooseStaff.every((staff) => staff.isChecked == true);
        }),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.blue,
        value: staffCheckBox.isChecked,
        title: Text(
          staffCheckBox.staff_name,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      );

  /*

            ///////////       service check       ///////////

  */

  //هاد التابع اللي رح يتحقق من انو طلب الحجز كامل قبل ما ينبعت ع ال dataBase
  bool checkNewRequest(String selectedMinuteDuration,
      String selectedHoursDuration, String serviceName) {
    if (serviceName == 'Select Service') {
      snackBar(context, 'Please Select Service',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (date.year == 2021) {
      snackBar(context, 'Please Select Date',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (time == const TimeOfDay(hour: 23, minute: 41)) {
      snackBar(context, 'Please Select Time',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (time.hour > 18 && time.hour < 24) {
      snackBar(context, 'This period is unavailable',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (selectedMinuteDuration == "" && selectedHoursDuration == "") {
      snackBar(context, 'Please Select Duration',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      for (int i = 0; i < selectedHoursDuration.length; i++) {
        if (selectedHoursDuration[i] == '.' ||
            selectedHoursDuration[i] == ' ' ||
            selectedHoursDuration[i] == ',') {
          snackBar(context, 'Please Select Correct Hours Duration',
              const Color.fromARGB(255, 150, 10, 10));
          return false;
        } else if (selectedMinuteDuration[i] == '.' ||
            selectedMinuteDuration[i] == ' ' ||
            selectedMinuteDuration[i] == ',') {
          snackBar(context, 'Please Select Correct Minute Duration',
              const Color.fromARGB(255, 150, 10, 10));
          return false;
        }
      }
      if (selectedHoursDuration == "" || selectedHoursDuration == " ") {
        selectedHoursDuration = "00";
      } else if (selectedMinuteDuration == "" ||
          selectedMinuteDuration == " ") {
        selectedMinuteDuration = "00";
      }
      int closedHours = int.parse(selectedHoursDuration);
      int closedMinutes = int.parse(selectedMinuteDuration);
      if ((closedHours + time.hour) >= 18) {
        snackBar(
            context,
            'Duration Exceeding closing time,'
            ' please Edit duration or time',
            const Color.fromARGB(255, 150, 10, 10));
        return false;
      } else if ((closedHours + time.hour) >= 17 &&
          (closedMinutes + time.minute) >= 59) {
        snackBar(
            context,
            'Duration Exceeding closing time,'
            ' please Edit duration or time',
            const Color.fromARGB(255, 150, 10, 10));
        return false;
      }
      snackBar(context, "Service Requested Successfully",
          const Color.fromARGB(255, 15, 150, 10));
      UserRequestsPage.requestList.add(
        RequestsStates(
          gateTitle: widget.gateName,
          serviceTitle: selectedService!,
          serviceDate: DateFormat("MM/dd/yyyy").format(date),
          serviceTime: time,
          hoursDuration: int.parse(selectedHoursDuration),
          minuteDuration: int.parse(selectedMinuteDuration),
          user: "user"
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

  /*

              ////////////       snackBar       ////////////

  */

  //هاد تابع لل SnackBar بيعرض رسالة الخطأ او رسالة ال اتمام العملية
  void snackBar(
      BuildContext context, String errorMessage, Color snackBarColor) {
    final snackBar = SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      backgroundColor: snackBarColor,
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
