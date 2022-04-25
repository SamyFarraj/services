import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/model/name_service.dart';
import 'package:project_mohammad/project/constant.dart';
import 'package:project_mohammad/services/choices.dart';
import 'package:http/http.dart' as http;

class DeleteService extends StatefulWidget {
  const DeleteService({Key? key}) : super(key: key);

  @override
  State<DeleteService> createState() => _DeleteServiceState();
}

class _DeleteServiceState extends State<DeleteService> {
  String selectedService = 'Select Service';
  String? selectedStreet = "Select Street";
 late ListService Servicelist;
  late ListService finallServicelist;
  static ListService parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ListService>((json) => ListService.fromJson(json)).toList();
  }

  late ListService fi;

  Future fetch ()async{
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjk4MGQ4ZTJjOGM0NWIyZDhhYzRhNjNhNTNmODk0Y2Q0MmIwNzRjMWRjZDdmMzc2YjM4MTZmMjQ5MWE3NDMzZTgyMWQzNDIzNzFmYWEyMTQiLCJpYXQiOjE2NDk0NjU1MjIuMDYwMDY2LCJuYmYiOjE2NDk0NjU1MjIuMDYwMDcsImV4cCI6MTY4MTAwMTUyMi4wNTQ2NDgsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.ggHEOutEaqlaL3ivXj3pswCEXhfm4q-CAojxNdtI9ZJ6WOw7OXkuGmsPrj6AF0BA6T_nF39TjnDq9yYFuPWNamLBHtmDiAIFwQWDpoJfh954HAO-gQWYB_yXfzdxgSMllTCk2e4NuvV-Epx1TPlkNqd3-RLM7ygPbSl8XCzYVebOGQpO734s2uqGqjSZr2sOp_9xdVKk5mduBLe9mMtIbEDAOTcEjKG2Cl-ABst0vJ-46IZqtTyWXOrFzlj5OzF3Qa6sejzVZHTFZv8Kt8iI93QNigFK94GXMrQ4OOjcx-uxtkY5C3vOQMZbUfcWbSFEMp5k76eL6Ab5xIVwN2Zth2xAKYQQ4zK1C98Afo31kAV-KL6xEPsJv0rRtHF_xzmnpqouXLfvmf2a6n6dvb1_GidOK_08kBocASrhFAisVrjslwKZu7nGsPQf4gIqVT7mc82UmF9COAbGGsMzrezP1_lhfMQyQhoMGMpU18maKOmFI5lZttdEr6nlPUsMPE9ta6Kw6FTLbbnUoK36FeYwMvtQqn1r5YvMt0SCwi5aPaSAp9lz7OECawhmp_Iq4vfnohhKEqGNdeyhU-02zcIhbFC8-BHO9j7AqNFZq-ZTgHF1G_r_Hm14qapJCdBottueEPOL6h5p1Tq87AQWRvSSnTI5RlLX3msIZdf8sdpQvnk'
    };
    var request = http.Request('GET', Uri.parse('http://192.168.137.1:8000/api/services'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
fi=response as ListService;
    if (response.statusCode == 200) {
      print("playyy");
      print(await response.stream.bytesToString());
      print("endddd");

    }
    else {
      print(response.reasonPhrase);
    }

  }


  Future<ListService> fetchAlbum() async {
    final response = await http
        .get(Uri.parse("${base_Url}/api/services"),
         headers : {
        'Accept': 'application/json',
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjk4MGQ4ZTJjOGM0NWIyZDhhYzRhNjNhNTNmODk0Y2Q0MmIwNzRjMWRjZDdmMzc2YjM4MTZmMjQ5MWE3NDMzZTgyMWQzNDIzNzFmYWEyMTQiLCJpYXQiOjE2NDk0NjU1MjIuMDYwMDY2LCJuYmYiOjE2NDk0NjU1MjIuMDYwMDcsImV4cCI6MTY4MTAwMTUyMi4wNTQ2NDgsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.ggHEOutEaqlaL3ivXj3pswCEXhfm4q-CAojxNdtI9ZJ6WOw7OXkuGmsPrj6AF0BA6T_nF39TjnDq9yYFuPWNamLBHtmDiAIFwQWDpoJfh954HAO-gQWYB_yXfzdxgSMllTCk2e4NuvV-Epx1TPlkNqd3-RLM7ygPbSl8XCzYVebOGQpO734s2uqGqjSZr2sOp_9xdVKk5mduBLe9mMtIbEDAOTcEjKG2Cl-ABst0vJ-46IZqtTyWXOrFzlj5OzF3Qa6sejzVZHTFZv8Kt8iI93QNigFK94GXMrQ4OOjcx-uxtkY5C3vOQMZbUfcWbSFEMp5k76eL6Ab5xIVwN2Zth2xAKYQQ4zK1C98Afo31kAV-KL6xEPsJv0rRtHF_xzmnpqouXLfvmf2a6n6dvb1_GidOK_08kBocASrhFAisVrjslwKZu7nGsPQf4gIqVT7mc82UmF9COAbGGsMzrezP1_lhfMQyQhoMGMpU18maKOmFI5lZttdEr6nlPUsMPE9ta6Kw6FTLbbnUoK36FeYwMvtQqn1r5YvMt0SCwi5aPaSAp9lz7OECawhmp_Iq4vfnohhKEqGNdeyhU-02zcIhbFC8-BHO9j7AqNFZq-ZTgHF1G_r_Hm14qapJCdBottueEPOL6h5p1Tq87AQWRvSSnTI5RlLX3msIZdf8sdpQvnk'
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ListService.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
 Future<ListService> FetchList() async {
    final response = await http
        .get(Uri.parse("${base_Url}/api/services")
            , headers : {
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjk4MGQ4ZTJjOGM0NWIyZDhhYzRhNjNhNTNmODk0Y2Q0MmIwNzRjMWRjZDdmMzc2YjM4MTZmMjQ5MWE3NDMzZTgyMWQzNDIzNzFmYWEyMTQiLCJpYXQiOjE2NDk0NjU1MjIuMDYwMDY2LCJuYmYiOjE2NDk0NjU1MjIuMDYwMDcsImV4cCI6MTY4MTAwMTUyMi4wNTQ2NDgsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.ggHEOutEaqlaL3ivXj3pswCEXhfm4q-CAojxNdtI9ZJ6WOw7OXkuGmsPrj6AF0BA6T_nF39TjnDq9yYFuPWNamLBHtmDiAIFwQWDpoJfh954HAO-gQWYB_yXfzdxgSMllTCk2e4NuvV-Epx1TPlkNqd3-RLM7ygPbSl8XCzYVebOGQpO734s2uqGqjSZr2sOp_9xdVKk5mduBLe9mMtIbEDAOTcEjKG2Cl-ABst0vJ-46IZqtTyWXOrFzlj5OzF3Qa6sejzVZHTFZv8Kt8iI93QNigFK94GXMrQ4OOjcx-uxtkY5C3vOQMZbUfcWbSFEMp5k76eL6Ab5xIVwN2Zth2xAKYQQ4zK1C98Afo31kAV-KL6xEPsJv0rRtHF_xzmnpqouXLfvmf2a6n6dvb1_GidOK_08kBocASrhFAisVrjslwKZu7nGsPQf4gIqVT7mc82UmF9COAbGGsMzrezP1_lhfMQyQhoMGMpU18maKOmFI5lZttdEr6nlPUsMPE9ta6Kw6FTLbbnUoK36FeYwMvtQqn1r5YvMt0SCwi5aPaSAp9lz7OECawhmp_Iq4vfnohhKEqGNdeyhU-02zcIhbFC8-BHO9j7AqNFZq-ZTgHF1G_r_Hm14qapJCdBottueEPOL6h5p1Tq87AQWRvSSnTI5RlLX3msIZdf8sdpQvnk'
        }
        );
    print("sssssssssssss${response.statusCode}");

    if (response.statusCode == 200) {
      print("${response.body}");
      ListService list = parseAgents(response.body);
      print("sdasdasdasdsad${list}");
      return list;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
  /*
  Future<ListService> FetchList() async {
    final response = await http.get(Uri.parse(base_Url+"/Api/services"));
    print("sdfsdfdfgdfhdfm  ${response.statusCode}");
    if (response.statusCode == 200) {
      print("sdfsdfdfgdfhdfm  ${response.body}");

      // If te server did return a 200 OK response,
      // then parse the JSON.
      return ListService.fromJson(jsonDecode(response.body));
    } else {

      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw  ('Failed to load album');
    }
  }

   */

  late Future<ListService> futureAlbum;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();

    // FetchList().then((subjectFromServer) {
    //   setState(() {
    //     Servicelist = subjectFromServer;
    //     finallServicelist = Servicelist;
    //     // print("fsfsdfdsfdsf${userLists}");
    //   });
    // });
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

                  FutureBuilder(
                      future: futureAlbum,
                      builder: (context,snapshot)
                      {
                        if (snapshot.hasData) {
                          return Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.704,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: const Color.fromARGB(180, 0, 0, 65),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
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
                                      onChanged: (street) => setState(() {
                                        selectedStreet = street;
                                      }),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height *0.1,),
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
                                      }),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.1,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // fetch();
                                      FetchList();
                                      print("samyyyy ${ Servicelist}");
                                      checkServiceDelete(selectedService);
                                      // print(finallServicelist);
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
                                      "Delete Service",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return Center(child: const CircularProgressIndicator());
                      },
                  )
                  ,
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  bool checkServiceDelete(String selectedService) {
    if(selectedStreet == null){
      snackBar(context, 'Please Select Street' , const Color.fromARGB(255, 150, 10, 10));
      return false;
    }
    else if (selectedService == 'Select Service') {
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
