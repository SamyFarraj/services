import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_mohammad/Api/model/my_reservations_model.dart';
import 'package:project_mohammad/services/requests_form.dart';

import '../../Api/model/myaccapted_model.dart';
import '../../components/dash_board.dart';
import '../admin/admin_requests_page.dart';
import '../projects_page.dart';

int val = 0;

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (admin) {
      return AdminRequestsPage();
    } else {
      return const UserRequestsPage();
    }
  }
}

class UserRequestsPage extends StatefulWidget {
  static List<Myascapted> requestList = [];

  const UserRequestsPage({Key? key}) : super(key: key);

  @override
  State<UserRequestsPage> createState() => _UserRequestsPageState();
}

class _UserRequestsPageState extends State<UserRequestsPage> {


  List<Myascapted> ulist = [];
  List<Myascapted> userLists = [];

  @override
  static List<Myascapted> parseAgents(String responseBody) {
    print("sdknkjsdngjnd");
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Myascapted>((json) => Myascapted.fromJson(json))
        .toList();
  }

  Future<List<Myascapted>> fetchData() async {
    final response = await http.get(
      Uri.parse('http://192.168.56.1:8000/api/Reservation/MyAcceptedReservation'),
      headers: {
        'Authorization':
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzEwOWI1YjMzY2JmMjlhMDdjZTk3MGU3ZWYzOGQxMGQ4ODdlNDkzZThlNTgyMDJiOTNiMzU3MDNhNDBkYjY5YzQ0MDE4NDZiNWVkNjNlMzQiLCJpYXQiOjE2NTA5NDQ1NzkuMzcwMjAyLCJuYmYiOjE2NTA5NDQ1NzkuMzcwMjA4LCJleHAiOjE2ODI0ODA1NzkuMzAwNzk1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.LafISEKD8yn9StQjfbHT7yxAFqkDxpmcTgFyqshSmS6bCbuv1lzYc9DpBVT54siGXDkkVW4999pUX6U38S1zAAdK4LvfDip8k74ZA2HIodczwBeWK7AuF0-WG4PCnOwAzXXMe0Qg9_QjPh1FLJ7Dk1tws9MTAs0A42-Or1_hlb2LbUg0_9icWP6__hG78nvLKepCVd4CUNxjQWD1TQj-VA0oK9DZazF8N33dAC4w3TqeDtOfhsIS3cCnEfS13574eS_EhGdOaCwWKUanwyuwjxWOuwmWNf0xzhWljERnHIrC4cr7Yx0urpfYniZtb63Qz7mY8abLX-2dCr9EyFAzsUZyia2zuVZV1OVxTiaOQ6GZEmT6IyOKEMzFTNItRsaJnElYmCrB8eYL1DC4vA7B5txbUqATeR-TLGYwqhA7S18yxElg_peDAqfA-iznUDb90BH3y9toa-tYNYyrFWcCNt7fFH_DwYMxk0LPNz-jm1ATBwX7a9eSaillN8AEpuuq93IXiCicg9pURT_uG3KhafsXHwFJd-2reHRXUkHSgcONEQgHGd0P6McaJPbJnfAaIMcXS06aPNTjROSk3X8RsrICTKPrQDY1DTCtBNfm_6OI1oIDARMaTd2RE3rIPu0jqsTyfmw0NxKM8QvaWNnyPPHCZ5GzVsVBIWJ97-_nWNQ"
      },
    );
    print('the statues is ${response.statusCode}');
    if (response.statusCode == 200) {
      final List parsedList = json.decode(response.body);
     // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //  print("${response.body}");json.decode(response.body);
       List<Myascapted> list = parseAgents(response.body);
      print("sdasdasdasdsad$list");
      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  List<Myascapted> pending = [];
  List<Myascapted> listpending = [];


  @override
  static List<Myascapted> parseAgentsformypending(String responseBody) {
    print("sdknkjsdngjnd");
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Myascapted>((json) => Myascapted.fromJson(json))
        .toList();
  }

  Future<List<Myascapted>> mypendingresrrvations() async {
    final response = await http.get(
      Uri.parse('http://192.168.56.1:8000/api/Reservation/MyPendingReservation'),
      headers: {
        'Authorization':
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzEwOWI1YjMzY2JmMjlhMDdjZTk3MGU3ZWYzOGQxMGQ4ODdlNDkzZThlNTgyMDJiOTNiMzU3MDNhNDBkYjY5YzQ0MDE4NDZiNWVkNjNlMzQiLCJpYXQiOjE2NTA5NDQ1NzkuMzcwMjAyLCJuYmYiOjE2NTA5NDQ1NzkuMzcwMjA4LCJleHAiOjE2ODI0ODA1NzkuMzAwNzk1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.LafISEKD8yn9StQjfbHT7yxAFqkDxpmcTgFyqshSmS6bCbuv1lzYc9DpBVT54siGXDkkVW4999pUX6U38S1zAAdK4LvfDip8k74ZA2HIodczwBeWK7AuF0-WG4PCnOwAzXXMe0Qg9_QjPh1FLJ7Dk1tws9MTAs0A42-Or1_hlb2LbUg0_9icWP6__hG78nvLKepCVd4CUNxjQWD1TQj-VA0oK9DZazF8N33dAC4w3TqeDtOfhsIS3cCnEfS13574eS_EhGdOaCwWKUanwyuwjxWOuwmWNf0xzhWljERnHIrC4cr7Yx0urpfYniZtb63Qz7mY8abLX-2dCr9EyFAzsUZyia2zuVZV1OVxTiaOQ6GZEmT6IyOKEMzFTNItRsaJnElYmCrB8eYL1DC4vA7B5txbUqATeR-TLGYwqhA7S18yxElg_peDAqfA-iznUDb90BH3y9toa-tYNYyrFWcCNt7fFH_DwYMxk0LPNz-jm1ATBwX7a9eSaillN8AEpuuq93IXiCicg9pURT_uG3KhafsXHwFJd-2reHRXUkHSgcONEQgHGd0P6McaJPbJnfAaIMcXS06aPNTjROSk3X8RsrICTKPrQDY1DTCtBNfm_6OI1oIDARMaTd2RE3rIPu0jqsTyfmw0NxKM8QvaWNnyPPHCZ5GzVsVBIWJ97-_nWNQ"
      },
    );
    print('the statues is ${response.statusCode}');
    if (response.statusCode == 200) {
      final List parsedList = json.decode(response.body);
      // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //  print("${response.body}");json.decode(response.body);
      List<Myascapted> list = parseAgents(response.body);
      print("sdasdasdasdsad$list");
      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }
  @override
  void initState() {
   UserRequestsPage.requestList.clear();
    super.initState();
    fetchData().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
        print("fsfsdfdsfdsf${userLists[0].gateName}");

        for(int i=0;i<userLists.length;i++)
          {

            UserRequestsPage.requestList.add(userLists[i]);
          }
      });
    });

    mypendingresrrvations().then((subjectFromServer) {
      setState(() {

        pending = subjectFromServer;
        listpending = pending;
        print("the pending list is $listpending");
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DashBoard(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Requests",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 230, 84, 15),
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
              color: const Color.fromARGB(150, 60, 60, 100),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                  ),
                  Image.asset(
                    "asset/images/logo.png",
                    width: 200,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    color: const Color.fromARGB(180, 0, 0, 65),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              color: Colors.blue,
                              // color: const Color.fromARGB(255, 230, 84, 15),
                              width: 5,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Pending",
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Color.fromARGB(255, 230, 84, 15),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  height: 0.009,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  )),
                                ),
                                ...UserRequestsPage.requestList.map((val) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  // Text(
                                                  //   val.serviceTitle,
                                                  //   style: const TextStyle(
                                                  //     color: Colors.white,
                                                  //     fontSize: 26,
                                                  //     fontWeight:
                                                  //         FontWeight.bold,
                                                  //   ),
                                                  // ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    height: 90,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.blue),
                                                    ),
                                                    child: ListView(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 1,
                                                        left: 30,
                                                      ),
                                                      children: [
                                                        ...val.serviceTitle
                                                            .map((service) {
                                                          return Text(
                                                            service,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        22,
                                                                    color: Colors
                                                                        .white),
                                                          );
                                                        }).toList(),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    val.serviceStartDate,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  Text(
                                                    " start at ${val.serviceTime.format(context)}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  Text(
                                                    "end at ${val.endingTime.format(context)}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   " for ${val.hoursDuration}"
                                                  //   " hour/s and "
                                                  //   "${val.minuteDuration} "
                                                  //   "minute/s",
                                                  //   style: const TextStyle(
                                                  //     color: Colors.white,
                                                  //     fontSize: 21,
                                                  //   ),
                                                  // ),
                                                  Text(
                                                    "from ${val.gateTitle}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.transparent,
                                              onPrimary: const Color.fromARGB(
                                                  255, 230, 84, 15),
                                              padding: const EdgeInsets.all(-5),
                                              shadowColor: Colors.transparent,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                UserRequestsPage.requestList
                                                    .remove(val);
                                              });
                                            },
                                            child: const Icon(
                                              Icons.delete_rounded,
                                              size: 35,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Container(
                                        height: 0.009,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.65,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.blue,
                                            // color: const Color.fromARGB(
                                            //     255, 230, 84, 15),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),



                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              color: Colors.blue,
                              // color: const Color.fromARGB(255, 230, 84, 15),
                              width: 5,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              const Text(
                                "Passed",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Color.fromARGB(255, 230, 84, 15),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                ),
                                height: 0.009,
                                width: MediaQuery.of(context).size.width * 0.7,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
