import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_mohammad/project/constant.dart';

import '../../Api/controller/User/work/services_controller.dart';
import '../../Api/model/my_accepted_model.dart';
import '../../components/dash_board.dart';
import '../../main.dart';

<<<<<<< HEAD
String tokenUser='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMThiOTJmYzBlNWE0YThkZjQ0NDM3NmRhODI0M2Q4NTc5ZDY4YmZkYzQ5MGFmN2Q2MDU4MWZlY2Y3ZjllYmVjNjRmNjFjYzExNTI2MTU2YzAiLCJpYXQiOjE2NjI2NTg3MzguNDA5MTIxLCJuYmYiOjE2NjI2NTg3MzguNDA5MTMzLCJleHAiOjE2OTQxOTQ3MzguMzgyMTQsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.JglZtVeEXuCX-y9lyoG101CDevE-s5EevM2wCDP7uDI-DLsPYrxGsK5noIei3o0xWi8bz0JjX-VVDDaAsxdmF7jhT3nBuLqy-Hqqq5Tagx_ritDwcsIuSecFirsTkoF3YHUPz5j2Z6_ZKmNfufp65gCDsKyYy_c_OBfAXnHTIsKU1n1LHseDxipD1hxOYp5RG8b23LRq2GdsGXIPh-Q7H_yfCx3H7fAYiye60D01dt_rVBD2DcneojvOqCOVGNI99syPHjz01dYFpLTpAgtrpT4Jgxi7x_bcDUVEsIWqJHSaxVWai8IGNKllJol7hRmyECz5bbZtsPdcilXygA_kpTJeziLUr8bIDuMI_q3-CbVzXnkOAyTAl5ChllVhKkrrsFdUtSe7mvud14XholKMA9-hwjznZRYvLD_e8yH-0pQ_6tVxgUZ_PAPjCtQr6-7UCUbzEEICLZ7-NqEi6WO-NLSxNqE_XULuTnmRYGVtzCnrQViqDVWl9b5AolKWWLm8rcSa83uDddOnKs6HZwY1RAqH5V1zZ63q0wU_yhW7UI7_Zpjjd-90EjYUFicg5jj-mSaMcvlQpicISIvimt8veMJXoLd_PuY_tG5x3cPZWPpteCE2OzYwM0PNnXN7xfNB8_sLSgZsE8auq3BcvU0JtNuY7vL6Q1F2KfLj_ofuHLE';

=======
>>>>>>> 7af0289f19b2ab59e21f79499360d49b316fc19d
class UserRequestsPage extends StatefulWidget {
  static List<MyAccepted> requestList = [];
  static List<MyAccepted> acceptedRequestList = [];

  const UserRequestsPage({Key? key}) : super(key: key);

  @override
  State<UserRequestsPage> createState() => _UserRequestsPageState();
}

class _UserRequestsPageState extends State<UserRequestsPage> {
  List<MyAccepted> uList = [];
  List<MyAccepted> reservationsLists = [];


  static List<MyAccepted> parseAgents(String responseBody) {
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MyAccepted>((json) => MyAccepted.fromJson(json)).toList();
  }

  Future<List<MyAccepted>> fetchData() async {
    var url =
        Uri.parse('http://$baseUrl/api/Reservation/MyAcceptedReservation');
    final response = await http.get(
<<<<<<< HEAD
      Uri.parse('$base_Url/api/Reservation/MyAcceptedReservation'),
=======
      url,
>>>>>>> 7af0289f19b2ab59e21f79499360d49b316fc19d
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken',
      },
    );

    if (response.statusCode == 200) {
      // final List parsedList = json.decode(response.body);
      // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //
      List<MyAccepted> list = parseAgents(response.body);

      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  List<MyAccepted> pending = [];
  List<MyAccepted> pendingList = [];

  static List<MyAccepted> parseAgentForMyPending(String responseBody) {
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MyAccepted>((json) => MyAccepted.fromJson(json)).toList();
  }

  Future<List<MyAccepted>> myPendingReservations() async {
    final response = await http.get(
      Uri.parse('http://$baseUrl/api/Reservation/MyPendingReservation'),
      headers: {'Authorization': 'Bearer $userToken'},
    );

    if (response.statusCode == 200) {
      // final List parsedList = json.decode(response.body);
      // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //
      List<MyAccepted> list = parseAgents(response.body);

      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  @override
  void initState() {
    print('Start init state');
    // UserRequestsPage.requestList.clear();
    super.initState();
    print('Start init fetch');
    fetchData().then((subjectFromServer) {
      print('start then');
      setState(() {
        reservationsLists.addAll(subjectFromServer);

        for (var reservation in reservationsLists) {
          print("$reservation");
          UserRequestsPage.requestList.add(reservation);
        }
      });
      print('start for loop');
    });
    print('end init fetch , start myPending reservations');

    myPendingReservations().then((subjectFromServer) {
      setState(() {
        pendingList.addAll(subjectFromServer);

        for (var pendingReservation in pendingList) {
          print("$pendingReservation");
          UserRequestsPage.requestList.add(pendingReservation);
        }
      });
    });
    print('end init state');
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
                                  height:
                                      MediaQuery.of(context).size.width * 0.9,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    ),
                                  ),
                                  child: ListView(
                                    children: <Widget>[
                                      ...UserRequestsPage.requestList
                                          .map((val) {
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
                                                        Text(
                                                          val.serviceName,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${DateFormat("yyyy/MM/dd").format(val.createdAt)}',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                          ),
                                                        ),
                                                        Text(
                                                          " start at ${DateFormat("HH:mm").format(val.startTime)}",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                          ),
                                                        ),
                                                        Text(
                                                          "end at ${DateFormat("HH:mm").format(val.endTime)}",
                                                          style:
                                                              const TextStyle(
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
                                                          "from ${val.gateName}",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                TextButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    onPrimary:
                                                        const Color.fromARGB(
                                                            255, 230, 84, 15),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            -5),
                                                    shadowColor:
                                                        Colors.transparent,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      //حط تابع الحذف هون
                                                      Service
                                                          .delete_reservation(
                                                              val.id);
                                                      UserRequestsPage
                                                          .requestList
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
                                              height: 0.09,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                const Text(
                                  "Accepted",
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
                                  height:
                                      MediaQuery.of(context).size.width * 0.9,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    ),
                                  ),
                                  child: ListView(
                                    children: <Widget>[
                                      ...UserRequestsPage.requestList
                                          .map((val) {
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
                                                        Text(
                                                          val.serviceName,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${DateFormat("yyyy/MM/dd").format(val.createdAt)}',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                          ),
                                                        ),
                                                        Text(
                                                          " start at ${DateFormat("yyyy/MM/dd").format(val.startTime)}",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                          ),
                                                        ),
                                                        Text(
                                                          "end at ${DateFormat("yyyy/MM/dd").format(val.endTime)}",
                                                          style:
                                                              const TextStyle(
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
                                                          "from ${val.gateName}",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 0.4,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                              ],
                            ),
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
