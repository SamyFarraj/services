import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Cubit/Admin Level Operation/admin_level_cubit.dart';
import '../../../main.dart';
import '/services/choices.dart';
import 'package:http/http.dart' as http;


import '../../../Api/model/blocked_model.dart';
import '../../../components/snack_bar.dart';
import '../../../moh_project/post_moh/login_controller.dart';
import '../../constant.dart';

class UnBlockService extends StatefulWidget {
  const UnBlockService({Key? key}) : super(key: key);

  @override
  State<UnBlockService> createState() => _UnBlockServiceState();
}

class _UnBlockServiceState extends State<UnBlockService> {
  String selectedService = 'Select Service';
  String? selectedStreet = "Select Street";


List<String> blockedServices=[];
  List<BlockedModel> theUsersList = [];
  List<BlockedModel> userLists = [];
  late Future<List<BlockedModel>> futureData;

  static List<BlockedModel> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<BlockedModel>((json) => BlockedModel.fromJson(json)).toList();
  }
  Future<List<BlockedModel>> fetchData() async {
    final response = await http
        .get(Uri.parse('${baseUrl}/api/Admin/IndexBlockedServices'),
    headers: <String,String>
        {
      'Authorization': 'Bearer $adminToken'
    }
    );
    if (response.statusCode == 200) {
      List<BlockedModel> list = parseAgents(response.body);

      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }
  Future <String> Un_Block_Service(int id)async
  {
    final response = await http.get(
      Uri.parse('${baseUrl}/api/Admin/BlockServices/${id}'),
      headers: {
        'Authorization': 'Bearer $adminToken'
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

int id =0;
  void initState() {
    super.initState();
    fetchData().then((subjectFromServer) {
      setState(() {
        theUsersList = subjectFromServer;
        userLists = theUsersList;


        blockedServices.clear();
        for(int i=0;i<userLists.length;i++)
          {
            blockedServices.add(userLists[i].name);
          }
        selectedService=blockedServices[0];

        blockedServicesList = List.from(blockedServices);


      });
    });

    /*
    futureData =  fetchData();




     */
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

            BlocConsumer<AdminLevelCubit, AdminLevelState>(
  listener: (context, state) {
    // TODO: implement listener
    if (state is SuccessStatus) {
      Navigator.pop(context);
      print("success");

    }


    //في حال دخل كلمة سر خطأ
    if(state is FailureStatus)
    {
      //هون حط توست ماسج انو كلمة السر غلط
      print("رسالة الخطأ ");

    }
  },
  builder: (context, state) {
    var cubit=AdminLevelCubit.get(context);

    return SingleChildScrollView(
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
                              hint: Text("Select Service",style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                              ),),
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
                                for (int i=0;i<userLists.length;i++)
                                  {
                                    if(selectedService ==userLists[i].name)
                                      {
                                        id =userLists[i].id;
                                        break;
                                      }
                                  }

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
                          ConditionalBuilder(
                              condition: state is RefreshLevelState || state is AdminLevelInitial,
                              builder: (context) =>       ElevatedButton(

                                onPressed: () {
                                  cubit.Un_Block_Service(id);
                                  //
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
                              fallback: (context) => Center(
                                child: CircularProgressIndicator(),
                              ))

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
  },
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
