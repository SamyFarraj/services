import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../project/user/user_requests_new.dart';
import '/components/dash_board.dart';
import '/project/constant.dart';
import '../../Api/model/my_accepted_model.dart';
import '../../Cubit/Admin Level Operation/admin_level_cubit.dart';
import '../../main.dart';
import '../../services/requests_form.dart';
import 'user_requests.dart';

class AdminRequestsPage extends StatefulWidget {
  AdminRequestsPage({Key? key}) : super(key: key);

  final List<MyAccepted> adminAcceptedRequestListEd = [];

  @override
  State<AdminRequestsPage> createState() => _AdminRequestsPageState();
}

AdminRequestsPage arp = AdminRequestsPage();

void acceptRequest(MyAccepted request) {
  arp.adminAcceptedRequestListEd.add(request);
  UserRequestsPage.requestList.remove(request);
}

void deleteRequest(RequestsStates request) {
  UserRequestsPage.requestList.remove(request);
}

class _AdminRequestsPageState extends State<AdminRequestsPage> {
  List<MyAccepted> theUsersList = [];
  List<MyAccepted> userLists = [];
  List<MyAccepted> adminAcceptedRequestListEds = [];

  static List<MyAccepted> parseAgents(String responseBody) {
    print("parse Agents ");
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MyAccepted>((json) => MyAccepted.fromJson(json)).toList();
  }

  Future<List<MyAccepted>> fetchData() async {
    print("the token admin is ${adminToken}");
    final response = await http.get(
      Uri.parse('$baseUrl/api/Admin/Reservation'),
      headers: {'Authorization': 'Bearer $adminToken',
    'Accept': 'application/json',
    },
    );
    print('the statues is ${response.body}');
    if (response.statusCode == 200) {
      // final List parsedList = json.decode(response.body);
      // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //  print("${response.body}");json.decode(response.body);
      List<MyAccepted> list = parseAgents(response.body);
      print("parse Agent list : $list");
      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  List<MyAccepted> pending = [];
  List<MyAccepted> listPending = [];

  static List<MyAccepted> parseAgentsForMyPending(String responseBody) {
    print("parse agent pending");
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MyAccepted>((json) => MyAccepted.fromJson(json)).toList();
  }

/*
  Future<List<MyAccepted>> myPendingReservations() async {
    final response = await http.get(
      Uri.parse('http://192.168.56.1:8000/api/Reservation/MyPendingReservation'),
      headers: {
        'Authorization': 'Bearer $t'
      },
    );
    print('the statues is ${response.statusCode}');
    if (response.statusCode == 200) {
      final List parsedList = json.decode(response.body);
      // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //  print("${response.body}");json.decode(response.body);
      List<MyAccepted> list = parseAgents(response.body);
      print("List is : $list");
      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }
  */

  @override
  void initState() {
    arp.adminAcceptedRequestListEd.clear();
    UserRequestsPage.requestList.clear();
    super.initState();
    fetchData().then((subjectFromServer) {
      setState(() {
        print("the u list is : $theUsersList");
        theUsersList = subjectFromServer;
        userLists = theUsersList;
        // print("user [0] gate is : ${userLists[0].gateName}");

        for (int i = 0; i < userLists.length; i++) {
          if (userLists[i].isAccepted == 0) {
            UserRequestsPage.requestList.add(userLists[i]);
          } else {
            arp.adminAcceptedRequestListEd.add(userLists[i]);
          }
        }
      });
    });

    // myPendingReservations().then((subjectFromServer) {
    //   setState(() {
    //
    //     pending = subjectFromServer;
    //     listPending = pending;
    //     print("the pending list is $listPending");
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DashBoard(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBarContent(),
      body: Stack(
        children: <Widget>[
          _backgroundImage(),
          _colorCorrectionLayer(),
          BlocConsumer<AdminLevelCubit, AdminLevelState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is SuccessStatus) {
                Navigator.pop(context);
                print("success");
              }

              //في حال دخل كلمة سر خطأ
              if (state is FailureStatus) {
                //هون حط توست ماسج انو كلمة السر غلط
                print("رسالة الخطأ ");
              }
            },
            builder: (context, state) {
              var cubit = AdminLevelCubit.get(context);

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _logoImage(),
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
                                  _divider(),
                                  // ...adminRequestsManageList.map((val) {

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
                                                    // ignore: prefer_const_constructors
                                                    _text(val.userName),
                                                    _text(val.serviceName),
                                                    _text('${val.createdAt}'),
                                                    _text(
                                                        "start : ${val.startTime}"),
                                                    _text(
                                                        "start : ${val.endTime}"),
                                                    _text(
                                                        "start : ${val.gateName}"),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    ConditionalBuilder(
                                                      condition: state
                                                              is RefreshLevelState ||
                                                          state
                                                              is AdminLevelInitial,
                                                      builder: (context) =>

                                                          ElevatedButton(
                                                        onPressed: () {
                                                          setState(
                                                            () => cubit
                                                                .AcceptReservation(
                                                              val.id,
                                                            ),
                                                          );
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize:
                                                              const Size(
                                                                  40, 20),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: 3.0,
                                                            horizontal:
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.05,
                                                          ),
                                                          primary:
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  10,
                                                                  150,
                                                                  10),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          elevation: 15.0,
                                                        ),
                                                        child: _text("Accept"),
                                                      ),
                                                      fallback: (context) =>
                                                          Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05,
                                                    ),
                                                    ConditionalBuilder(
                                                      condition: state
                                                              is RefreshLevelState ||
                                                          state
                                                              is AdminLevelInitial,
                                                      builder: (context) =>
                                                          ElevatedButton(
                                                        onPressed: () {
                                                          setState(
                                                            () => cubit
                                                                .delete_reservation(
                                                              val.id,
                                                            ),
                                                          );
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize:
                                                              const Size(
                                                                  40, 20),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: 3.0,
                                                            horizontal:
                                                                MediaQuery.of(
                                                                      context,
                                                                    )
                                                                        .size
                                                                        .width *
                                                                    0.05,
                                                          ),
                                                          primary:
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  150,
                                                                  10,
                                                                  10),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          elevation: 15.0,
                                                        ),
                                                        child: const Text(
                                                          "Decline",
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      fallback: (context) =>
                                                          Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    ),
                                                    //رفض حجز
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        //هاد ال container كان مشان ال staffs
                                        // كونو لغاه مؤقتا عملت كلشي يتعلق فيه
                                        // تعليقات لانو احتمال يطلبو بعدين



                                        Container(
                                          height: 0.009,
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
                          ),

                          /////////////////////////////////

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
                                  _headerText("Accepted"),
                                  _divider(),

                                  // ...adminRequestsList.map((val) {
                                  ...arp.adminAcceptedRequestListEd.map((val) {
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
                                                // ignore: prefer_const_constructors
                                                _text(val.userName),
                                                _text(val.serviceName),
                                                _text('${val.createdAt}'),
                                                _text('${val.startTime}'),
                                                _text('${val.endTime}'),
                                                _text('${val.gateName}'),

                                              ],
                                            ),
                                          ],
                                        ),

                                        Divider(
                                          color: Colors.blue,
                                          thickness: 3,
                                          height: 3,
                                        ),
                                        Container(
                                          height: 0.009,
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  AppBar _appBarContent() => AppBar(
        centerTitle: true,
        title: _appBarTitle(),
        backgroundColor: const Color.fromARGB(150, 0, 0, 65),
      );

  Widget _appBarTitle() => const Text(
        "Requests",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Color.fromARGB(255, 230, 84, 15),
        ),
      );

  Widget _backgroundImage() => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "asset/images/background_picture.png",
          fit: BoxFit.cover,
        ),
      );

  Widget _colorCorrectionLayer() => Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(150, 60, 60, 100),
      );

  Widget _logoImage() => Column(
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
        ],
      );

  ElevatedButton _elevatedButton(String title, var onPressed) => ElevatedButton(
        onPressed: () {
          setState(
            onPressed,
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(40, 20),
          padding: EdgeInsets.symmetric(
            vertical: 3.0,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          primary: const Color.fromARGB(255, 10, 150, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15.0,
        ),
        child: _text(title),
      );

  Text _headerText(String content) => Text(
    content,
    style: TextStyle(
      fontSize: 28,
      color: Color.fromARGB(255, 230, 84, 15),
      fontWeight: FontWeight.bold,
    ),
  );

  Text _text(String content) => Text(
        content,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 26,
        ),
      );

  Divider _divider() => Divider(
        color: Colors.blue,
        thickness: 3,
        height: 25,
        endIndent: 30,
        indent: 30,
      );
}
