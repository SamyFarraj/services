import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/Api/model/name_service.dart';
import '/components/dash_board.dart';
import '/project/user/service_info_input.dart';
import '/services/choices.dart';
import '../../main.dart';
import '../constant.dart';

class ServiceEditionS extends StatefulWidget {
  const ServiceEditionS({Key? key}) : super(key: key);

  @override
  _ServiceEditionState createState() => _ServiceEditionState();
}

class _ServiceEditionState extends State<ServiceEditionS> {
  Future<String> Block_Service(int id) async {
    final response = await http.get(
      // Uri.parse('http://192.168.35.1:8000/api/Admin/BlockServices/${id}'),
      Uri.parse('${baseUrl}/api/Admin/BlockServices/${id}'),
      headers: {'Authorization': 'Bearer $userToken'},
    );
    if (response.statusCode == 200) {
      print("response status 200");
      return jsonDecode(response.body);
    } else {
      return "Error code is ${response.statusCode}";
    }
  }

  List<String> gatesEdition = [];

  List<String> serviceWoodWard = [];
  List<String> serviceFarmer = [];
  List<String> bothStreet = [];
  List<String> bothStreetID = [];

  String selectedService = 'Select Service';
  String? selectedStreet = "FARMER";

  late int theId;

  Future<ListService> fetchAlbum() async {
    //   gatesEdition.add('');
    print('here');
    final response = await http.get(Uri.parse('${baseUrl}/api/services'),
        headers: {'Authorization': 'Bearer $userToken'}
        // snapshot.data!.services.woodWard[1].street
        );
    print("the response base ${response.statusCode}");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ListService.fromJson(jsonDecode(response.body));
    } else {
      //    print("WoodWard ${snapshot.data!.services.woodWard[1].street}");

      throw Exception('Failed to load album');
    }
  }

  late Future<ListService> date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = fetchAlbum();
    print("processDone");
    //gatesEdition.clear();
  }

//int i=0;
  @override
  Widget build(BuildContext context) {
    // print('the is is${i++}');
    // String selectedService = 'Select Service';
    // String? selectedStreet = "Select Street";
    return Scaffold(
      drawer: const DashBoard(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Select Street D",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(150, 0, 0, 65),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       if (admin) {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (_) => const AdminControlPanel(),
        //           ),
        //         );
        //       } else {
        //         snackBar(
        //           context,
        //           "This Feature only for Admins",
        //           const Color.fromARGB(255, 150, 10, 10),
        //         );
        //       }
        //     },
        //     icon: const Icon(Icons.view_headline_sharp),
        //   ),
        // ],
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
              color: const Color.fromARGB(150, 60, 60, 80),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                Image.asset(
                  "asset/images/logo.png",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.095,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.716,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(180, 0, 0, 65),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: SingleChildScrollView(
                        child: FutureBuilder<ListService>(
                      future: date,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          //  gatesEdition.clear();
                          serviceWoodWard.clear();
                          serviceFarmer.clear();
                          bothStreet.clear();
                          print("step one ");
                          bothStreet.add('Select Service');
                          print("service select done");
                          // gatesEdition.clear();
                          //gatesEdition.add('select service');
                          /*
                          if (snapshot.data!.services.woodward.length == 0) {
                            serviceWoodWard.add('no item');
                          }
                        */
                          for (int i = 0;
                              i < snapshot.data!.services.woodward.length;
                              i++) {
                            print("there is no item ");

                            serviceWoodWard
                                .add(snapshot.data!.services.woodward[i].name);
                          }
                          print(serviceWoodWard);

                          for (int i = 0;
                              i < snapshot.data!.services.bothStreet.length;
                              i++) {
                            print("there is no item ");

                            bothStreet.add(
                                snapshot.data!.services.bothStreet[i].name);
                            bothStreetID.add(snapshot
                                .data!.services.bothStreet[i].id
                                .toString());
                          }
                          /*
                          if (snapshot.data!.services.farmer.length == 0) {
                            serviceFarmer.add('no item');
                          }
                        */
                          print("service both street");

                          for (int i = 0;
                              i < snapshot.data!.services.farmer.length;
                              i++) {
                            serviceFarmer
                                .add(snapshot.data!.services.farmer[i].name);
                          }
                          return Column(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 3.7,
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  // value: selectedStreet,
                                  hint: Text("Select Service"),
                                  items: selectStreet
                                      .map(
                                        (street) => DropdownMenuItem<String>(
                                          value: street.title,
                                          child: Text(
                                            street.title,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (street) => setState(
                                    () {
                                      selectedStreet = street;
                                      print(
                                          "the selected street $selectedStreet");
                                      //111111

                                      if (selectedStreet == 'FARMER') {
                                        if (serviceFarmer.length == 0) {
                                          // serviceFarmer.add('');
                                          gatesEdition =
                                              List.from(serviceFarmer);
                                          //    servicesList.add('select services');

                                        } else {
                                          // serviceFarmer.add('');
                                          gatesEdition =
                                              List.from(serviceFarmer);
                                          print(
                                              'the farmer is ${gatesEdition}');
                                          //    servicesList.add('select services');
                                          selectedService = gatesEdition[0];
                                        }
                                      }

                                      if (selectedStreet == 'WOODWARD') {
                                        if (serviceWoodWard.length == 0) {
                                          // serviceFarmer.add('');
                                          gatesEdition =
                                              List.from(serviceWoodWard);
                                          //    servicesList.add('select services');

                                        } else {
                                          gatesEdition =
                                              List.from(serviceWoodWard);
                                          //    servicesList.add('select services');
                                          selectedService = gatesEdition[0];
                                          print(selectedService +
                                              "selected Services printing");
                                        }
                                      }
                                      // servicesList.clear();
                                      //gatesEdition.clear();
                                      print("gates Ed ${gatesEdition}");
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
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
                                  value: selectedService,
                                  //2222222
                                  items: gatesEdition
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
                                  onChanged: (service) => setState(() {
                                    selectedService = service!;
                                    print("both street :  $bothStreet");
                                    print('the both street${bothStreet}');
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => ServiceInfoInputNewEd(
                                          gateName: selectedService,
                                          both: bothStreet,
                                          servicesList: snapshot
                                              .data!.services.bothStreet,
                                          bothId: bothStreetID,
                                        ),
                                      ),
                                      //  gatesEdition.clear();
                                    );
                                    // gatesEdition.clear();
                                    gatesEdition.clear();
                                  }),
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ))
                    // ListView(
                    //   children: selectStreet
                    //       .map(
                    //         (tile) => BasicTileWidget(
                    //       tile: tile,
                    //     ),
                    //   )
                    //       .toList(),
                    // ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
