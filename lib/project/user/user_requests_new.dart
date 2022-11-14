import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:project_mohammad/project/constant.dart';

import '../../Api/model/my_accepted_model.dart';
import '../../Cubit/User Level Operation/user_operation_cubit.dart';
import '../../components/dash_board.dart';
import '../../main.dart';

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
    final response = await http.get(
      Uri.parse('$baseUrl/api/Reservation/MyAcceptedReservation'),
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

  Future<List<MyAccepted>> myPendingReservations() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/Reservation/MyPendingReservation'),
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
          UserRequestsPage.acceptedRequestList.add(reservation);
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
            tabs: [
              Tab(
                text: "pending",
              ),
              Tab(
                text: "Accepted",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                       SizedBox(
                         height: MediaQuery.of(context).size.height * 0.23,
                       ),
                      // Image.asset(
                      //   "asset/images/logo.png",
                      //   width: 200,
                      //   height: 80,
                      // ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      BlocConsumer<UserOperationCubit,
                          UserOperationState>(
                        listener: (context, state) {
                          // TODO: implement listener
                          if (state is SuccessStatus) {
                            print("success");
                          }

                          //في حال دخل كلمة سر خطأ
                          if (state is FailureStatus) {
                            //هون حط توست ماسج انو كلمة السر غلط
                            print("رسالة الخطأ انو كلمة السر غلط");
                          }
                        },
                        builder: (context, state) {
                          var cubit = UserOperationCubit.get(context);
                          return Expanded(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(35),
                                ),
                              color: const Color.fromARGB(150, 0, 0, 65),

                              ),
                              child: ListView(
                                shrinkWrap: true,
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
                                                  MainAxisAlignment
                                                      .center,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      val.serviceName,
                                                      style:
                                                          const TextStyle(
                                                        color:
                                                            Colors.white,
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight
                                                                .bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${DateFormat("yyyy/MM/dd").format(val.createdAt)}',
                                                      style:
                                                          const TextStyle(
                                                        color:
                                                            Colors.white,
                                                        fontSize: 26,
                                                      ),
                                                    ),
                                                    Text(
                                                      " start at ${DateFormat("HH:mm").format(val.startTime)}",
                                                      style:
                                                          const TextStyle(
                                                        color:
                                                            Colors.white,
                                                        fontSize: 26,
                                                      ),
                                                    ),
                                                    Text(
                                                      "end at ${DateFormat("HH:mm").format(val.endTime)}",
                                                      style:
                                                          const TextStyle(
                                                        color:
                                                            Colors.white,
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
                                                        color:
                                                            Colors.white,
                                                        fontSize: 26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            TextButton(
                                              style: ElevatedButton
                                                  .styleFrom(
                                                primary:
                                                    Colors.transparent,
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
                                                  cubit
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
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Stack (
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
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.23,
                    ),
                    // Image.asset(
                    //   "asset/images/logo.png",
                    //   width: 200,
                    //   height: 80,
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height ,
                        width: MediaQuery.of(context).size.width ,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            color: const Color.fromARGB(150, 0, 0, 65),

                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            ...UserRequestsPage.acceptedRequestList
                                .map((val) {
                              return Card(
                                color: Color.fromARGB(30, 10, 10, 10),
                                child: Column(
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
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 26,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat("yyyy/MM/dd").format(val.createdAt)}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 26,
                                                  ),
                                                ),
                                                Text(
                                                  " start at ${DateFormat("yyyy/MM/dd").format(val.startTime)}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 26,
                                                  ),
                                                ),
                                                Text(
                                                  "end at ${DateFormat("yyyy/MM/dd").format(val.endTime)}",
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
                                                  "from ${val.gateName}",
                                                  style: const TextStyle(
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
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBarContent() => AppBar(
        centerTitle: true,
        title: _appBarTitle(),
        backgroundColor: const Color.fromARGB(150, 0, 0, 65),
      );

  Text _appBarTitle() => const Text(
        "Requests",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Color.fromARGB(255, 230, 84, 15),
        ),
      );

  ///////////////////////////
/////////////////////////

  Widget _widgetm() => Stack(
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
                  child: BlocConsumer<UserOperationCubit, UserOperationState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if (state is SuccessStatus) {
                        print("success");
                      }

                      //في حال دخل كلمة سر خطأ
                      if (state is FailureStatus) {
                        //هون حط توست ماسج انو كلمة السر غلط
                        print("رسالة الخطأ انو كلمة السر غلط");
                      }
                    },
                    builder: (context, state) {
                      var cubit = UserOperationCubit.get(context);
                      return SingleChildScrollView(
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
                              height: MediaQuery.of(context).size.width * 0.9,
                              width: MediaQuery.of(context).size.width * 0.7,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              child: ListView(
                                children: <Widget>[
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
                                                    Text(
                                                      val.serviceName,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${DateFormat("yyyy/MM/dd").format(val.createdAt)}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 26,
                                                      ),
                                                    ),
                                                    Text(
                                                      " start at ${DateFormat("HH:mm").format(val.startTime)}",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 26,
                                                      ),
                                                    ),
                                                    Text(
                                                      "end at ${DateFormat("HH:mm").format(val.endTime)}",
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
                                                      "from ${val.gateName}",
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
                                                padding:
                                                    const EdgeInsets.all(-5),
                                                shadowColor: Colors.transparent,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  //حط تابع الحذف هون
                                                  cubit.delete_reservation(
                                                      val.id);
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
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      );
}
