import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../main.dart';
import '../constant.dart';
import '../user/user_requests_new.dart';
import '/Api/model/all_reservation_model.dart';
import '../../services/choices.dart';
import '../../Spam/requests/user_requests.dart';

class ServiceCalender extends StatefulWidget {
  const ServiceCalender({Key? key}) : super(key: key);

  @override
  State<ServiceCalender> createState() => _ServiceCalenderState();
}

class _ServiceCalenderState extends State<ServiceCalender> {

  List<AllReservations> uList = [];
  List<AllReservations> userLists = [];
  List<AllReservations> myAdminRequestsManageList = [];

  static List<AllReservations> parseAgents(String responseBody) {
    print("Parse Agent done");
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<AllReservations>((json) => AllReservations.fromJson(json))
        .toList();
  }

  Future<List<AllReservations>> fetchData() async {

    final response = await http.get(
      Uri.parse('${baseUrl}/api/Admin/Reservation'),
      headers: {
        'Authorization': 'Bearer $adminToken',
                'Accept':'application/json'
      },
    );
    print('the tokeassafdas');

    print('the statues is ${response.body}');
    if (response.statusCode == 200) {
      // final List parsedList = json.decode(response.body);
      // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //  print("${response.body}");json.decode(response.body);
      List<AllReservations> list = parseAgents(response.body);
      print("List Print$list");
      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  var servicesCalendarDate = DateTime(2021);
  String showedDate = "select Date";
  DateTime selectedDate = DateTime(2021);

  @override
  void initState() {
    super.initState();
    fetchData().then((subjectFromServer) {
      setState(() {
        print("the u list is : $uList");
        uList = subjectFromServer;
        userLists = uList;
        print("user list print${userLists[0].gateName}");

        for (int i = 0; i < userLists.length; i++) {
          if (userLists[i].isAccepted == 1) {
            myAdminRequestsManageList.add(
              userLists[i],
            );
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBarContent(),
      body: Builder(builder: (context) {
        return Stack(
          children: <Widget>[
            // هاد container بيحوي صورة الخلفية
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "asset/images/background_picture.png",
                fit: BoxFit.cover,
              ),
            ),
            //هاد لون فوق الخلفية مشات وضوح الكتابة
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(150, 60, 60, 100),
            ),

            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.14,
                  ),
                  //  هاد logo  الشركة
                  Image.asset(
                    "asset/images/logo.png",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.095,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.704,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      color: Color.fromARGB(180, 0, 0, 65),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TextButton(
                            child: Text(
                              showedDate,
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              final choosedDate =
                                  await pickServicesCalendarDate(context);
                              selectedDate = DateTime(
                                choosedDate!.year,
                                choosedDate.month,
                                choosedDate.day,
                                choosedDate.hour,
                                choosedDate.minute,
                              );
                              showSelectedCalendarDate();
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                print('the select date${selectedDate}');
                                if(myAdminRequestsManageList.isNotEmpty){

                                print(
                                    'the select array${myAdminRequestsManageList[0].startTime}');
                                }
                                if(myAdminRequestsManageList.isEmpty){

                                print(
                                    'the select array is empty');
                                }

                                serviceDateFilter(
                                  myAdminRequestsManageList,
                                  selectedDate,
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 60),
                              padding: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.2,
                              ),
                              primary: const Color.fromARGB(255, 10, 150, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15.0,
                            ),
                            child: const Text(
                              "Show calender",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ListView(
                              children: <Widget>[
                                ...adminCalendarList
                                    .map(
                                      (element) => Container(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              element.gateName,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 90,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.blue),
                                              ),
                                              child: ListView(
                                                padding: const EdgeInsets.only(
                                                  top: 1,
                                                  left: 30,
                                                ),
                                                children: <Widget>[
                                                  // ...element.serviceName.map((service) {
                                                  //   return
                                                  Text(
                                                    element.serviceName,
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.white),
                                                  ),
                                                  //;
                                                  // }).toList(),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "${DateFormat("yyyy-MM-dd").format(element.startTime)}",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Start : ${element.startTime}",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "End : ${element.endTime}",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            // Container(
                                            //   child: ListView(
                                            //     children: <Widget>[
                                            //       element.serviceTitleList
                                            //           .map(
                                            //             (service) => Text(
                                            //               service,
                                            //               style: TextStyle(
                                            //                 fontSize: 16,
                                            //                 color: Colors.white,
                                            //               ),
                                            //             ),
                                            //           )
                                            //           .toList()
                                            //     ],
                                            //   ),
                                            // ),
                                            const Divider(
                                              color: Colors.white,
                                              indent: 30,
                                              endIndent: 30,
                                              thickness: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  AppBar _appBarContent() => AppBar(
    centerTitle: true,
    title: _appBarTitle(),
    backgroundColor: const Color.fromARGB(180, 0, 0, 65),
  );

  Text _appBarTitle() => const Text(
    "Calender",
    style: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      fontStyle: FontStyle.italic,
      color: Colors.deepOrange,
    ),
  );

  Future<DateTime?> pickServicesCalendarDate(BuildContext context) async {
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

  showSelectedCalendarDate() {
    setState(() {
      if (selectedDate != DateTime(2021)) {
        showedDate = DateFormat("yyyy/MM/dd").format(selectedDate);
      }
    });
  }

  //////////
  List<UserRequestsPage> mList = [];

  List serviceDateFilter(
      List<AllReservations> allAcceptedServicesList, DateTime currentDate) {
    adminCalendarList.clear();
    List NoServiceList = ["0000"];
    allAcceptedServicesList.forEach((service) {
      print('${DateFormat("yyyy-MM-dd").format(currentDate)}');
      if (DateFormat("yyyy-MM-dd").format(service.startTime) ==
          DateFormat("yyyy-MM-dd").format(currentDate))
        adminCalendarList.add(service);
    });

    if (adminCalendarList.isEmpty) return NoServiceList;
    return adminCalendarList;
  }
}
