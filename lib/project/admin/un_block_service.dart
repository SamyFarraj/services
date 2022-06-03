import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_mohammad/services/choices.dart';
import 'package:http/http.dart' as http;

import '../../components/snack_bar.dart';
import '../constant.dart';

class UnBlockService extends StatefulWidget {
  const UnBlockService({Key? key}) : super(key: key);

  @override
  State<UnBlockService> createState() => _UnBlockServiceState();
}

class _UnBlockServiceState extends State<UnBlockService> {
  String selectedService = 'Select Service';
  String? selectedStreet = "Select Street";

  Future <String> Un_Block_Service(int id)async
  {
    final response = await http.get(
      Uri.parse('${base_Url}/api/Admin/BlockServices/${id}'),
      headers: {
        'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkM2Y0NTJhMzU2YTI4M2Y4ZGQ5MGQ3NzgxYjU0ZmIyMzE0ZDVkNjBlNmI0YTM0YmNmZWFlMTJkNWRkODc1MzMxZTI3ZWZhOGQzMTM3NzYiLCJpYXQiOjE2NTEyMzQ3NDIuOTkxMTM0LCJuYmYiOjE2NTEyMzQ3NDIuOTkxMTU0LCJleHAiOjE2ODI3NzA3NDIuOTc4MjAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ek1NrqJvLbvZvqQdDecQqUXgqKLef3-Ye7FG39soEesiHyk3DUlcGgIpYoHbHKCH6YBThrqb5PoDQx42DPqbY3cbK895PhKF-Js7gcy2_MEsqrNE8zVTa8yHMRbBNM2wYVaykkyvkz5acWwofqg7dGkXjvTDObilBGRQddOQEIdxwZ_9qIjtjn-_5pMPzhBChJbGddacGc0ryUFHF89MW107cJ4bsaDPhY_rSGTm9NBm3xilBHHFhwEWIcxevuw_bIs9ayuK6aYiaB3d6w-mLuJR9he8W8vTCbkVvqQOk5AnL_3hlKzQ86B8Ce5g-c01OMrkWsIuADFbVv-QgysQGy1zn_kyUwuYmJLiGKYcDtndcW-0ZpJXn-io0UyGdwYFahaofHH7xD_DyW_9kleOGN0BIjaV4GhhMLskb7TFAs2CquLn3E8mCuxKx7MQgWRL-GNL1QHMWuyFezjPWJnTCXJlv-fJQrKYAlwWTsN1UoTchzyolpPEeAEo5AiyH6WQgOyd2ZxaKHikBBu8vKtEE-zONIronEQWJRmauccYKjlpNW3CHoY63rDt2nnskC9FcI3OHX3p_3y8cy9l6wMab8aUBrXwRnebrSA-jAuv6jvHfakf_CelUcB1HnEFIIss5aXxlzYtoyQNUbaOPtW_xer26mZYC1uHcvMynzScejw'
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "UnBlock Service",
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
                      child: Column(
                        children: <Widget>[

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
                              items: blockedServicesList
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
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                          // buttonOfManageServices(
                          //   context,
                          //   () {
                          //     // checkServiceBlock(selectedService);
                          //   },
                          //   "UnBlock Service",
                          //   const Color.fromARGB(255, 10, 150, 10),
                          // ),
                          ElevatedButton(
                            onPressed: () {
                              // checkServiceBlock(selectedService);
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 60),
                              padding: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.2,
                              ),
                              primary: const Color.fromARGB(255, 10, 150, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15.0,
                            ),
                            child: const Text(
                              "UnBlock Service",
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

  bool checkServiceUnBlock(String selectedService) {
    if (selectedStreet == null) {
      TheSnackBar(context, 'Please Select Street',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else if (selectedService == 'Select Service') {
      TheSnackBar(context, "Please Select Service",
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      TheSnackBar(context, "Service Blocked Successfully",
          const Color.fromARGB(255, 15, 150, 10));
      return true;
    }
  }
}
