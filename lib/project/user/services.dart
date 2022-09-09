import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/Api/model/name_service.dart';
import '/components/dash_board.dart';
import '/project/user/service_info_input.dart';
import '/services/choices.dart';
import '../../main.dart';
import '../constant.dart';
<<<<<<< HEAD
String tokenUser='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMThiOTJmYzBlNWE0YThkZjQ0NDM3NmRhODI0M2Q4NTc5ZDY4YmZkYzQ5MGFmN2Q2MDU4MWZlY2Y3ZjllYmVjNjRmNjFjYzExNTI2MTU2YzAiLCJpYXQiOjE2NjI2NTg3MzguNDA5MTIxLCJuYmYiOjE2NjI2NTg3MzguNDA5MTMzLCJleHAiOjE2OTQxOTQ3MzguMzgyMTQsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.JglZtVeEXuCX-y9lyoG101CDevE-s5EevM2wCDP7uDI-DLsPYrxGsK5noIei3o0xWi8bz0JjX-VVDDaAsxdmF7jhT3nBuLqy-Hqqq5Tagx_ritDwcsIuSecFirsTkoF3YHUPz5j2Z6_ZKmNfufp65gCDsKyYy_c_OBfAXnHTIsKU1n1LHseDxipD1hxOYp5RG8b23LRq2GdsGXIPh-Q7H_yfCx3H7fAYiye60D01dt_rVBD2DcneojvOqCOVGNI99syPHjz01dYFpLTpAgtrpT4Jgxi7x_bcDUVEsIWqJHSaxVWai8IGNKllJol7hRmyECz5bbZtsPdcilXygA_kpTJeziLUr8bIDuMI_q3-CbVzXnkOAyTAl5ChllVhKkrrsFdUtSe7mvud14XholKMA9-hwjznZRYvLD_e8yH-0pQ_6tVxgUZ_PAPjCtQr6-7UCUbzEEICLZ7-NqEi6WO-NLSxNqE_XULuTnmRYGVtzCnrQViqDVWl9b5AolKWWLm8rcSa83uDddOnKs6HZwY1RAqH5V1zZ63q0wU_yhW7UI7_Zpjjd-90EjYUFicg5jj-mSaMcvlQpicISIvimt8veMJXoLd_PuY_tG5x3cPZWPpteCE2OzYwM0PNnXN7xfNB8_sLSgZsE8auq3BcvU0JtNuY7vL6Q1F2KfLj_ofuHLE';
=======
>>>>>>> 7af0289f19b2ab59e21f79499360d49b316fc19d

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
<<<<<<< HEAD
 //   gatesEdition.add('');
print('here');
    final response = await http.get(Uri.parse('${base_Url}/api/services'),
        headers: {
      'Authorization':'Bearer ${tokenUser}'
      ,
      'Accept':'application/json'
        }
            // snapshot.data!.services.woodWard[1].street
            );
print("iam here");

print("the response base ${response.body}");
=======
    //   gatesEdition.add('');

    final response = await http.get(Uri.parse('${baseUrl}/api/services'),
        headers: {'Authorization': 'Bearer $userToken'}
        // snapshot.data!.services.woodWard[1].street
        );

>>>>>>> 7af0289f19b2ab59e21f79499360d49b316fc19d
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Select Street",
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
