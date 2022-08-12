import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/model/name_service.dart';
import 'package:http/http.dart' as http;
import 'package:project_mohammad/components/dash_board.dart';
import 'package:project_mohammad/project/edition/service_info_new_ed.dart';
import 'package:project_mohammad/project/home/service_info_input.dart';
import 'package:project_mohammad/services/choices.dart';

import '../constant.dart';
String tokenuser='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTRmYzllODI0NWZmYzE4MzBkOWZiMzcxOGIwYjgyOTllZjk5M2ViYjY5MzY0YWU2Y2E1Njk1OGQ5NzQ1NmVmY2ExMDU5NTM3OWMzNWE5YzUiLCJpYXQiOjE2NTk0NDIwNTYuNjIzNDQ5LCJuYmYiOjE2NTk0NDIwNTYuNjIzNDUzLCJleHAiOjE2OTA5NzgwNTYuNTA2MDcxLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.eBNtZtv__rK4pcGeLCPF5DXjhA_p4WAH5KU7CgKwXAJpYZKWfm-VWCpuEEdF-JtJMM_j_8-jOqDFfelXD4-OtOPrTpahJfEbujBA0t9N-Nrk2454NYvDfsoDEsUeIM3ElXpCFdv9wN9TN0rgz5cZxYgaJ7c00GmE3PtXBdxkoUA8hTcrcIN33cbmV0vUybGx6WgA5PcAKr912jZ4lQqvCRF59e9vpO1io0m7phgpJj-kOECnpgWzWQShUn34Cdf31Y9vT1JQioc3SKcHOnYjqDp7h-G-L6Nzx1CB7E_kddA5yhmUHpaQFprcPuUsEWRlfpzkncYszg5fQbUlxA6_gX6rAjgFtXubXck60tnhB19zo5nt9He9DIaNnzUoU9SASFrh0e6xQ1rYaf-EUSy_WFPOyEZGOL3SyaMi6Tc0WHDZQw4IInL6mt3_hUuExTqu0rqjcV9nMoZDxMerdIHWjZvc8r-_oy2kHEGaAK7l2pX6SbYmO5ead8hxMisWODmjOSBFRRym-17ueDadXdsUzWkS9kSS1nqVWzRx_ozeVd-HttoNsR15huuZHT_4CiqMvsH0lFb0shw5wisKPiHu6WHvSF_XtbCUVPjd__NlkK3cJnZsk5vcd7f7_F1m13sHOB0ulHsuocZoHkjs9ugvOZdUy130oI0yQ3q7_6Z8Bto';
class ServiceEditionS extends StatefulWidget {
  const ServiceEditionS({Key? key}) : super(key: key);

  @override
  _ServiceEditionState createState() => _ServiceEditionState();
}

class _ServiceEditionState extends State<ServiceEditionS> {
  Future<String> Block_Service(int id) async {
    final response = await http.get(
      // Uri.parse('http://192.168.35.1:8000/api/Admin/BlockServices/${id}'),
      Uri.parse('${base_Url}/api/Admin/BlockServices/${id}'),
      headers: {
        'Authorization':'Bearer $tokenuser'
      },
    );
    if (response.statusCode == 200) {
      print("yesssssssssss");
      return jsonDecode(response.body);
    } else {
      return "Error code is ${response.statusCode}";
    }
  }
  List<String> gatesEdition=[];

  List<String> servicewoodward = [];
  List<String> servicefarmer = [];
  List<String> bothstreet = [];
  List<String> bothstreetID = [];

  String selectedService = 'Select Service';
  String? selectedStreet = "FARMER";

  late int theid;

  Future<ListService> fetchAlbum() async {
 //   gatesEdition.add('');
print('here');
    final response = await http.get(Uri.parse('${base_Url}/api/services'), headers: {
      'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTRmYzllODI0NWZmYzE4MzBkOWZiMzcxOGIwYjgyOTllZjk5M2ViYjY5MzY0YWU2Y2E1Njk1OGQ5NzQ1NmVmY2ExMDU5NTM3OWMzNWE5YzUiLCJpYXQiOjE2NTk0NDIwNTYuNjIzNDQ5LCJuYmYiOjE2NTk0NDIwNTYuNjIzNDUzLCJleHAiOjE2OTA5NzgwNTYuNTA2MDcxLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.eBNtZtv__rK4pcGeLCPF5DXjhA_p4WAH5KU7CgKwXAJpYZKWfm-VWCpuEEdF-JtJMM_j_8-jOqDFfelXD4-OtOPrTpahJfEbujBA0t9N-Nrk2454NYvDfsoDEsUeIM3ElXpCFdv9wN9TN0rgz5cZxYgaJ7c00GmE3PtXBdxkoUA8hTcrcIN33cbmV0vUybGx6WgA5PcAKr912jZ4lQqvCRF59e9vpO1io0m7phgpJj-kOECnpgWzWQShUn34Cdf31Y9vT1JQioc3SKcHOnYjqDp7h-G-L6Nzx1CB7E_kddA5yhmUHpaQFprcPuUsEWRlfpzkncYszg5fQbUlxA6_gX6rAjgFtXubXck60tnhB19zo5nt9He9DIaNnzUoU9SASFrh0e6xQ1rYaf-EUSy_WFPOyEZGOL3SyaMi6Tc0WHDZQw4IInL6mt3_hUuExTqu0rqjcV9nMoZDxMerdIHWjZvc8r-_oy2kHEGaAK7l2pX6SbYmO5ead8hxMisWODmjOSBFRRym-17ueDadXdsUzWkS9kSS1nqVWzRx_ozeVd-HttoNsR15huuZHT_4CiqMvsH0lFb0shw5wisKPiHu6WHvSF_XtbCUVPjd__NlkK3cJnZsk5vcd7f7_F1m13sHOB0ulHsuocZoHkjs9ugvOZdUy130oI0yQ3q7_6Z8Bto'
        }
            // snapshot.data!.services.woodWard[1].street
            );
    print("the respsmss base ${response.statusCode}");
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
                        servicewoodward.clear();
                       servicefarmer.clear();
                        bothstreet.clear();
                        print("step one ");
                        bothstreet.add('Select Service');
                        print("dkphhhhh");
                        // gatesEdition.clear();
                        //gatesEdition.add('select service');
                        /*
                          if (snapshot.data!.services.woodward.length == 0) {
                            servicewoodward.add('no item');
                          }
                        */
                          for (int i = 0;
                              i < snapshot.data!.services.woodward.length;
                              i++) {
                            print("there is no item ");

                            servicewoodward.add(snapshot.data!.services.woodward[i].name);
                          }
                          print(servicewoodward);


                        for (int i = 0;
                            i < snapshot.data!.services.bothStreet.length;
                            i++) {
                          print("there is no item ");

                          bothstreet.add(
                              snapshot.data!.services.bothStreet[i].name);
                          bothstreetID.add(
                              snapshot.data!.services.bothStreet[i].id.toString());
                        }
                        /*
                          if (snapshot.data!.services.farmer.length == 0) {
                            servicefarmer.add('no item');
                          }
                        */
                          print("dkphhhhh");

                          for (int i = 0; i < snapshot.data!.services.farmer.length; i++)
                          {servicefarmer.add(snapshot.data!.services.farmer[i].name);}
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
                                hint:Text("Select Service"),
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
                                    print("the select steree $selectedStreet");
                                    //111111

                                    if (selectedStreet == 'FARMER') {
                                      if (servicefarmer.length == 0) {
                                        // servicefarmer.add('');
                                        gatesEdition =
                                            List.from(servicefarmer);
                                        //    servicesList.add('selecet serveics');

                                      }
                                      else {
                                        // servicefarmer.add('');
                                        gatesEdition =
                                            List.from(servicefarmer);
                                        print(
                                            'the farmeeer is ${gatesEdition}');
                                        //    servicesList.add('selecet serveics');
                                        selectedService = gatesEdition[0];
                                      }
                                    }

                                    if (selectedStreet == 'WOODWARD') {
                                      if (servicewoodward.length == 0) {
                                        // servicefarmer.add('');
                                        gatesEdition =
                                            List.from(servicewoodward);
                                        //    servicesList.add('selecet serveics');

                                      }
                                      else {
                                        gatesEdition =
                                            List.from(servicewoodward);
                                        //    servicesList.add('selecet serveics');
                                        selectedService = gatesEdition[0];
                                        print(selectedService + "sasasa");
                                      }
                                    }
                                    // servicesList.clear();
                                    //gatesEdition.clear();
                                    print("kdfsjkjfkl${gatesEdition}");
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
                                  print("thedasdas $bothstreet");
                                  print('the both street${bothstreet}');
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          ServiceInfoInputNewEd(
                                        gateName: selectedService,
                                        both: bothstreet,
                                        listservice: snapshot.data!.services.bothStreet,
                                            bothId:bothstreetID,

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


