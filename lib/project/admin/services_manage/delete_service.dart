import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '/Api/model/name_service.dart';
import '/project/constant.dart';
import '../../../Cubit/Admin Level Operation/admin_level_cubit.dart';
import '../../../main.dart';

class DeleteService extends StatefulWidget {
  const DeleteService({Key? key}) : super(key: key);

  @override
  State<DeleteService> createState() => _DeleteServiceState();
}

class _DeleteServiceState extends State<DeleteService> {
  List<String> woodWardServices = [];
  List<String> farmerServices = [];
  List<String> bothStreetServices = [];

  Future<void> refresh() {
    return Future.delayed(
      Duration(seconds: 0),
    );
  }

  List<String> servicesList = [];

  String selectedService = 'Select Service';
  String? selectedStreet = "BothStreet";
  late int theId;

  Future<ListService> fetchAlbum() async {
    final response = await http.get(Uri.parse('${baseUrl}/api/Admin/services'),
        headers: {'Authorization': 'Bearer $adminToken'}
        // snapshot.data!.services.woodWard[1].street
        );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ListService.fromJson(jsonDecode(response.body));
    } else {
      //

      throw Exception('Failed to load album');
    }
  }

  late Future<ListService> date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Delete Service",
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
      body: Builder(builder: (context) {
        return Stack(
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

                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.704,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color.fromARGB(180, 0, 0, 65),
                    ),
                    child: BlocConsumer<AdminLevelCubit, AdminLevelState>(
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
                          child: FutureBuilder<ListService>(
                            future: date,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                woodWardServices.clear();
                                farmerServices.clear();
                                bothStreetServices.clear();

                                if (snapshot.data!.services.bothStreet.length ==
                                    0) {
                                  bothStreetServices.add('no item');
                                } else {
                                  for (int i = 0;
                                      i <
                                          snapshot
                                              .data!.services.bothStreet.length;
                                      i++) {
                                    bothStreetServices.add(snapshot
                                        .data!.services.bothStreet[i].name);
                                  }
                                }

                                if (snapshot.data!.services.woodward.length ==
                                    0) {
                                  woodWardServices.add('no item');
                                } else {
                                  for (int i = 0;
                                      i <
                                          snapshot
                                              .data!.services.woodward.length;
                                      i++) {
                                    woodWardServices.add(snapshot
                                        .data!.services.woodward[i].name);
                                  }
                                }
                                //

                                if (snapshot.data!.services.farmer.length ==
                                    0) {
                                  farmerServices.add('no item');
                                } else {
                                  for (int i = 0;
                                      i < snapshot.data!.services.farmer.length;
                                      i++) {
                                    farmerServices.add(
                                        snapshot.data!.services.farmer[i].name);
                                  }

                                  {}
                                }

                                //  servicesList = List.from(farmerServices);
                                //
                                //
                                servicesList = List.from(bothStreetServices);
                                return Column(children: <Widget>[
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 6.0,
                                            color: Colors.blue,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      hint: Text(
                                        "Select Service",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      items: servicesList
                                          .map(
                                            (service) =>
                                                DropdownMenuItem<String>(
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
                                      onChanged: (service) => setState(() {
                                        selectedService = service!;

                                        if (selectedStreet == 'WOODWARD')
                                          for (int i = 0;
                                              i <
                                                  snapshot.data!.services
                                                      .woodward.length;
                                              i++) {
                                            if (selectedService ==
                                                snapshot.data!.services
                                                    .woodward[i].name) {
                                              theId = snapshot.data!.services
                                                  .woodward[i].id;

                                              break;
                                            }
                                          }
                                        else if (selectedStreet == 'FARMER') {
                                          for (int i = 0;
                                              i <
                                                  snapshot.data!.services.farmer
                                                      .length;
                                              i++) {
                                            if (selectedService ==
                                                snapshot.data!.services
                                                    .farmer[i].name) {
                                              theId = snapshot
                                                  .data!.services.farmer[i].id;

                                              break;
                                            }
                                          }
                                        } else if (selectedStreet ==
                                            'BothStreet') {
                                          for (int i = 0;
                                              i <
                                                  snapshot.data!.services
                                                      .bothStreet.length;
                                              i++) {
                                            if (selectedService ==
                                                snapshot.data!.services
                                                    .bothStreet[i].name) {
                                              theId = snapshot.data!.services
                                                  .bothStreet[i].id;

                                              break;
                                            }
                                          }
                                        }
                                      }),
                                    ),
                                  ),

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                  // buttonOfManageServices(
                                  //   context,
                                  //   () {
                                  //      //  fetch();
                                  //      //fetchFinal();
                                  //      // FetchList();
                                  //      //
                                  //      checkServiceDelete(selectedService);
                                  //      //
                                  //    },
                                  //   "Delete Service",
                                  //   const Color.fromARGB(255, 150, 10, 10),
                                  // ),

                                  ConditionalBuilder(
                                      condition: state is RefreshLevelState ||
                                          state is AdminLevelInitial,
                                      builder: (context) => ElevatedButton(
                                            onPressed: () {
                                              //  fetch();
                                              //fetchFinal();
                                              // FetchList();
                                              //
                                              checkServiceDelete(
                                                  selectedService);
                                              cubit.deleteService(theId);
                                              //
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(300, 60),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.2,
                                              ),
                                              backgroundColor: const Color.fromARGB(
                                                  255, 150, 10, 10),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              elevation: 15.0,
                                            ),
                                            child: const Text(
                                              "Delete Service",
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                      fallback: (context) => Center(
                                            child: CircularProgressIndicator(),
                                          ))
                                ]);
                              } else if (snapshot.hasError) {
                                return Text(
                                  '${snapshot.error}',
                                  style: TextStyle(fontSize: 40),
                                );
                              }

                              // By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  bool checkServiceDelete(String selectedService) {
    if (selectedStreet == null) {
      snackBar(context, 'Please Select Street',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (selectedService == 'Select Service') {
      snackBar(context, "Please Select Service",
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      snackBar(context, "Service Deleted Successfully",
          const Color.fromARGB(255, 15, 150, 10));
      return true;
    }
  }

  void snackBar(
      BuildContext context, String errorMessage, Color snackBarColor) {
    final snackBar = SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.white,
        ),
      ),
      backgroundColor: snackBarColor,
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
