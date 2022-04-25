import 'package:project_mohammad/services/service_info_input.dart';
import 'package:project_mohammad/services/staff.dart';
import 'package:flutter/material.dart';



class OnHold extends StatefulWidget {
  final String title;

  const OnHold({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<OnHold> createState() => _OnHoldState();
}

class _OnHoldState extends State<OnHold> {
  static DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(110, 0, 0, 65),
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
              color: const Color.fromARGB(150, 60, 60, 100),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                  ),
                  Image.asset(
                    "asset/images/logo.png",
                    width: double.infinity,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(180, 0, 0, 65),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 4),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        children: const <Widget>[
                          Text(
                            "Requests",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // pickDateTime(context, widget.title);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return ServiceInformationInput(
                              gateName: widget.title,
                            );
                          }
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: MediaQuery.of(context).size.width * 0.25,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 8.0,
                      // shadowColor: Colors.deepPurple
                    ),
                    child: const Text(
                      "New Request",
                      style: TextStyle(
                        // backgroundColor: Colors.deepOrangeAccent,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future pickDateTime(BuildContext context, String title) async {
    final date = await pickDate(context);
    if (date == null) return;
    final time = await pickTime(context);
    if (time == null) return;
    final length = await openTimeDialog(context);
    if (length == null) return;
    final staffChoose = await show_staff_list(context);
    // ignore: unnecessary_null_comparison
    if (staffChoose == null) return;
    final serviceTitle = await openServiceDialog(context);
    if (serviceTitle == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      // Requests.requestList.add(
      //   RequestsStates(
      //     gateTitle: widget.title,
      //     serviceTitle: serviceTitle,
      //     serviceDate: DateFormat("MM/dd/yyyy HH:mm").format(dateTime),
      //     length: length,
      //   ),
      // );
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => const Requests()),
      // );
    });
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(initialDate.year + 1),
    );
    if (newDate == null) return null;
    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 8, minute: 20);
    final newTime = await showTimePicker(
      context: context,
      // ignore: unnecessary_null_comparison
      initialTime: dateTime != null
          ? TimeOfDay(
              hour: dateTime.hour,
              minute: dateTime.minute,
            )
          : initialTime,
    );
    if (newTime == null) return null;
    return newTime;
  }

  Future<String?> openTimeDialog(BuildContext context) async => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Choose Time",
            style: TextStyle(
              fontSize: 22,
              color: Colors.orange,
            ),
          ),
          content: Row(
            children: <Widget>[
              DropdownButton<String>(
                items: times.map(buildMenuItem).toList(),
                value: timeValue,
                onChanged: (value) => setState(
                  () {
                    timeValue = value;
                    Navigator.of(context).pop(timeValue);
                    // submit(double.parse(value!));
                  },
                ),
              ),
              const Text(
                "hour/s",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      );

  // void submit(double time) {
  //   timeValue = '$time';
  //   Navigator.of(context).pop(timeValue);
  //
  //   // return time;
  // }

  final times = [
    '0.5',
    '1',
    '1.5',
    '2',
    '2.5',
    '3',
    '3.5',
    '4',
  ];
  String? timeValue = "Not Assigned";

  DropdownMenuItem<String> buildMenuItem(String time) => DropdownMenuItem(
        value: time,
        child: Text(
          time,
          style: const TextStyle(fontSize: 24, color: Colors.orange),
        ),
      );


  List<StaffCheckBox> staffList = [
    StaffCheckBox(staff_name: "first"),
    StaffCheckBox(staff_name: "second"),
    StaffCheckBox(staff_name: "third"),
    StaffCheckBox(staff_name: "forth"),
    StaffCheckBox(staff_name: "fifth"),
    StaffCheckBox(staff_name: "sixth"),
  ];

  Widget assignStaff(StaffCheckBox staff) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.deepOrange,
        title: Text(
          staff.staff_name,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        value: staff.isChecked,
        onChanged: (value) => setState(() => staff.isChecked = value!),
      );

  // ignore: non_constant_identifier_names
  Future<Future> show_staff_list(BuildContext context) async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Assign Staff",
            style: TextStyle(
              fontSize: 28,
              color: Colors.blue,
            ),
          ),
          content: ListView(
            children: <Widget>[
              ...staffList.map(assignStaff).toList(),
            ],
          ),
        ),
      );

////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

  Future<String?> openServiceDialog(BuildContext context) async =>
      showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Assign Service",
            style: TextStyle(
              fontSize: 22,
              color: Colors.orange,
            ),
          ),
          content: Row(
            children: <Widget>[
              DropdownButton<String>(
                items: Services.map(buildServiceMenuItem).toList(),
                value: serviceValue,
                onChanged: (value) => setState(
                  () {
                    serviceValue = value;
                    service_submite(value!);
                  },
                ),
              ),
              const Text(
                "service",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      );

// ignore: non_constant_identifier_names
  void service_submite(String serviceVal) {
    serviceValue = serviceVal;
    Navigator.of(context).pop(serviceValue);

    // return time;
  }

// ignore: non_constant_identifier_names
  List<String> Services = [
    'not assigned',
    'Tower Crane 1',
    'Tower Crane 2',
    'BLK BuckHoist',
    'TWR BuckHoist',
    'Trailer Pump',
    'Ramp-BSE',
  ];

  String? serviceValue;

  DropdownMenuItem<String> buildServiceMenuItem(String time) =>
      DropdownMenuItem(
        value: time,
        child: Text(
          time,
          style: const TextStyle(fontSize: 24, color: Colors.orange),
        ),
      );
}
