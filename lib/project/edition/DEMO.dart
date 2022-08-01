import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/model/name_service.dart';
import 'package:http/http.dart' as http;
import 'package:project_mohammad/components/dash_board.dart';
import 'package:project_mohammad/project/home/service_info_input.dart';
import 'package:project_mohammad/services/choices.dart';

import '../constant.dart';
String tokenuser='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODJkMmFhZDhkNjBkMGIxMjAzYzhlZTY0NjA3NTcxZWEyNmM5NzNmYWUyNWE2MzI2MTIzYjNmNDVhNzgxYzBjM2VkZmM3NTNiOGUwOTg1OWUiLCJpYXQiOjE2NTY1NzQxMTQuMzQ0NDIyLCJuYmYiOjE2NTY1NzQxMTQuMzQ0NDI3LCJleHAiOjE2ODgxMTAxMTQuMzM2OTUyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.fZlWy8pszDPkcFTJ0BST2RmlNDKq3lmhoT-9ik5zMIN6Q4mg41TgEzoQNyPkO34_-zB9t3078c1UqHqTsolqZ5N6JiA1XlA36iEmj1Hs8dN04dozyb4cFzrG0HKhkLMAQlDBDbjsTOFh8rS4xVNouBDdyMaUtBfn2-zes9u8_Q0VD5he9cQCE9lp6I1TDxKr6fu0ur7DyH7NktDATwR75eUoPF9r8tFsBQzB0avaiulDD3lRuk9OkRti3GwDB1-A-J9zyTfzJ_Jri6rstgpGvL9LtXwTfIjohFla2sMke8lLEInuquMQe5DsUpRArSRtHo2kNeubPRlXtzc_Kjdux-L9SXwwGoc1jTz992iU2KOswhONsKcqCedyIQoFd8ehqQhjxuLUfXkPgCvi_1lFW-ZTmg4LOvsmlARHJmzJ-yDjm6v92gJUrLSZQld-udcAZhrar6OpoDcQXTXrrChXkwYZwiZyHR1QCNQtihjkFm8UJQ8Zvys3O2-3sE2qPwQQVkNOggafsc7N-TbXGp_hUJUN8FdaEwMChE3Bv96l1p7-djRN2LvGXAR1cN_V3pQMVms8lh17DrpuB-UjFVkK7ld2yfg_aE7hTbLHzW7IBYeXjTuG2StVRqER_DTmtSsykbdMwef3RMGN4ahfjn5XWMYfJlVWKuhTlcG9QQUbbMo';
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
  String selectedService = 'Select Service';
  String? selectedStreet = "FARMER";

  late int theid;

  Future<ListService> fetchAlbum() async {
 //   gatesEdition.add('');
print('here');
    final response = await http.get(Uri.parse('${base_Url}/api/services'), headers: {
      'Authorization':'Bearer $tokenuser'
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
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (_) => ServiceInformationInput(
                                        gateName: selectedService,
                                        both: bothstreet,
                                        listservice: snapshot
                                            .data!.services.bothStreet,
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


