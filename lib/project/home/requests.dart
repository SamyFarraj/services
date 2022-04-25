import 'package:flutter/material.dart';
import 'package:project_mohammad/services/requests_statue.dart';

import '../projects_page.dart';

int val = 0;
class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(admin){
      return const AdminRequestsPage();
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
  @override
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

/*




        ////////////////////////////////////////////////////////
        \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        ////////////////////////////////////////////////////////
        \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                  ***      ADMIN REQUEST PAGE      ***
        ////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////
        \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        ////////////////////////////////////////////////////////




 */



class AdminRequestsPage extends StatefulWidget {
  static List<RequestsStates> requestList = [];

  const AdminRequestsPage({Key? key}) : super(key: key);

  @override
  State<AdminRequestsPage> createState() => _AdminRequestsPageState();
}

class _AdminRequestsPageState extends State<AdminRequestsPage> {
  @override
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
                                                  // ignore: prefer_const_constructors
                                                  Text(
                                                    "User1",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
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
