import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/controller/Admin/addNewAdmin_Controller.dart';
import 'package:project_mohammad/Api/model/showadmins_model.dart';
import 'package:project_mohammad/project/constant.dart';
import 'package:project_mohammad/services/choices.dart';
import 'package:http/http.dart' as http;

import '../../Api/controller/login_controller.dart';
import '../../Api/shredpreference.dart';
import '../../components/snack_bar.dart';
import '../../moh_project/post_moh/login_controller.dart';

class RemoveAdmin extends StatefulWidget {
  const RemoveAdmin({Key? key}) : super(key: key);

  @override
  State<RemoveAdmin> createState() => _RemoveAdminState();
}

class _RemoveAdminState extends State<RemoveAdmin> {



  List<Showadmins> ulist = [];
  List<Showadmins> userLists = [];
  @override
  static List<Showadmins> parseAgents(String responseBody) {
    print("sdknkjsdngjnd");
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Showadmins>((json) => Showadmins.fromJson(json))
        .toList();
  }

  Future<List<Showadmins>> fetchData() async {
    print("the token is ${t}");
    final response = await http.get(
      Uri.parse('${base_Url}/api/Admin/ShowAllAdmins'),
      headers: {

        'Authorization':'Bearer ${t}'
      },
    );
    print('the statues is ${response.statusCode}');
    if (response.statusCode == 200) {
      final List parsedList = json.decode(response.body);
      // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //  print("${response.body}");json.decode(response.body);
      List<Showadmins> list = parseAgents(response.body);
      print("sdasdasdasdsad$list");
      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }


/*
  Future  <List <Showadmins>>   getallAdmins()async
  {
    var respose = await http.get(Uri.parse('${base_Url}/api/Admin/ShowAllAdmins'),
    headers:<String ,String >
        {
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTM4Y2M3MmFlMTY3ZjgxYjc3ZTkwMzE1ZWEzMWY4NzNlZWQ0YmNiOGQzNTBjMzcyYzRkMTY1ZGE1YmI5MzJiYmFlZDJkZjFiZWY3OWJmNjMiLCJpYXQiOjE2NTM4NjY4MzYuMDczNDksIm5iZiI6MTY1Mzg2NjgzNi4wNzM0OTYsImV4cCI6MTY4NTQwMjgzNi4wMDQzNzQsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.umj9EaVbeViSSv3p8LgKv-nrkV46hkQsPhIJOHrUAC2gQAUX-T3B5Ft1cXDaOGwUDpfGRL4DXihd1KMuax42zPmNqd5ET5j2-0XuPrTmkxBUOhyoSqAxM_-HKK0ZAdYNg6TI7syMIM8vZFXEa_4nNI0oLNHW5YjLtt_y05C7OkCCRjOfyk57mkme2Hp91gkUu3MkZEMqeD7UKba9zDAzCy7wSgY37Y9Fi10H9RX6BWhDzPo-05tOq_dRFHUj423O3rwPA75ATxI1gMKPxA62WOpmfRzgJHbvdz4-wQZnabE9DcBx8b1Q7j4YWELMBvmA16tJ5bPB91Ohc_SSVWni'
              '1mvZF4jba7_vhCA74LAVqSFAgZN7c5w_nAO'
              'juyN6zqf23jsrWX4exj6JN1AtE-GIEW_lFomBTOXuX'
              '_cPtssfzx0O7rAhTx0uyIk1SQ4SLfSmEdLgmRRy7NSu4HG2'
              'NFx4OHFFJnLYUEvJRJx3-F4-88E5Aa1XQqSSmOYfA'
              'OJQ5AyWo-31YI4ujPaWxSfkDpUFwGJw2GSOFkdxxLnDi-F53E5HX'
              'U2Nl7y8ZlrwyvtN4b1pWVxGMFgiTaaAdWsJbxtjJSp4ctnbWG-'
              'xX1Gdn4bdDP_mrweLWqkzBnkwIA2ZGw1Sh_qt3s8IJipilyx8V5E'
              '3BkJb28J6Eq77RT6mMiF4sn0'
    }

    );
    List<Showadmins>res=[];
    if(respose.statusCode==200)
      {
res=showadminsFromJson(respose.toString());
print("the response is $res");
return res;
      }
    else return [] ;


  }
  late Future<List<Showadmins>>listadmin;


 */
  List <String> usres=[];
  @override
  void initState() {
    if(addAdminList.length>0) {
      addAdminList.length=1;

    }
   // addAdminList.clear();
   // addAdminList.add('select');
    super.initState();
    fetchData().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
        print("fsfsdfdsfdsf${userLists[1].name}");
     //   addAdminList=List.from(userLists)
        for(int i=0;i<userLists.length;i++)
        {
          addAdminList.add(userLists[i].name);
          print('rtr$usres');

        }

      });
    });



  }

  String? selectedAdmin = 'Select Admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Remove Admin",
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
                            height: MediaQuery.of(context).size.width * 0.05,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.05,
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
                              value: selectedAdmin,
                              items: addAdminList
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
                              onChanged: (currentChoice) => setState(() {
                                selectedAdmin = currentChoice!;
                              }),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          // buttonOfManageServices(
                          //   context,
                          //   () {
                          //     checkAdminDelete(selectedAdmin!);
                          //   },
                          //   "Remove Admin",
                          //   const Color.fromARGB(255, 150, 10, 10),
                          // ),
                          ElevatedButton(
                            onPressed: () {
                              checkAdminDelete(selectedAdmin!);
                            for(int i=0;i<userLists.length;i++)
                              {
                                if(selectedAdmin==userLists[i].name)
                                  {
                                    AddNewAdmin_con.RemoveAdmin(userLists[i].id);
                                    break;
                                  }
                              }

                             // هون تابع حذف ادمن لازم ينحط




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
                              "Remove Admin",
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

  bool checkAdminDelete(String selectedAdmin) {
    if (selectedAdmin == 'Select Admin') {
      TheSnackBar(context, "Please Select Admin",
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      TheSnackBar(context, "Admin Deleted Successfully",
          const Color.fromARGB(255, 15, 150, 10));
      return true;
    }
  }
}
