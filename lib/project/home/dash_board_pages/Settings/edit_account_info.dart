import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../Api/controller/User/account_user.dart';
import '../../../../Api/controller/login_controller.dart';
import '../../../../moh_project/post_moh/login_controller.dart';
import '../../../constant.dart';

import 'dashboard_verification_code_page.dart';

class EditAccountInfo extends StatefulWidget {
  const EditAccountInfo({Key? key}) : super(key: key);

  @override
  State<EditAccountInfo> createState() => _EditAccountInfoState();
}

class _EditAccountInfoState extends State<EditAccountInfo> {

  String currectnumber =" ";

  static Future <String > get_varvecation_code()async
  {

    var response = await http.get(Uri.parse('$base_Url/api/ResetPasswordRequest'),
        headers: <String ,String >

        {
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmM4OTU1NmI5MWI0Mzg2ODk3Nzg0NWRiYWJjMTAxMTM2NTI2NTQyNzIwYjNjMDJmYzNlZjI1NTUzOWQ4NzAyMDlkY2RlYjVmNWQwNmE4ZjYiLCJpYXQiOjE2NTAyNzgxODkuODMzMDA4LCJuYmYiOjE2NTAyNzgxODkuODMzMDEzLCJleHAiOjE2ODE4MTQxODkuODI1NzMzLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.fXEerbG_WvyVkOtDsCRsWlk6RJ0J9Q3dEzHjMtsPf0k1DbmJS2RN_Fspy07Uf6p8Gv7CMNML73fVt4f6JIb9bPGqzve3PuFqmpbyC9yEhFQtWBCS_R3FKrrtkek9UzQCvfG5SoyBa7cGYyma_00w9dcLy9zYXzWErfDAavmYPnex8Q7L-M58DKEpF7nJosDyXL5OzMgdAO50rD2VxOq48U1Ey6yd0TZyDKFolp3YeEJKM-G_Lee8cqA_hIEclJhvxCeyXnDk6eqjspBCyh6MuArxi-dJpQ0qXtoCrgAErDcdVRG5KH9oJ0Qz052pcQpIAI69i3Ip0kULxRlfk_aJDFXAyi1CGXMOpk1Wc4L29aApkTSnqesXPnsnpWs9Al4qtfNZypf7jDIj-nOWXcSyFxiM9PRZ4OgfLeDNcLoo_1yTZ8ib-LEydUzKLp7nqOnuUA9VBVQIZzJ1NoDzwvV73yLgv6QuiNFcH6nc_jJXxlgFodwZa2dx-etyexj4ACWZp6x7agkD1oR3BuiwxOp8d4AWCmllzFjr5MlcMA2GMRJzIS0IoSvMAUbxumAh-__VMQT7e_Pk928LD2Fj-bYQjTWuv88zpeWDiAYNBdYm5R8sCKyHRvzM0hOv-e6LKQOSCmv5skfpsaqv8JznF5b7f_smAG_D4PKxPEr67NTkHFE'
        }
    );

    if(response.statusCode==200)
    {
      var responsejeson = jsonDecode(response.body);
      var Var= responsejeson['reset password code'];
      return   Var.toString() ;
    }
    else
      return "";
  }






//كمان هون عدل رابط ارسال الريكوست
  static Future <String> upadte_user_profile(String name ,String phone) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${t}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${base_Url}'));
    request.fields.addAll({
      'name': '${name}',
      'phone': '${phone}'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return (await response.stream.bytesToString());
    }
    else {
      return (response.reasonPhrase.toString());
    }
  }




  final editingInfoFormKey = GlobalKey<FormState>();
    final newNameController = TextEditingController();
    final newPhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Info",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontStyle: FontStyle.italic,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(150, 0, 0, 65),
      ),
      body: Stack(
        children: <Widget>[
          // صورة الخلفية
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
          // هاد مشان لما نفتح ال keyboard
          // ما يعطي pixels rendered out error
          // يعني مشات  ما تطلع ال pixels  من الشاشة
          Form(
            key: editingInfoFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.14,
                    // color: Color.fromARGB(110, 200, 200, 200),
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
                  // هاد ال container اللي بيحتوي ع ال textFields
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromARGB(180, 0, 0, 65)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        // هاد ال حقل الخاص ب الاسم
                        TextFormField(
                          validator: (enteredNameVal) =>
                          enteredNameVal!.length < 6
                              ? "Name is too short"
                              : null,
                          controller: newNameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.deepOrange,
                            ),
                            label: Text(
                              "New Name",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.deepOrange,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        TextFormField(
                          validator: (enteredPhoneVal) =>
                          enteredPhoneVal!.length < 9
                              ? "phone is too short"
                              : null,
                          keyboardType: TextInputType.phone,
                          controller: newPhoneController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.deepOrange,
                            ),
                            label: Text(
                              "New Phone Number",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.deepOrange,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.065,
                        ),
                        //  هي كبسة ال signUp
                        // جوا ال onPressed منحط ال استدعاء تابع ارسال البيانات لل database
                        ElevatedButton(
                          onPressed: () {
                            final changeInfoFormKey = editingInfoFormKey.currentState!;
                            if(changeInfoFormKey.validate()){
                              // تابع ارسال البيانات
                              upadte_user_profile(newNameController.text,  newPhoneController.text);
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                            primary: const Color.fromARGB(255, 10, 150, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              Icon(
                                Icons.lock_open_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "Accept",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        const Text(
                          "or",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        ElevatedButton(
                          onPressed: () {
                     currectnumber=get_varvecation_code().toString();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_){
                                return   DashBoardVerificationCodePage(currectnum: currectnumber,);
                              },),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal:
                              MediaQuery.of(context).size.width * 0.15,
                            ),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.85,
                            MediaQuery.of(context).size.height * 0.05),
                            primary: const Color.fromARGB(255, 10, 150, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15.0,
                          ),
                          child: const Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
