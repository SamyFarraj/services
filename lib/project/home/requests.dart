import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


import '/Api/controller/User/work/Services_controller.dart';
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
  static List<Myascapted> acceptedRequestList = [];

  const UserRequestsPage({Key? key}) : super(key: key);

  @override
  State<UserRequestsPage> createState() => _UserRequestsPageState();
}

class _UserRequestsPageState extends State<UserRequestsPage> {


  List<Myascapted> ulist = [];
  List<Myascapted> userLists = [];

  @override
  static List<Myascapted> parseAgents(String responseBody) {
    print("ParsAgentSuc");
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
        'Authorization':'Bearer   eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDQ5ZWRjODRiMWYzYzAzZmUzMjg4NTY0NDQwY2JjYmE0ZmIxY2JkNDBjYjk0ZThmYjY1OTYzZjcyOTA4MDAwM2YyMzczNzgxM2JiYzNkY2MiLCJpYXQiOjE2NTY5NTkxNjkuOTU5NDI4LCJuYmYiOjE2NTY5NTkxNjkuOTU5NDU3LCJleHAiOjE2ODg0OTUxNjkuNzY4MTM0LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.GTXRTTYJmuUSVl3nvm8RB19bYrCllhsLev5M4vpbOekT5waNGue4jO5n8mdkKyhQrw83uzr5PFFVZVPFqwtYtaCixN5uQPWw6pGtNPLu2MPucYL2hUZrl2Q_pu6atlFqHQ4zwIVEX-6Nf-OXdkMYEpL4bVcdgyumJMiMI_cl4T2sL-0WRCealvlY_uckcvomIsUFWzL8if1kLv2rxPt9xei0D6_-ciE0trrgmI7fLZ1DT6Nnb78VzEiSFOkYo4NuuHXmdPtjlIQ6c7sCSlax5-Sd9qX2mRDoTVlsXg75nw4lHzdhRpvg_wWYWsBPjgV2qE40y2Vhzl7TXtCc9gjEFxABrJ_QbWTJAaX5bRgXl7cW4f-laayYw14jzVtNwNz9Yuv6AGlwWQxBXKGckpluzO14zbc8XS_Bf3lrLxbx1L4mjbyI8tb0Ct6GrBG2dcGJ3mdcVwIBBhfSeCXoxUz4ZN-4Q9tMD0cacReXH3nlXbNa6m1_e6tVVUA2E7UUPExdECppV5H4T9sGfO3c_M8_jXTFPAgiNIynoSY7H1GNoEJ5i0O0Dhpa5384Fwc_fJuJHDNsGT4d-5K528u0NH9O1HZsRdSvaprV04l2mDADg_tF433CNeHMH7FMqEPqsj8MD8RyAw7UJY316bFVSgpw1hzsgE7l81sg0dn8VCxjvb8'
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
        'Authorization':'Bearer   eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDQ5ZWRjODRiMWYzYzAzZmUzMjg4NTY0NDQwY2JjYmE0ZmIxY2JkNDBjYjk0ZThmYjY1OTYzZjcyOTA4MDAwM2YyMzczNzgxM2JiYzNkY2MiLCJpYXQiOjE2NTY5NTkxNjkuOTU5NDI4LCJuYmYiOjE2NTY5NTkxNjkuOTU5NDU3LCJleHAiOjE2ODg0OTUxNjkuNzY4MTM0LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.GTXRTTYJmuUSVl3nvm8RB19bYrCllhsLev5M4vpbOekT5waNGue4jO5n8mdkKyhQrw83uzr5PFFVZVPFqwtYtaCixN5uQPWw6pGtNPLu2MPucYL2hUZrl2Q_pu6atlFqHQ4zwIVEX-6Nf-OXdkMYEpL4bVcdgyumJMiMI_cl4T2sL-0WRCealvlY_uckcvomIsUFWzL8if1kLv2rxPt9xei0D6_-ciE0trrgmI7fLZ1DT6Nnb78VzEiSFOkYo4NuuHXmdPtjlIQ6c7sCSlax5-Sd9qX2mRDoTVlsXg75nw4lHzdhRpvg_wWYWsBPjgV2qE40y2Vhzl7TXtCc9gjEFxABrJ_QbWTJAaX5bRgXl7cW4f-laayYw14jzVtNwNz9Yuv6AGlwWQxBXKGckpluzO14zbc8XS_Bf3lrLxbx1L4mjbyI8tb0Ct6GrBG2dcGJ3mdcVwIBBhfSeCXoxUz4ZN-4Q9tMD0cacReXH3nlXbNa6m1_e6tVVUA2E7UUPExdECppV5H4T9sGfO3c_M8_jXTFPAgiNIynoSY7H1GNoEJ5i0O0Dhpa5384Fwc_fJuJHDNsGT4d-5K528u0NH9O1HZsRdSvaprV04l2mDADg_tF433CNeHMH7FMqEPqsj8MD8RyAw7UJY316bFVSgpw1hzsgE7l81sg0dn8VCxjvb8'
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
       // print("fsfsdfdsfdsf${userLists[0].gateName}");

        for(int i=0;i<userLists.length;i++)
          {

            UserRequestsPage.requestList.add(userLists[i]);
            print('${ UserRequestsPage.requestList}');
          }
      });
    });

    mypendingresrrvations().then((subjectFromServer) {
      setState(() {

        pending = subjectFromServer;
        listpending = pending;
        print("the pending list is $listpending");
        for(int i=0;i<listpending.length;i++)
        {

          UserRequestsPage.requestList.add(listpending[i]);
        }
      });
    });
    print('the final list is ${UserRequestsPage.requestList}');
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
                                  ),
                                  ),
                                  child:
                                  ListView(
                                    children: <Widget>[
                                      ...UserRequestsPage.requestList.map((val) {
                                        print("the value is ${val.gateName}");
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
                                                          " start at ${DateFormat("yyyy-MM-dd").format(val.startTime)}",
                                                          style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 26,
                                                          ),
                                                        ),
                                                        Text(
                                                          "end at ${DateFormat("yyyy-MM-dd").format(val.endTime)}",
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
                                                    padding: const EdgeInsets.all(-5),
                                                    shadowColor: Colors.transparent,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      //حط تابع الحذف هون
                                                      Servicee.delete_reservation(val.id);
                                                      UserRequestsPage.requestList.remove(val);
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
                                ),
                                ),
                                child: ListView(
                                  children: <Widget>[
                                    ...UserRequestsPage.requestList.map((val) {
                                      print('the list is ${val.gateName}');
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
