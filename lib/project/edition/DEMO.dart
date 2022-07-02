import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/model/name_service.dart';
import 'package:http/http.dart' as http;
import 'package:project_mohammad/components/dash_board.dart';
import 'package:project_mohammad/project/home/service_info_input.dart';
import 'package:project_mohammad/services/choices.dart';

import '../constant.dart';

class ServiceEditionS extends StatefulWidget {
  const ServiceEditionS({Key? key}) : super(key: key);

  @override
  _ServiceEditionState createState() => _ServiceEditionState();
}

class _ServiceEditionState extends State<ServiceEditionS> {
  Future<String> Block_Service(int id) async {
    final response = await http.get(
      Uri.parse('${base_Url}/api/Admin/BlockServices/${id}'),
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkM2Y0NTJhMzU2YTI4M2Y4ZGQ5MGQ3NzgxYjU0ZmIyMzE0ZDVkNjBlNmI0YTM0YmNmZWFlMTJkNWRkODc1MzMxZTI3ZWZhOGQzMTM3NzYiLCJpYXQiOjE2NTEyMzQ3NDIuOTkxMTM0LCJuYmYiOjE2NTEyMzQ3NDIuOTkxMTU0LCJleHAiOjE2ODI3NzA3NDIuOTc4MjAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ek1NrqJvLbvZvqQdDecQqUXgqKLef3-Ye7FG39soEesiHyk3DUlcGgIpYoHbHKCH6YBThrqb5PoDQx42DPqbY3cbK895PhKF-Js7gcy2_MEsqrNE8zVTa8yHMRbBNM2wYVaykkyvkz5acWwofqg7dGkXjvTDObilBGRQddOQEIdxwZ_9qIjtjn-_5pMPzhBChJbGddacGc0ryUFHF89MW107cJ4bsaDPhY_rSGTm9NBm3xilBHHFhwEWIcxevuw_bIs9ayuK6aYiaB3d6w-mLuJR9he8W8vTCbkVvqQOk5AnL_3hlKzQ86B8Ce5g-c01OMrkWsIuADFbVv-QgysQGy1zn_kyUwuYmJLiGKYcDtndcW-0ZpJXn-io0UyGdwYFahaofHH7xD_DyW_9kleOGN0BIjaV4GhhMLskb7TFAs2CquLn3E8mCuxKx7MQgWRL-GNL1QHMWuyFezjPWJnTCXJlv-fJQrKYAlwWTsN1UoTchzyolpPEeAEo5AiyH6WQgOyd2ZxaKHikBBu8vKtEE-zONIronEQWJRmauccYKjlpNW3CHoY63rDt2nnskC9FcI3OHX3p_3y8cy9l6wMab8aUBrXwRnebrSA-jAuv6jvHfakf_CelUcB1HnEFIIss5aXxlzYtoyQNUbaOPtW_xer26mZYC1uHcvMynzScejw'
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

    final response =
        await http.get(Uri.parse('${base_Url}/api/services'), headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTkwYzRkNTdiYzkzODQ2NTA5ZTM3MjU2YzU2ZTQ2MjQwNWZkMzc0Y2M4ZmE5YTg0OTJiN2U1MTBmZDhiM2Q3ZjgyYmY0N2Q1ZmM2YzJjYmMiLCJpYXQiOjE2NTY0MjIzNjAuOTE1MDA5LCJuYmYiOjE2NTY0MjIzNjAuOTE1MDIyLCJleHAiOjE2ODc5NTgzNjAuODkzMjYsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.Rwwp6Npa36TJHcEmOSA1i131gjYD8yaDUFH_EcRrjwhGVYzoy2K4yZifdYtVjqflTf8HjXZJIHLNYHpqvC2hD0G_GMPB9iowUuYxkIqMYbeXlgoU2SDMwQrRrM_jwhqv7VNi5sZo-cbdiy7MO0-J-lTzCjp3X5BxoFs_xDTC5eX2vxrY1bqeLNfXGN_tk3edTyAFF8nGVVVf3sqzur21-YDLfUJAznaS1F54CA1ZJaiKlZ1iefYBE1HFfxctjhqyCZCHcZc6-DBt9T5RA_v0skymQb-F735rRC73c83ZcHaOAk5EhX4_EqysY9WYMDDnoK2mY7nR0kLsL1qn7Se36bjhBBencDItpAA7goYL2E366L-w34X5hfY9_saOKWO1A2fpHnV7l5M-_B7sHvV57qBb_IvyP6AY8RV3EoTmmCBa8GdNJKgFwjU-QuMKerKwr3lBHGnXaskBsSjHeYB0_gt_o6hyx3as8FaiC_DxefdRDnhSQchnPN7WugCcHh_LPQONRB-wVYoYIR-qEjjqY2YyiMVttGFtZ0NO4-pbZLToclrUNIzyaxV7oCNsrd5E1fFF01mrXfwNG3ZmFe029m46Zfrcsfbn8cOG-NihMzQpq37zhXrC3FSnsVdZA2pVr4uGZjtnhuteMqGmtK7V0ek7mdoH4TNfFOVqk294mhc'
    }
            // snapshot.data!.services.woodWard[1].street
            );
    print("the respsmss base ${response.statusCode}");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ListService.fromJson(jsonDecode(response.body));
    } else {
      //    print("kgjsdjklsd ${snapshot.data!.services.woodWard[1].street}");

      throw Exception('Failed to load album');
    }
  }

  late Future<ListService> date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = fetchAlbum();
    print("gdgdf,h;l");
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
                          servicewoodward.clear();
                         servicefarmer.clear();
                          bothstreet.clear();
                          print("step one ");

                          print("dkphhhhh");
                         // gatesEdition.clear();

                      //    gatesEdition.add('select service');
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
                            {servicefarmer.add(snapshot.data!.services.farmer[i].name);


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

// void snackBar(
//     BuildContext context, String errorMessage, Color snackBarColor) {
//   final snackBar = SnackBar(
//     content: Text(
//       errorMessage,
//       style: const TextStyle(
//         fontSize: 28,
//         color: Colors.white,
//       ),
//     ),
//     backgroundColor: snackBarColor,
//     duration: const Duration(seconds: 1),
//   );
//   ScaffoldMessenger.of(context)
//     ..removeCurrentSnackBar()
//     ..showSnackBar(snackBar);
// }

DateTime selectedTime = DateTime.now();

/*
class _BasicTileWidgetState extends State<BasicTileWidget> {
  @override
  Widget build(BuildContext context) {
    final title = widget.tile.title;
    final servicesList = widget.tile.serviceChoosingList;
    if (servicesList.isEmpty) {
      return ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 26, color: Colors.white),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return ServiceInformationInput(
                  gateName: title,
                );
              },
            ),
          );
        },
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 3,
            color: Colors.blue,
          ),
        ),
        child: ExpansionTile(
          key: PageStorageKey(title),
          title: Text(
            title,
            style: const TextStyle(fontSize: 26, color: Colors.white),
          ),
          children:
          servicesList.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
    }
  }
}
class BasicTileWidget extends StatefulWidget {
  final ServiceChooser tile;
  const BasicTileWidget({
    Key? key,
    required this.tile,
  }) : super(key: key);
  @override
  _BasicTileWidgetState createState() => _BasicTileWidgetState();
}
 */
