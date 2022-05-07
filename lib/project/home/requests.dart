import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/model/my_reservations_model.dart';
import 'package:project_mohammad/services/requests_statue.dart';
import 'package:http/http.dart' as http;

import '../admin/admin_requests_page.dart';
import '../projects_page.dart';

int val = 0;
class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(admin){
      return AdminRequestsPage();
    }
    else {
      return const UserRequestsPage();
    }
  }
}

class UserRequestsPage extends StatefulWidget {


  static List<RequestsStates> requestList = [];

  const UserRequestsPage({Key? key}) : super(key: key);

  @override
  State<UserRequestsPage> createState() => _UserRequestsPageState();
}

class _UserRequestsPageState extends State<UserRequestsPage> {

  void initState() {
    super.initState();
    fetchData().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
         print("fsfsdfdsfdsf${userLists}");
      });
    });
  }

  List<MyReservations> ulist = [];
  List<MyReservations> userLists = [];
  @override
  static List<MyReservations> parseAgents(String responseBody) {
    print("sdknkjsdngjnd");
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MyReservations>((json) => MyReservations.fromJson(json)).toList();
  }

  Future<List<MyReservations>> fetchData() async {
    final response = await http
        .get(Uri.parse('http://192.168.56.1:8000/api/Reservation/MyReservation'),
      headers: {
        'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkM2Y0NTJhMzU2YTI4M2Y4ZGQ5MGQ3NzgxYjU0ZmIyMzE0ZDVkNjBlNmI0YTM0YmNmZWFlMTJkNWRkODc1MzMxZTI3ZWZhOGQzMTM3NzYiLCJpYXQiOjE2NTEyMzQ3NDIuOTkxMTM0LCJuYmYiOjE2NTEyMzQ3NDIuOTkxMTU0LCJleHAiOjE2ODI3NzA3NDIuOTc4MjAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ek1NrqJvLbvZvqQdDecQqUXgqKLef3-Ye7FG39soEesiHyk3DUlcGgIpYoHbHKCH6YBThrqb5PoDQx42DPqbY3cbK895PhKF-Js7gcy2_MEsqrNE8zVTa8yHMRbBNM2wYVaykkyvkz5acWwofqg7dGkXjvTDObilBGRQddOQEIdxwZ_9qIjtjn-_5pMPzhBChJbGddacGc0ryUFHF89MW107cJ4bsaDPhY_rSGTm9NBm3xilBHHFhwEWIcxevuw_bIs9ayuK6aYiaB3d6w-mLuJR9he8W8vTCbkVvqQOk5AnL_3hlKzQ86B8Ce5g-c01OMrkWsIuADFbVv-QgysQGy1zn_kyUwuYmJLiGKYcDtndcW-0ZpJXn-io0UyGdwYFahaofHH7xD_DyW_9kleOGN0BIjaV4GhhMLskb7TFAs2CquLn3E8mCuxKx7MQgWRL-GNL1QHMWuyFezjPWJnTCXJlv-fJQrKYAlwWTsN1UoTchzyolpPEeAEo5AiyH6WQgOyd2ZxaKHikBBu8vKtEE-zONIronEQWJRmauccYKjlpNW3CHoY63rDt2nnskC9FcI3OHX3p_3y8cy9l6wMab8aUBrXwRnebrSA-jAuv6jvHfakf_CelUcB1HnEFIIss5aXxlzYtoyQNUbaOPtW_xer26mZYC1uHcvMynzScejw'
      },
    );
    if (response.statusCode == 200) {


      final List parsedList = json.decode(response.body);
      List<MyReservations> list = parsedList.map((val) =>  MyReservations.fromJson(val)).toList();
    //  print("${response.body}");json.decode(response.body);
    //  List<MyReservations> list = parseAgents(response.body);
      print("sdasdasdasdsad${list}");
      return list;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
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
                                                  Text(
                                                    val.serviceTitle,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    val.serviceDate,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  Text(
                                                    val.serviceTime
                                                        .format(context),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                    ),
                                                  ),
                                                  Text(
                                                    " for ${val.hoursDuration}"
                                                    " hour/s and "
                                                    "${val.minuteDuration} "
                                                    "minute/s",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 21,
                                                    ),
                                                  ),
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
                                      //هاد ال container كان مشان ال staffs
                                      // كونو لغاه مؤقتا عملت كلشي يتعلق فيه
                                      // تعليقات لانو احتمال يطلبو بعدين


                                      // Container(
                                      //   alignment: Alignment.center,
                                      //   height: 90,
                                      //   width:
                                      //       MediaQuery.of(context).size.width *
                                      //           0.7,
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

