import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '/Api/controller/Admin/add_new_admin_controller.dart';
import '/Api/model/show_admins_model.dart';
import '/project/constant.dart';
import '/services/choices.dart';
import '../../../Cubit/Admin Level Operation/admin_level_cubit.dart';
import '../../../components/snack_bar.dart';
import '../../../main.dart';

class RemoveAdmin extends StatefulWidget {
  const RemoveAdmin({Key? key}) : super(key: key);

  @override
  State<RemoveAdmin> createState() => _RemoveAdminState();
}

class _RemoveAdminState extends State<RemoveAdmin> {
  List<ShowAdmins> theUsersList = [];
  List<ShowAdmins> userLists = [];

  static List<ShowAdmins> parseAgents(String responseBody) {
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ShowAdmins>((json) => ShowAdmins.fromJson(json)).toList();
  }

  Future<List<ShowAdmins>> fetchData() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/Admin/ShowAllAdmins'),
      headers: {'Authorization': 'Bearer ${adminToken}'},
    );
    print('the statues is ${response.statusCode}');
    if (response.statusCode == 200) {
      // final List parsedList = json.decode(response.body);
      // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //  print("${response.body}");json.decode(response.body);
      List<ShowAdmins> list = parseAgents(response.body);
      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }


  List<String> usersList = [];

  @override
  void initState() {
    if (addAdminList.length > 0) {
      addAdminList.length = 1;
    }
    // addAdminList.clear();
    // addAdminList.add('select');
    super.initState();
    fetchData().then((subjectFromServer) {
      setState(() {
        theUsersList = subjectFromServer;
        userLists = theUsersList;

        //   addAdminList=List.from(userLists)
        for (int i = 0; i < userLists.length; i++) {
          print("hdfg");
          addAdminList.add(userLists[i].name);
        }
      });
    });
  }

  String? selectedAdmin = 'Select Admin';

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
            _backgroundImage(),
            //هاد لون فوق الخلفية مشات وضوح الكتابة
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
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _logoImage(),
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 6.0,
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  hint: Text(
                                    "Select Service",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  items: addAdminList
                                      .map(
                                        (service) => DropdownMenuItem<String>(
                                          value: service,
                                          child: Text(
                                            service,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (currentChoice) => setState(() {
                                    selectedAdmin = currentChoice!;
                                  }),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              // buttonOfManageServices(
                              //   context,
                              //   () {
                              //     checkAdminDelete(selectedAdmin!);
                              //   },
                              //   "Remove Admin",
                              //   const Color.fromARGB(255, 150, 10, 10),
                              // ),
                              ConditionalBuilder(
                                condition: state is RefreshLevelState ||
                                    state is AdminLevelInitial,
                                builder: (context) => ElevatedButton(
                                  onPressed: () {
                                    checkAdminDelete(selectedAdmin!);
                                    for (int i = 0; i < userLists.length; i++) {
                                      if (selectedAdmin == userLists[i].name) {
                                        AddNewAdminController.RemoveAdmin(
                                            userLists[i].id);
                                        break;
                                      }
                                    }

                                    // هون تابع حذف ادمن لازم ينحط
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(300, 60),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                    ),
                                    primary:
                                        const Color.fromARGB(255, 150, 10, 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15.0,
                                  ),
                                  child: const Text(
                                    "Remove Admin",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                fallback: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }

  AppBar _appBarContent() => AppBar(
        centerTitle: true,
        title: const Text(
          "Remove Admin",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontStyle: FontStyle.italic,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(180, 0, 0, 65),
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
    ],
  );



  bool checkAdminDelete(String selectedAdmin) {
    if (selectedAdmin == 'Select Admin') {
      TheSnackBar(context, "Please Select Admin",
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      TheSnackBar(context, "Admin Deleted Successfully",
          const Color.fromARGB(255, 15, 150, 10));
      return true;
    }
  }
}
