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
    return parsed
        .map<ListService>((json) => ListService.fromJson(json))
        .toList();
  }

  late ListService fi;

  Future <ListService> fetchfinall() async {
    final response = await http.get(
      Uri.parse('http://192.168.56.1:8000/api/services'),
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkM2Y0NTJhMzU2YTI4M2Y4ZGQ5MGQ3NzgxYjU0ZmIyMzE0ZDVkNjBlNmI0YTM0YmNmZWFlMTJkNWRkODc1MzMxZTI3ZWZhOGQzMTM3NzYiLCJpYXQiOjE2NTEyMzQ3NDIuOTkxMTM0LCJuYmYiOjE2NTEyMzQ3NDIuOTkxMTU0LCJleHAiOjE2ODI3NzA3NDIuOTc4MjAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ek1NrqJvLbvZvqQdDecQqUXgqKLef3-Ye7FG39soEesiHyk3DUlcGgIpYoHbHKCH6YBThrqb5PoDQx42DPqbY3cbK895PhKF-Js7gcy2_MEsqrNE8zVTa8yHMRbBNM2wYVaykkyvkz5acWwofqg7dGkXjvTDObilBGRQddOQEIdxwZ_9qIjtjn-_5pMPzhBChJbGddacGc0ryUFHF89MW107cJ4bsaDPhY_rSGTm9NBm3xilBHHFhwEWIcxevuw_bIs9ayuK6aYiaB3d6w-mLuJR9he8W8vTCbkVvqQOk5AnL_3hlKzQ86B8Ce5g-c01OMrkWsIuADFbVv-QgysQGy1zn_kyUwuYmJLiGKYcDtndcW-0ZpJXn-io0UyGdwYFahaofHH7xD_DyW_9kleOGN0BIjaV4GhhMLskb7TFAs2CquLn3E8mCuxKx7MQgWRL-GNL1QHMWuyFezjPWJnTCXJlv-fJQrKYAlwWTsN1UoTchzyolpPEeAEo5AiyH6WQgOyd2ZxaKHikBBu8vKtEE-zONIronEQWJRmauccYKjlpNW3CHoY63rDt2nnskC9FcI3OHX3p_3y8cy9l6wMab8aUBrXwRnebrSA-jAuv6jvHfakf_CelUcB1HnEFIIss5aXxlzYtoyQNUbaOPtW_xer26mZYC1uHcvMynzScejw'
      },
    );
    print("the res${ListService.fromJson(json.decode(response.body)).services}");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
    //   ListService finalaa=
    // ///  Map<String, dynamic> finall =data['services'].;
     print("the res${ListService.fromJson(json.decode(response.body)).services}");
   //   listServiceFromJson(json.decode(response.body))
      return ListService.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception('Failed to load album');
    }
  }

/*
  Future fetch ()async{
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkM2Y0NTJhMzU2YTI4M2Y4ZGQ5MGQ3NzgxYjU0ZmIyMzE0ZDVkNjBlNmI0YTM0YmNmZWFlMTJkNWRkODc1MzMxZTI3ZWZhOGQzMTM3NzYiLCJpYXQiOjE2NTEyMzQ3NDIuOTkxMTM0LCJuYmYiOjE2NTEyMzQ3NDIuOTkxMTU0LCJleHAiOjE2ODI3NzA3NDIuOTc4MjAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ek1NrqJvLbvZvqQdDecQqUXgqKLef3-Ye7FG39soEesiHyk3DUlcGgIpYoHbHKCH6YBThrqb5PoDQx42DPqbY3cbK895PhKF-Js7gcy2_MEsqrNE8zVTa8yHMRbBNM2wYVaykkyvkz5acWwofqg7dGkXjvTDObilBGRQddOQEIdxwZ_9qIjtjn-_5pMPzhBChJbGddacGc0ryUFHF89MW107cJ4bsaDPhY_rSGTm9NBm3xilBHHFhwEWIcxevuw_bIs9ayuK6aYiaB3d6w-mLuJR9he8W8vTCbkVvqQOk5AnL_3hlKzQ86B8Ce5g-c01OMrkWsIuADFbVv-QgysQGy1zn_kyUwuYmJLiGKYcDtndcW-0ZpJXn-io0UyGdwYFahaofHH7xD_DyW_9kleOGN0BIjaV4GhhMLskb7TFAs2CquLn3E8mCuxKx7MQgWRL-GNL1QHMWuyFezjPWJnTCXJlv-fJQrKYAlwWTsN1UoTchzyolpPEeAEo5AiyH6WQgOyd2ZxaKHikBBu8vKtEE-zONIronEQWJRmauccYKjlpNW3CHoY63rDt2nnskC9FcI3OHX3p_3y8cy9l6wMab8aUBrXwRnebrSA-jAuv6jvHfakf_CelUcB1HnEFIIss5aXxlzYtoyQNUbaOPtW_xer26mZYC1uHcvMynzScejw'
    };
    var request = http.Request('GET', Uri.parse('http://192.168.56.1:8000/api/services'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
//fi=response as ListService;
print(response.statusCode);

    if (response.statusCode == 200) {

      var responsedec=jsonDecode(response.);
      print("playyy");
      print(await response.stream.bytesToString());
      print("endddd");

    }
    else {
      print(response.reasonPhrase);
    }

  }


 */
  Future<ListService> fetchAlbum() async {
    final response =
        await http.get(Uri.parse("${base_Url}/api/services"), headers: {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjk4MGQ4ZTJjOGM0NWIyZDhhYzRhNjNhNTNmODk0Y2Q0MmIwNzRjMWRjZDdmMzc2YjM4MTZmMjQ5MWE3NDMzZTgyMWQzNDIzNzFmYWEyMTQiLCJpYXQiOjE2NDk0NjU1MjIuMDYwMDY2LCJuYmYiOjE2NDk0NjU1MjIuMDYwMDcsImV4cCI6MTY4MTAwMTUyMi4wNTQ2NDgsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.ggHEOutEaqlaL3ivXj3pswCEXhfm4q-CAojxNdtI9ZJ6WOw7OXkuGmsPrj6AF0BA6T_nF39TjnDq9yYFuPWNamLBHtmDiAIFwQWDpoJfh954HAO-gQWYB_yXfzdxgSMllTCk2e4NuvV-Epx1TPlkNqd3-RLM7ygPbSl8XCzYVebOGQpO734s2uqGqjSZr2sOp_9xdVKk5mduBLe9mMtIbEDAOTcEjKG2Cl-ABst0vJ-46IZqtTyWXOrFzlj5OzF3Qa6sejzVZHTFZv8Kt8iI93QNigFK94GXMrQ4OOjcx-uxtkY5C3vOQMZbUfcWbSFEMp5k76eL6Ab5xIVwN2Zth2xAKYQQ4zK1C98Afo31kAV-KL6xEPsJv0rRtHF_xzmnpqouXLfvmf2a6n6dvb1_GidOK_08kBocASrhFAisVrjslwKZu7nGsPQf4gIqVT7mc82UmF9COAbGGsMzrezP1_lhfMQyQhoMGMpU18maKOmFI5lZttdEr6nlPUsMPE9ta6Kw6FTLbbnUoK36FeYwMvtQqn1r5YvMt0SCwi5aPaSAp9lz7OECawhmp_Iq4vfnohhKEqGNdeyhU-02zcIhbFC8-BHO9j7AqNFZq-ZTgHF1G_r_Hm14qapJCdBottueEPOL6h5p1Tq87AQWRvSSnTI5RlLX3msIZdf8sdpQvnk'
    });
    print("${response.statusCode}");
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
    final response =
        await http.get(Uri.parse("${base_Url}/api/services"), headers: {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjk4MGQ4ZTJjOGM0NWIyZDhhYzRhNjNhNTNmODk0Y2Q0MmIwNzRjMWRjZDdmMzc2YjM4MTZmMjQ5MWE3NDMzZTgyMWQzNDIzNzFmYWEyMTQiLCJpYXQiOjE2NDk0NjU1MjIuMDYwMDY2LCJuYmYiOjE2NDk0NjU1MjIuMDYwMDcsImV4cCI6MTY4MTAwMTUyMi4wNTQ2NDgsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.ggHEOutEaqlaL3ivXj3pswCEXhfm4q-CAojxNdtI9ZJ6WOw7OXkuGmsPrj6AF0BA6T_nF39TjnDq9yYFuPWNamLBHtmDiAIFwQWDpoJfh954HAO-gQWYB_yXfzdxgSMllTCk2e4NuvV-Epx1TPlkNqd3-RLM7ygPbSl8XCzYVebOGQpO734s2uqGqjSZr2sOp_9xdVKk5mduBLe9mMtIbEDAOTcEjKG2Cl-ABst0vJ-46IZqtTyWXOrFzlj5OzF3Qa6sejzVZHTFZv8Kt8iI93QNigFK94GXMrQ4OOjcx-uxtkY5C3vOQMZbUfcWbSFEMp5k76eL6Ab5xIVwN2Zth2xAKYQQ4zK1C98Afo31kAV-KL6xEPsJv0rRtHF_xzmnpqouXLfvmf2a6n6dvb1_GidOK_08kBocASrhFAisVrjslwKZu7nGsPQf4gIqVT7mc82UmF9COAbGGsMzrezP1_lhfMQyQhoMGMpU18maKOmFI5lZttdEr6nlPUsMPE9ta6Kw6FTLbbnUoK36FeYwMvtQqn1r5YvMt0SCwi5aPaSAp9lz7OECawhmp_Iq4vfnohhKEqGNdeyhU-02zcIhbFC8-BHO9j7AqNFZq-ZTgHF1G_r_Hm14qapJCdBottueEPOL6h5p1Tq87AQWRvSSnTI5RlLX3msIZdf8sdpQvnk'
    });
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

/*
  Future <String>fetccccc()async
  {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkM2Y0NTJhMzU2YTI4M2Y4ZGQ5MGQ3NzgxYjU0ZmIyMzE0ZDVkNjBlNmI0YTM0YmNmZWFlMTJkNWRkODc1MzMxZTI3ZWZhOGQzMTM3NzYiLCJpYXQiOjE2NTEyMzQ3NDIuOTkxMTM0LCJuYmYiOjE2NTEyMzQ3NDIuOTkxMTU0LCJleHAiOjE2ODI3NzA3NDIuOTc4MjAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ek1NrqJvLbvZvqQdDecQqUXgqKLef3-Ye7FG39soEesiHyk3DUlcGgIpYoHbHKCH6YBThrqb5PoDQx42DPqbY3cbK895PhKF-Js7gcy2_MEsqrNE8zVTa8yHMRbBNM2wYVaykkyvkz5acWwofqg7dGkXjvTDObilBGRQddOQEIdxwZ_9qIjtjn-_5pMPzhBChJbGddacGc0ryUFHF89MW107cJ4bsaDPhY_rSGTm9NBm3xilBHHFhwEWIcxevuw_bIs9ayuK6aYiaB3d6w-mLuJR9he8W8vTCbkVvqQOk5AnL_3hlKzQ86B8Ce5g-c01OMrkWsIuADFbVv-QgysQGy1zn_kyUwuYmJLiGKYcDtndcW-0ZpJXn-io0UyGdwYFahaofHH7xD_DyW_9kleOGN0BIjaV4GhhMLskb7TFAs2CquLn3E8mCuxKx7MQgWRL-GNL1QHMWuyFezjPWJnTCXJlv-fJQrKYAlwWTsN1UoTchzyolpPEeAEo5AiyH6WQgOyd2ZxaKHikBBu8vKtEE-zONIronEQWJRmauccYKjlpNW3CHoY63rDt2nnskC9FcI3OHX3p_3y8cy9l6wMab8aUBrXwRnebrSA-jAuv6jvHfakf_CelUcB1HnEFIIss5aXxlzYtoyQNUbaOPtW_xer26mZYC1uHcvMynzScejw'
    };
    var request = http.Request('GET', Uri.parse('http://192.168.56.1:8000/api/services'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("dsfsdfs$response.statusCode == 200");

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }


 */
  late Future<ListService> futureAlbum;

  Future<String> Ddelet_serv(int id ) async {
    final response = await http
        .delete(Uri.parse('${base_Url}/api/Admin/DeleteService/${id}'), headers: {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjk4MGQ4ZTJjOGM0NWIyZDhhYzRhNjNhNTNmODk0Y2Q0MmIwNzRjMWRjZDdmMzc2YjM4MTZmMjQ5MWE3NDMzZTgyMWQzNDIzNzFmYWEyMTQiLCJpYXQiOjE2NDk0NjU1MjIuMDYwMDY2LCJuYmYiOjE2NDk0NjU1MjIuMDYwMDcsImV4cCI6MTY4MTAwMTUyMi4wNTQ2NDgsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.ggHEOutEaqlaL3ivXj3pswCEXhfm4q-CAojxNdtI9ZJ6WOw7OXkuGmsPrj6AF0BA6T_nF39TjnDq9yYFuPWNamLBHtmDiAIFwQWDpoJfh954HAO-gQWYB_yXfzdxgSMllTCk2e4NuvV-Epx1TPlkNqd3-RLM7ygPbSl8XCzYVebOGQpO734s2uqGqjSZr2sOp_9xdVKk5mduBLe9mMtIbEDAOTcEjKG2Cl-ABst0vJ-46IZqtTyWXOrFzlj5OzF3Qa6sejzVZHTFZv8Kt8iI93QNigFK94GXMrQ4OOjcx-uxtkY5C3vOQMZbUfcWbSFEMp5k76eL6Ab5xIVwN2Zth2xAKYQQ4zK1C98Afo31kAV-KL6xEPsJv0rRtHF_xzmnpqouXLfvmf2a6n6dvb1_GidOK_08kBocASrhFAisVrjslwKZu7nGsPQf4gIqVT7mc82UmF9COAbGGsMzrezP1_lhfMQyQhoMGMpU18maKOmFI5lZttdEr6nlPUsMPE9ta6Kw6FTLbbnUoK36FeYwMvtQqn1r5YvMt0SCwi5aPaSAp9lz7OECawhmp_Iq4vfnohhKEqGNdeyhU-02zcIhbFC8-BHO9j7AqNFZq-ZTgHF1G_r_Hm14qapJCdBottueEPOL6h5p1Tq87AQWRvSSnTI5RlLX3msIZdf8sdpQvnk'
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else
      return "Error Code is   =   ${response.statusCode}";
  }

  late  ListService data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //futureAlbum=FetchList();
    // futureAlbum = fetchAlbum();

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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
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
                              }),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
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
