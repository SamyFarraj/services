import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_mohammad/project/constant.dart';
import 'package:project_mohammad/services/choices.dart';
import 'package:http/http.dart' as http;

import '../../../Api/model/name_service.dart';
import '../../../components/snack_bar.dart';
import '../../../moh_project/post_moh/login_controller.dart';

class BlockServices extends StatefulWidget {
  const BlockServices({Key? key}) : super(key: key);

  @override
  State<BlockServices> createState() => _BlockServiceState();
}

class _BlockServiceState extends State<BlockServices> {
  List<String> woodWardServices = [];
  List<String> farmerService = [];
  List<String> bothStreetsServices = [];
  List<String>servicesList=[];

  Future <String> Block_Service(int id)async
  {
    final response = await http.get(
      Uri.parse('${baseUrl}/api/Admin/BlockServices/${id}'),
      headers: {
        'Authorization':'Bearer $theToken'
      },
    );


    if(response.statusCode==200)
    {

      return jsonDecode(response.body);
    }
    else
    {
      return "Error code is ${response.statusCode}";
    }
  }


  int i=0;

  String selectedService = 'Select Service';
  String? selectedStreet = "Farmer";
  late int theId;
  Future<ListService> fetchAlbum() async {
    //   servicesList.clear();

    final response = await http
        .get(Uri.parse('${baseUrl}/api/Admin/services'),
        headers: {
          'Authorization':'Bearer $theToken'
        }
      // snapshot.data!.services.woodWard[1].street
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ListService.fromJson(jsonDecode(response.body));
    } else {


      throw Exception('Failed to load album');
    }
  }
  late Future<ListService>  date;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    date=fetchAlbum();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Block Service1",
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      color: Color.fromARGB(180, 0, 0, 65),
                    ),
                    child: SingleChildScrollView(
                      child: FutureBuilder
                      <ListService>(
                        future:  date,
                        builder:  ( context,snapshot)
                        {
                          if (snapshot.hasData)
                          {
                            woodWardServices.clear();
                            farmerService.clear();
                            bothStreetsServices.clear();




                            farmerService.add('select service');

                            for(int i =0;i<snapshot.data!.services.bothStreet.length;i++)
                            {


                              bothStreetsServices.add(snapshot.data!.services.bothStreet[i].name);
                            }

                            //
                            for(int i =0;i<snapshot.data!.services.woodward.length;i++)
                            {

                              woodWardServices.add(snapshot.data!.services.woodward[i].name);
                            }




                            if(  farmerService.length<=snapshot.data!.services.farmer.length)
                            {


                              for(int i =0;i<snapshot.data!.services.farmer.length;i++)
                              {


                                farmerService.add(snapshot.data!.services.farmer[i].name);
                              }
                            }
                            return
                              Column(
                                children: <Widget>[


                                  ///الليست القديمة //
/*
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
                                  },
                                ),
                              ),
                            ),


 */

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.75,
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
                                      onChanged: (street) =>
                                          setState(() {

                                            selectedStreet = street;

                                            if(selectedStreet=='FARMER')
                                            {

                                              if(farmerService.length==0)
                                              {
                                                // farmerServices.add('');
                                                servicesList = List.from(farmerService);
                                                //    servicesList.add('select services');

                                              }
                                              else {
                                                servicesList =
                                                    List.from(farmerService);
                                                selectedService =
                                                servicesList[0];
                                              }
                                            }

                                            if(selectedStreet=='WOODWARD')
                                            {
                                              servicesList = List.from(woodWardServices);
                                              selectedService=servicesList[0];

                                            }
                                            // servicesList.clear();



                                          }),
                                    ),
                                  ),

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.15,
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

                                        if(selectedStreet=='WOODWARD')
                                          for(int i =0;i<snapshot.data!.services.woodward.length;i++)
                                          {
                                            if(selectedService==snapshot.data!.services.woodward[i].name)
                                            {
                                              theId=snapshot.data!.services.woodward[i].id;
                                              break;


                                            }
                                          }
                                        else  if(selectedStreet=='FARMER')
                                        {
                                          for(int i =0;i<snapshot.data!.services.farmer.length;i++)
                                          {
                                            if(selectedService==snapshot.data!.services.farmer[i].name)
                                            {
                                              theId=snapshot.data!.services.farmer[i].id;
                                              break;


                                            }
                                          }


                                        }
                                        // servicesList.clear();
                                        //    servicesList.clear();


                                      }),
                                    ),
                                  ),
                                  ///الليست القديمة //
                                  /*
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
                                }),
                              ),
                            ),
                            */
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.15,
                                  ),
                                  // buttonOfManageServices(
                                  //   context,
                                  //   () {
                                  //     checkServiceBlock(selectedService);
                                  //   },
                                  //   "Block Service",
                                  //   const Color.fromARGB(255, 150, 10, 10),
                                  // ),
                                  ElevatedButton(
                                    onPressed: () {

                                      checkServiceBlock(selectedService);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(300, 60),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5.0,
                                        horizontal:
                                        MediaQuery.of(context).size.width * 0.2,
                                      ),
                                      primary: const Color.fromARGB(255, 150, 10, 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 15.0,
                                    ),
                                    child: const Text(
                                      "Block Service",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
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

  bool checkServiceBlock(String selectedService) {
    if (selectedStreet == "Select Street") {
      TheSnackBar(context, 'Please Select Street',
        const Color.fromARGB(255, 150, 10, 10),);
      return false;
    } else if (selectedService == 'Select Service') {
      TheSnackBar(context, 'Please Select Service',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      TheSnackBar(context, 'Service Blocked Successfully',
        const Color.fromARGB(255, 10, 150, 10),);
      return true;
    }
  }


}
