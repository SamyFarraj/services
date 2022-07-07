

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_mohammad/components/dash_board.dart';
import 'package:http/http.dart' as http;

import '../../Api/controller/Admin/aceept_or_decline_reservation.dart';
import '../../Api/controller/login_controller.dart';
import '../../Api/model/myaccapted_model.dart';
import '../../moh_project/post_moh/login_controller.dart';
import '../../services/requests_form.dart';
import '../home/requests.dart';

class AdminRequestsPage extends StatefulWidget {
   AdminRequestsPage({Key? key}) : super(key: key);

  final List<Myascapted> adminAcceptedRequestListEd = [];

  @override
  State<AdminRequestsPage> createState() => _AdminRequestsPageState();
}


AdminRequestsPage arp = AdminRequestsPage();

void acceptRequest(Myascapted request){
  arp.adminAcceptedRequestListEd.add(request);
  UserRequestsPage.requestList.remove(request);
}

void deleteRequest(RequestsStates request){
  UserRequestsPage.requestList.remove(request);
}



class _AdminRequestsPageState extends State<AdminRequestsPage> {




  List<Myascapted> ulist = [];
  List<Myascapted> userLists = [];
  List<Myascapted> adminAcceptedRequestListEds = [];
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
      Uri.parse('http://192.168.56.1:8000/api/Admin/Reservation'),
      headers: {

        'Authorization': 'Bearer $t'
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
/*
  Future<List<Myascapted>> mypendingresrrvations() async {
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
      List<Myascapted> list = parseAgents(response.body);
      print("sdasdasdasdsad$list");
      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }
  */

  @override
  void initState() {
    arp.  adminAcceptedRequestListEd.clear();
    UserRequestsPage.requestList.clear();
    super.initState();
    fetchData().then((subjectFromServer) {
      setState(() {
        print("the u list issss : $ulist");
        ulist = subjectFromServer;
        userLists = ulist;
        print("fsfsdfdsfdsf${userLists[0].gateName}");

        for(int i=0;i<userLists.length;i++)
        {
if(userLists[i].isAccepted==0) {
  UserRequestsPage.requestList.add(userLists[i]);
}
else
  {
    arp.  adminAcceptedRequestListEd.add(userLists[i]);
  }
        }
      });
    });
/*
    mypendingresrrvations().then((subjectFromServer) {
      setState(() {

        pending = subjectFromServer;
        listpending = pending;
        print("the pending list is $listpending");
      });
    });

 */
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
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.02,
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
                                                  Text(
                                                    val.userName,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
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
                                                    '${val.createdAt}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  Text(
                                                    "start : ${val.startTime
                                                       }",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  Text(
                                                    "end : ${val.endTime}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 21,
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
                                              Row(
                                                children: <Widget>[
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {

                                                        Acc_dec.Accept_reservation(val.id);

                                                      //  acceptRequest(val);
                                                      });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size(40, 20),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 3.0,
                                                        horizontal:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.05,
                                                      ),
                                                      primary:
                                                          const Color.fromARGB(
                                                              255, 10, 150, 10),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      elevation: 15.0,
                                                    ),
                                                    child: const Text(
                                                      "Accept",
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.05,
                                                  ),

                                                  //رفض حجز
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                //        deleteRequest(val);
                                                        Acc_dec.delete_reservation(val.id);
                                                      });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size(40, 20),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 3.0,
                                                        horizontal:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.05,
                                                      ),
                                                      primary:
                                                          const Color.fromARGB(
                                                              255, 150, 10, 10),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      //هاد ال container كان مشان ال staffs
                                      // كونو لغاه مؤقتا عملت كلشي يتعلق فيه
                                      // تعليقات لانو احتمال يطلبو بعدين

                                      // Container(
                                      //   alignment: Alignment.center,
                                      //   height: 90,
                                      //   width:
                                      //   MediaQuery.of(context).size.width *
                                      //       0.7,
                                      //   decoration: BoxDecoration(
                                      //     border: Border.all(
                                      //         width: 2, color: Colors.blue),
                                      //   ),
                                      //   child: ListView(
                                      //     padding: const EdgeInsets.only(
                                      //       top: 1,
                                      //       left: 30,
                                      //     ),
                                      //     children: [
                                      //       ...val.choosedStaffs.map((staff) {
                                      //         return Text(
                                      //           staff,
                                      //           style: const TextStyle(
                                      //               fontSize: 22,
                                      //               color: Colors.white),
                                      //         );
                                      //       }).toList(),
                                      //     ],
                                      //   ),
                                      // ),

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
                                const Text(
                                  "Accepted",
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Color.fromARGB(255, 230, 84, 15),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.02,
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
                                              Column(
                                                children: <Widget>[
                                                  // ignore: prefer_const_constructors
                                                  Text(
                                                    val.userName,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    //هون في تعديل

                                                    val.serviceName,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${val.createdAt}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  Text(
                                                    "start : ${val.startTime
                                                        }",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  Text(
                                                    "end : ${val.endTime
                                                       }",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   " for ${val.hoursDuration}"
                                                  //       " hour/s and "
                                                  //       "${val.minuteDuration} "
                                                  //       "minute/s",
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

                                      //هاد ال container كان مشان ال staffs
                                      // كونو لغاه مؤقتا عملت كلشي يتعلق فيه
                                      // تعليقات لانو احتمال يطلبو بعدين

                                      // Container(
                                      //   alignment: Alignment.center,
                                      //   height: 90,
                                      //   width:
                                      //   MediaQuery.of(context).size.width *
                                      //       0.7,
                                      //   decoration: BoxDecoration(
                                      //     border: Border.all(
                                      //         width: 2, color: Colors.blue),
                                      //   ),
                                      //   child: ListView(
                                      //     padding: const EdgeInsets.only(
                                      //       top: 1,
                                      //       left: 30,
                                      //     ),
                                      //     children: [
                                      //       ...val.choosedStaffs.map((staff) {
                                      //         return Text(
                                      //           staff,
                                      //           style: const TextStyle(
                                      //               fontSize: 22,
                                      //               color: Colors.white),
                                      //         );
                                      //       }).toList(),
                                      //     ],
                                      //   ),
                                      // ),

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
