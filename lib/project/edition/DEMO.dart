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


  Future <String> Block_Service(int id)async
  {
    final response = await http.get(
      Uri.parse('${base_Url}/api/Admin/BlockServices/${id}'),
      headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkM2Y0NTJhMzU2YTI4M2Y4ZGQ5MGQ3NzgxYjU0ZmIyMzE0ZDVkNjBlNmI0YTM0YmNmZWFlMTJkNWRkODc1MzMxZTI3ZWZhOGQzMTM3NzYiLCJpYXQiOjE2NTEyMzQ3NDIuOTkxMTM0LCJuYmYiOjE2NTEyMzQ3NDIuOTkxMTU0LCJleHAiOjE2ODI3NzA3NDIuOTc4MjAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ek1NrqJvLbvZvqQdDecQqUXgqKLef3-Ye7FG39soEesiHyk3DUlcGgIpYoHbHKCH6YBThrqb5PoDQx42DPqbY3cbK895PhKF-Js7gcy2_MEsqrNE8zVTa8yHMRbBNM2wYVaykkyvkz5acWwofqg7dGkXjvTDObilBGRQddOQEIdxwZ_9qIjtjn-_5pMPzhBChJbGddacGc0ryUFHF89MW107cJ4bsaDPhY_rSGTm9NBm3xilBHHFhwEWIcxevuw_bIs9ayuK6aYiaB3d6w-mLuJR9he8W8vTCbkVvqQOk5AnL_3hlKzQ86B8Ce5g-c01OMrkWsIuADFbVv-QgysQGy1zn_kyUwuYmJLiGKYcDtndcW-0ZpJXn-io0UyGdwYFahaofHH7xD_DyW_9kleOGN0BIjaV4GhhMLskb7TFAs2CquLn3E8mCuxKx7MQgWRL-GNL1QHMWuyFezjPWJnTCXJlv-fJQrKYAlwWTsN1UoTchzyolpPEeAEo5AiyH6WQgOyd2ZxaKHikBBu8vKtEE-zONIronEQWJRmauccYKjlpNW3CHoY63rDt2nnskC9FcI3OHX3p_3y8cy9l6wMab8aUBrXwRnebrSA-jAuv6jvHfakf_CelUcB1HnEFIIss5aXxlzYtoyQNUbaOPtW_xer26mZYC1uHcvMynzScejw'
      },
    );
    if(response.statusCode==200)
    {
      print("yesssssssssss");
      return jsonDecode(response.body);
    }
    else
    {
      return "Error code is ${response.statusCode}";
    }
  }



  List<String> servicewoodward = [];
  List<String> servicefarmer = [];
  List<String> bothstreet = [];

  String selectedService = 'Select Service';
  String? selectedStreet = "Farmer";
  late int theid;
  Future<ListService> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('${base_Url}/api/services'),
        headers: {
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkM2Y0NTJhMzU2YTI4M2Y4ZGQ5MGQ3NzgxYjU0ZmIyMzE0ZDVkNjBlNmI0YTM0YmNmZWFlMTJkNWRkODc1MzMxZTI3ZWZhOGQzMTM3NzYiLCJpYXQiOjE2NTEyMzQ3NDIuOTkxMTM0LCJuYmYiOjE2NTEyMzQ3NDIuOTkxMTU0LCJleHAiOjE2ODI3NzA3NDIuOTc4MjAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ek1NrqJvLbvZvqQdDecQqUXgqKLef3-Ye7FG39soEesiHyk3DUlcGgIpYoHbHKCH6YBThrqb5PoDQx42DPqbY3cbK895PhKF-Js7gcy2_MEsqrNE8zVTa8yHMRbBNM2wYVaykkyvkz5acWwofqg7dGkXjvTDObilBGRQddOQEIdxwZ_9qIjtjn-_5pMPzhBChJbGddacGc0ryUFHF89MW107cJ4bsaDPhY_rSGTm9NBm3xilBHHFhwEWIcxevuw_bIs9ayuK6aYiaB3d6w-mLuJR9he8W8vTCbkVvqQOk5AnL_3hlKzQ86B8Ce5g-c01OMrkWsIuADFbVv-QgysQGy1zn_kyUwuYmJLiGKYcDtndcW-0ZpJXn-io0UyGdwYFahaofHH7xD_DyW_9kleOGN0BIjaV4GhhMLskb7TFAs2CquLn3E8mCuxKx7MQgWRL-GNL1QHMWuyFezjPWJnTCXJlv-fJQrKYAlwWTsN1UoTchzyolpPEeAEo5AiyH6WQgOyd2ZxaKHikBBu8vKtEE-zONIronEQWJRmauccYKjlpNW3CHoY63rDt2nnskC9FcI3OHX3p_3y8cy9l6wMab8aUBrXwRnebrSA-jAuv6jvHfakf_CelUcB1HnEFIIss5aXxlzYtoyQNUbaOPtW_xer26mZYC1uHcvMynzScejw'
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
  late Future<ListService>  date;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date=fetchAlbum();
    print("gdgdf,h;l");
  }
  @override
  Widget build(BuildContext context) {

   // String selectedService = 'Select Service';
    //String? selectedStreet = "Select Street";
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
                    child:
                    SingleChildScrollView(

                      child: FutureBuilder<ListService>

                        (

                        future:date ,
                        builder:(context,snapshot) {
                          if (snapshot.hasData) {
                            servicewoodward.clear();
                            servicefarmer.clear();
                            bothstreet.clear();
                            print("step one ");

                            print("dkphhhhh");

                            servicefarmer.add('select service');

                            for(int i =0;i<snapshot.data!.services.bothStreet.length;i++)
                            {
                              print("there is no item ");

                              bothstreet.add(snapshot.data!.services.bothStreet[i].name);
                            }


                            for (int i = 0; i < snapshot.data!.services.woodward.length; i++) {
                              print("there is no item ");

                              servicewoodward.add(
                                  snapshot.data!.services.woodward[i].name);
                            }
                            //   print("the array = ${servicewoodward}");


                            if (servicefarmer.length <= snapshot.data!.services
                                .farmer.length) {
                              print("dkphhhhh");
                              for (int i = 0; i <
                                  snapshot.data!.services.farmer.length; i++) {
                                print("there is no item ");

                                servicefarmer.add(
                                    snapshot.data!.services.farmer[i].name);
                              }
                            }
                            return
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.7,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 3.7,
                                            color: Colors.blue,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              25),
                                        ),
                                      ),
                                      // value: selectedStreet,
                                      items: selectStreet
                                          .map(
                                            (street) =>
                                            DropdownMenuItem<String>(
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
                                      onChanged: (street) =>
                                          setState(
                                                () {
                                              selectedStreet = street;
                                              //111111

                                              if(selectedStreet=='FARMER')
                                              {

                                                if(servicefarmer.length==0)
                                                {
                                                  // servicefarmer.add('');
                                                  gatesTest = List.from(servicefarmer);
                                                  //    servicesList.add('selecet serveics');

                                                }
                                                else {
                                                  gatesTest =
                                                      List.from(servicefarmer);
                                                  selectedService =
                                                  gatesTest[0];
                                                }
                                              }

                                              if(selectedStreet=='WOODWARD')
                                              {
                                                gatesTest = List.from(servicewoodward);
                                                selectedService=gatesTest[0];

                                              }
                                              // servicesList.clear();

                                              print("kdfsjkjfkl${gatesTest}");
                                            },
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.15,
                                  ),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.7,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 6.0,
                                            color: Colors.blue,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              25),
                                        ),
                                      ),
                                      value: selectedService,
                                      //2222222
                                      items: gatesTest
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
                                      onChanged: (service) =>
                                          setState(() {
                                            selectedService = service!;
print("thedasdas $bothstreet");
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    ServiceInformationInput(
                                                        gateName: selectedService,
                                                    both: bothstreet,),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              );
                          }
                          else if (snapshot.hasError) {
                            return Text('${snapshot.error}');

                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      )



                    )
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