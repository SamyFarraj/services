import 'package:flutter/material.dart';
import 'package:project_mohammad/project/admin/add_new_admin.dart';
import 'package:project_mohammad/project/admin/remove_admin.dart';

import 'service_calender.dart';
import 'un_block_service.dart';
import 'block_service.dart';
import 'add_new_service.dart';
import 'delete_service.dart';

//هدول ال imports تبع ال staff
// import 'add_new_staff.dart';
// import 'delete_staff.dart';
//وهي لل add admin
// import 'add_new_admin.dart';

class AdminControlPanel extends StatefulWidget {
  const AdminControlPanel({Key? key}) : super(key: key);

  @override
  State<AdminControlPanel> createState() => _AdminControlPanelState();
}

class _AdminControlPanelState extends State<AdminControlPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Control Panel",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontStyle: FontStyle.italic,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(180, 0, 0, 65),
      ),
      body: Stack(
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
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.703,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: Color.fromARGB(180, 0, 0, 65),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          /*

                              هي كانت مسان ال staff
                               عملتها تعليق لانو لغاها
                               وتركتها لانو في احتمال
                               يطلبها ع ال Update

                           */

                          // Row(
                          //   children: <Widget>[
                          //     Container(
                          //       padding: const EdgeInsets.all(13),
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           Navigator.of(context).push(
                          //             MaterialPageRoute(
                          //               builder: (_) => const AddNewStaff(),
                          //             ),
                          //           );
                          //         },
                          //         style: ElevatedButton.styleFrom(
                          //           minimumSize: const Size(155, 155),
                          //           primary:
                          //           const Color.fromARGB(55, 100, 100, 255),
                          //           shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(30),
                          //           ),
                          //           elevation: 15.0,
                          //         ),
                          //         child: Column(
                          //           children: const <Widget>[
                          //             Text(
                          //               "Add",
                          //               style: TextStyle(
                          //                 fontSize: 24,
                          //                 color: Colors.white,
                          //               ),
                          //             ),
                          //             Text(
                          //               "Staff",
                          //               style: TextStyle(
                          //                 fontSize: 24,
                          //                 color: Colors.white,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       padding: const EdgeInsets.all(13),
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           Navigator.of(context).push(
                          //             MaterialPageRoute(
                          //               builder: (_) => const DeleteStaff(),
                          //             ),
                          //           );
                          //         },
                          //         style: ElevatedButton.styleFrom(
                          //           minimumSize: const Size(155, 155),
                          //           primary:
                          //           const Color.fromARGB(55, 100, 100, 255),
                          //           shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(30),
                          //           ),
                          //           elevation: 15.0,
                          //         ),
                          //         child: Column(
                          //           children: const <Widget>[
                          //             Text(
                          //               "Delete",
                          //               style: TextStyle(
                          //                 fontSize: 24,
                          //                 color: Colors.white,
                          //               ),
                          //             ),
                          //             Text(
                          //               "Staff",
                          //               style: TextStyle(
                          //                 fontSize: 24,
                          //                 color: Colors.white,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(13),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const AddNewService(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(155, 155),
                                    primary:
                                        const Color.fromARGB(55, 100, 100, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 15.0,
                                  ),
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Service",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(13),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const DeleteService(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(155, 155),
                                    primary:
                                        const Color.fromARGB(55, 100, 100, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 15.0,
                                  ),
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "Delete",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Service",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(13),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const BlockService(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(155, 155),
                                    primary:
                                    const Color.fromARGB(55, 100, 100, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 15.0,
                                  ),
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "Block",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Service",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(13),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const UnBlockService(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(155, 155),
                                    primary:
                                    const Color.fromARGB(55, 100, 100, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 15.0,
                                  ),
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "Un Block",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Service",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(13),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const AddNewAdmin(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(155, 155),
                                    primary:
                                    const Color.fromARGB(55, 100, 100, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 15.0,
                                  ),
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Admin",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(13),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const RemoveAdmin(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(155, 155),
                                    primary:
                                    const Color.fromARGB(55, 100, 100, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 15.0,
                                  ),
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "Remove",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Admin",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(13),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const ServiceCalender(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(155, 155),
                                    primary:
                                    const Color.fromARGB(55, 100, 100, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 15.0,
                                  ),
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "Service",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "calender",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              /*

                                    هي مشان ينقل ع واجهة add Admin
                                    هلا ما بدنا اياها
                                    لانو رح نضيفها ع التحديث

                               */
                              // Container(
                              //   padding: const EdgeInsets.all(13),
                              //   child: ElevatedButton(
                              //     onPressed: () {
                              //       Navigator.of(context).push(
                              //         MaterialPageRoute(
                              //           builder: (_) => const AddNewAdmin(),
                              //         ),
                              //       );
                              //     },
                              //     style: ElevatedButton.styleFrom(
                              //       minimumSize: const Size(155, 155),
                              //       primary:
                              //       const Color.fromARGB(55, 100, 100, 255),
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(30),
                              //       ),
                              //       elevation: 15.0,
                              //     ),
                              //     child: Column(
                              //       children: const <Widget>[
                              //         Text(
                              //           "Add",
                              //           style: TextStyle(
                              //             fontSize: 24,
                              //             color: Colors.white,
                              //           ),
                              //         ),
                              //         Text(
                              //           "Admin",
                              //           style: TextStyle(
                              //             fontSize: 24,
                              //             color: Colors.white,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
