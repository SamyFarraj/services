import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/controller/User/work/Services_controller.dart';
import 'package:project_mohammad/Api/model/name_service.dart';
import 'package:project_mohammad/Api/model/new_model_service.dart';
import 'package:project_mohammad/project/constant.dart';
import 'package:project_mohammad/services/choices.dart';
import 'package:http/http.dart' as http;

class DeleteService extends StatefulWidget {
  const DeleteService({Key? key}) : super(key: key);

  @override
  State<DeleteService> createState() => _DeleteServiceState();
}

class _DeleteServiceState extends State<DeleteService> {
  List<String> servicewoodward = [];
  List<String> servicefarmer = [];

Future <void > refrech()
{
  return Future.delayed(
      Duration(seconds:0),
  );
}

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
    return

      Scaffold(
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
      body:
      Builder(builder: (context) {
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
                      child:
                      FutureBuilder<ListService>(
                        future:  date,
                        builder:  ( context,snapshot) {

        if (snapshot.hasData) {


          servicewoodward.clear();
          servicefarmer.clear();
            print("step one ");

              print("dkphhhhh");
              if(snapshot.data!.services.woodward.length==0)
                {
                  servicewoodward.add('no item');
                }
              else {
                for (int i = 0; i< snapshot.data!.services.woodward.length; i++) {
                  servicewoodward.add(snapshot.data!.services.woodward[i].name);
                }
              }
         //   print("the array = ${servicewoodward}");


          if(snapshot.data!.services.farmer.length==0)
          {
            servicefarmer.add('no item');
          }
          else
             {

                 print("dkphhhhh");
                 for(int i =0;i<snapshot.data!.services.farmer.length;i++)
                 {
                   servicefarmer.add(snapshot.data!.services.farmer[i].name);
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
        return
          Column(
              children: <Widget>[
          RefreshIndicator(
            onRefresh: refrech,
            child:


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

                            if(selectedStreet=='Farmer')
                              {

                                servicesList = List.from(servicefarmer);
                                selectedService=servicesList[0];
                              }

                            if(selectedStreet=='WoodWard')
                              {
                                servicesList = List.from(servicewoodward);
                                selectedService=servicesList[0];

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
                          print("the selecteddd ${selectedService}");
                            print("dkphhhhh");
                          if(selectedStreet=='WoodWard')
                            for(int i =0;i<snapshot.data!.services.woodward.length;i++)
                            {
                            if(selectedService==snapshot.data!.services.woodward[i].name)
                              {
                                theid=snapshot.data!.services.woodward[i].id;
                                print("the id ${theid}");
                                break;


                              }
                            }
                          else  if(selectedStreet=='Farmer')
                            {
                            for(int i =0;i<snapshot.data!.services.farmer.length;i++)
                            {
                            if(selectedService==snapshot.data!.services.farmer[i].name)
                            {
                            theid=snapshot.data!.services.farmer[i].id;
                            print("the id ${theid}");
                            break;


                            }
                            }


                          }}),
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
                          ),)]);



        }
        else if (snapshot.hasError) {
          print('${snapshot.error}');
            return Text('${snapshot.error}',style: TextStyle(fontSize: 40),);

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
