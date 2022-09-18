import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_mohammad/project/user/service_info_input.dart';

import '../../Api/model/name_service.dart';
import '../../components/dash_board.dart';
import '../../main.dart';
import '../../services/choices.dart';
import '../constant.dart';

class ServiceEditionS extends StatefulWidget {
  const ServiceEditionS({Key? key}) : super(key: key);

  @override
  _ServiceEditionState createState() => _ServiceEditionState();
}

class _ServiceEditionState extends State<ServiceEditionS> {
  Future<String> Block_Service(int id) async {
    final response = await http.get(
      Uri.parse('${baseUrl}/api/Admin/BlockServices/${id}'),
      headers: {'Authorization': 'Bearer $userToken'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "Error code is ${response.statusCode}";
    }
  }

  Future<ListService> fetchAlbum() async {
    //   gatesEdition.add('');
    print('here');

    print("iam here");

    //   gatesEdition.add('');
    final response = await http.get(Uri.parse('${baseUrl}/api/services'),
        headers: {
          'Authorization': 'Bearer $userToken',
          'Accept': 'application/json'
        }
        // snapshot.data!.services.woodWard[1].street
        );
    print("the response base ${response.body}");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ListService.fromJson(jsonDecode(response.body));
    } else {
      //

      throw Exception('Failed to load album');
    }
  }

  List<String> gatesEdition = [];
  List<String> serviceWoodWard = [];
  List<String> serviceFarmer = [];
  List<String> bothStreet = [];
  List<String> bothStreetID = [];
  late Future<ListService> date;

  String selectedService = 'Select Service';
  String? selectedStreet = "FARMER";

  late int theId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = fetchAlbum();

    //gatesEdition.clear();
  }

//int i=0;
  @override
  Widget build(BuildContext context) {
    //
    // String selectedService = 'Select Service';
    // String? selectedStreet = "Select Street";
    return Scaffold(
      drawer: const DashBoard(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBarContent(),
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

                          bothStreet.add('Select Service');

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
                            serviceWoodWard
                                .add(snapshot.data!.services.woodward[i].name);
                          }

                          for (int i = 0;
                              i < snapshot.data!.services.bothStreet.length;
                              i++) {
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
                                  hint: Text(
                                    "Select Service",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.blue,
                                    ),
                                  ),
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
                                        }
                                      }
                                      // servicesList.clear();
                                      //gatesEdition.clear();
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
                                  hint: Text(
                                    "Select Service",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.blue,
                                    ),
                                  ),
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
                    ),
                  ),
                ),
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
    "Select Street",
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.deepOrange,
    ),
  );

}
