import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/controller/User/work/Services_controller.dart';
import 'package:project_mohammad/Api/model/name_service.dart';
import 'package:project_mohammad/Api/model/new_model_service.dart';
import 'package:project_mohammad/project/constant.dart';
import 'package:project_mohammad/services/choices.dart';
import 'package:http/http.dart' as http;

import '../../../moh_project/post_moh/login_controller.dart';

class DeleteService extends StatefulWidget {
  const DeleteService({Key? key}) : super(key: key);

  @override
  State<DeleteService> createState() => _DeleteServiceState();
}

class _DeleteServiceState extends State<DeleteService> {
  List<String> servicewoodward = [];
  List<String> servicefarmer = [];

  Future<void> refrech() {
    return Future.delayed(
      Duration(seconds: 0),
    );
  }
  List<String>servicesList=[];

  String selectedService = 'Select Service';
  String? selectedStreet = "FARMER";
  late int theid;

  Future<ListService> fetchAlbum() async {
    print('the token is ${t} end');
    final response =
        await http.get(Uri.parse('${base_Url}/api/Admin/services'),
            headers: {
          'Authorization':'Bearer $t'

        }
            // snapshot.data!.services.woodWard[1].street
            );
    print("the respsmss base ${response.body}");
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
                    child: SingleChildScrollView(
                      child: FutureBuilder<ListService>(
                        future: date,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            servicewoodward.clear();
                            servicefarmer.clear();
                            print("step one ");

                            print("dkphhhhh");
                            servicefarmer.add('select service');

                            if (snapshot.data!.services.woodward.length == 0) {
                              servicewoodward.add('no item');
                            } else {
                              for (int i = 0;
                                  i < snapshot.data!.services.woodward.length;
                                  i++) {
                                print("there is no item ");

                                servicewoodward.add(
                                    snapshot.data!.services.woodward[i].name);
                              }
                            }
                            //   print("the array = ${servicewoodward}");

                            if (snapshot.data!.services.farmer.length == 0) {
                              servicefarmer.add('no item');
                            } else {
                              print("dkphhhhh");
                              for (int i = 0;
                                  i < snapshot.data!.services.farmer.length;
                                  i++) {
                                servicefarmer.add(
                                    snapshot.data!.services.farmer[i].name);
                              }

                              {
                                print("dkphhhhh");
                              }
                            }

                            //  servicesList = List.from(servicefarmer);
                            //   print("mu listtttt ${servicefarmer}");
                            // print('the titleee ${selectedStreet}');

/*

          if(selectedStreet=='WoodWard')
            {
              if(  servicesList.length<=snapshot.data!.services.woodWard.length)
              {

                print("dkphhhhh");
                for(int i =0;i<snapshot.data!.services.woodWard.length;i++)
                {
                  servicesList.add(snapshot.data!.services.woodWard[i].name);
                }
              }

            }
          else if (selectedStreet=='Farmer')
            {
              if(  servicesList.length<=snapshot.data!.services.farmer.length)
              {

                print("dkphhhhh");
                for(int i =0;i<snapshot.data!.services.woodWard.length;i++)
                {
                  servicesList.add(snapshot.data!.services.woodWard[i].name);
                }
              }
            }
         else  if(  servicesList.length<=snapshot.data!.services.farmer.length)
            {

              print("dkphhhhh");
              for(int i =0;i<snapshot.data!.services.woodWard.length;i++)
              {
                servicesList.add(snapshot.data!.services.woodWard[i].name);
              }
            }
*/
                            return Column(children: <Widget>[
                              RefreshIndicator(
                                onRefresh: refrech,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 3.6,
                                          color: Colors.blue,
                                        ),
                                        borderRadius: BorderRadius.circular(25),
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
                                    onChanged: (street) => setState(() {
                                      selectedStreet = street;
                                      print(
                                          "the selected is  ${selectedStreet}");
                                      if (selectedStreet == 'FARMER') {
                                        print("tsettttt");
                                        servicesList = List.from(servicefarmer);
                                        selectedService = servicesList[0];
                                      }

                                      if (selectedStreet == 'WOODWARD') {
                                        servicesList =
                                            List.from(servicewoodward);
                                        selectedService = servicesList[0];
                                      }
                                      // servicesList.clear();

                                      print("kdfsjkjfkl${servicesList}");
                                      /*
                            if (selectedStreet=='WoodWard')
                            {

                              print("step one ");
                              if(  servicesList.length<=snapshot.data!.services.woodWard.length)
                              {

                                servicesList.clear();
                                servicesList.add('sasas');
                                print("dkphhhhh");
                                for(int i =0;i<snapshot.data!.services.woodWard.length;i++)
                                {
                                  servicesList.add(snapshot.data!.services.woodWard[i].name);
                                }
                              }
                            }
                          else if (selectedStreet=='Farmer')
                            {
                              if(  servicesList.length<=snapshot.data!.services.farmer.length)
                              {

                                print("dkphhhhh");
                                for(int i =0;i<snapshot.data!.services.farmer.length;i++)
                                {
                                  servicesList.add(snapshot.data!.services.farmer[i].name);
                                }
                              }
                            }

*/
/*
                            if(selectedStreet=='WoodWard')
                            {
                              if(  servicesList.length<=snapshot.data!.services.woodWard.length)
                              {

                                print("dkphhhhh");
                                for(int i =0;i<snapshot.data!.services.woodWard.length;i++)
                                {
                                  servicesList.add(snapshot.data!.services.woodWard[i].name);
                                }
                              }

                            }
                            else if (selectedStreet=='Farmer')
                            {
                              if(  servicesList.length<=snapshot.data!.services.farmer.length)
                              {

                                print("dkphhhhh");
                                for(int i =0;i<snapshot.data!.services.farmer.length;i++)
                                {
                                  servicesList.add(snapshot.data!.services.farmer[i].name);
                                }
                              }
                            }
                            else  if(  servicesList.length<=snapshot.data!.services.farmer.length)
                            {

                              print("dkphhhhh");
                              for(int i =0;i<snapshot.data!.services.woodWard.length;i++)
                              {
                                servicesList.add(snapshot.data!.services.woodWard[i].name);
                              }
                            }

 */

/*
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => super.widget));

 */
                                    }),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
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
                                  value: selectedService,
                                  items: servicesList
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
                                    print("the selecteddd ${selectedService}");
                                    print("dkphhhhh");
                                    if (selectedStreet == 'WOODWARD')
                                      for (int i = 0;
                                          i <
                                              snapshot.data!.services.woodward
                                                  .length;
                                          i++) {
                                        print("test $i");
                                        if (selectedService ==
                                            snapshot.data!.services.woodward[i]
                                                .name) {
                                          theid = snapshot
                                              .data!.services.woodward[i].id;
                                          print("the id ${theid}");
                                          break;
                                        }
                                      }
                                    else if (selectedStreet == 'FARMER') {
                                      for (int i = 0;
                                          i <
                                              snapshot
                                                  .data!.services.farmer.length;
                                          i++) {
                                        if (selectedService ==
                                            snapshot.data!.services.farmer[i]
                                                .name) {
                                          theid = snapshot
                                              .data!.services.farmer[i].id;
                                          print("the id ${theid}");
                                          break;
                                        }
                                      }
                                    }
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
                              //      //  fetch();
                              //      //fetchfinall();
                              //      // FetchList();
                              //      // print("samyyyy${fetchfinall()} ");
                              //      checkServiceDelete(selectedService);
                              //      // print(finallServicelist);
                              //    },
                              //   "Delete Service",
                              //   const Color.fromARGB(255, 150, 10, 10),
                              // ),
                              ElevatedButton(
                                onPressed: () {
                                  //  fetch();
                                  //fetchfinall();
                                  // FetchList();
                                  // print("samyyyy${fetchfinall()} ");
                                  checkServiceDelete(selectedService);
                                  Servicee.delte_Service(theid);
                                  // print(finallServicelist);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(300, 60),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.2,
                                  ),
                                  primary:
                                      const Color.fromARGB(255, 150, 10, 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                              )
                            ]);
                          } else if (snapshot.hasError) {
                            print('${snapshot.error}');
                            return Text(
                              '${snapshot.error}',
                              style: TextStyle(fontSize: 40),
                            );
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
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
