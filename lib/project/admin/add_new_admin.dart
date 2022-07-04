import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project_mohammad/services/choices.dart';

import '../../Api/controller/Admin/addNewAdmin_Controller.dart';

import '../../components/snack_bar.dart';

// import '../../components/buttons.dart';

class AddNewAdmin extends StatefulWidget {
  const AddNewAdmin({Key? key}) : super(key: key);

  @override
  State<AddNewAdmin> createState() => _AddNewAdminState();
}

class _AddNewAdminState extends State<AddNewAdmin> {
  final adminEMailController = TextEditingController();

  final addAdminFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Admin",
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

            Form(
              key: addAdminFormKey,
              child: SingleChildScrollView(
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
                            TextFormField(
                              validator: (enteredEmailVal) =>
                              enteredEmailVal != null &&
                                  !EmailValidator.validate(enteredEmailVal)
                                  ? "Please Enter a Valid E-Mail"
                                  : null,
                              controller: adminEMailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.deepOrange,
                                  size: 40,
                                ),
                                label: Text(
                                  "Admin E-Mail",
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
                              height: MediaQuery.of(context).size.height * 0.08,
                            ),
                            // buttonOfManageServices(
                            //   context,
                            //   () {
                            //     checkNewAdmin(adminNameController.text);
                            //   },
                            //   "Add Admin",
                            //   const Color.fromARGB(255, 10, 150, 10),
                            // ),
                            ElevatedButton(
                              onPressed: () {
                                final formKey = addAdminFormKey.currentState!;
                                if(formKey.validate()){
                                  // تباع الارسال
                                  // checkNewAdmin(adminEMailController.text);
                                  checkNewAddAdminRequest();
                                  AddNewAdmin_con.Add_new_ADmiin(adminNameController.text);

                                }
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
                                "Add Admin",
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
            ),
          ],
        );
      }),
    );
  }
  bool checkNewAddAdminRequest(){
    if(_checkNewAdmin(adminEMailController.text)){
      addAdminList.add(adminEMailController.text);
      TheSnackBar(context, 'Admin Added Successfully',
          const Color.fromARGB(255, 10, 150, 10));
    }
    return false;
  }
  bool _checkNewAdmin(String adminEMail) {
    if (adminEMail == '' || adminEMail == ' ') {
      TheSnackBar(context, 'Please Enter Admin E-mail Address',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    }
    else if(adminEMail.length < 8){
      TheSnackBar(context, 'E-Mail Is Too Short',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    }
     else {
      for (var admin in addAdminList) {
        if (adminEMail == admin) {
          TheSnackBar(context, 'Admin E-mail Exited',
              const Color.fromARGB(255, 150, 10, 10));
          return false;
        }
      }
      addAdminList.add(adminName);
      TheSnackBar(context, 'Admin Added Successfully',
          const Color.fromARGB(255, 10, 150, 10));
      return true;
    }
  }


}
