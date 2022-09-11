import 'package:flutter/material.dart';

import '/project/projects_page.dart';
import '../../../../Api/controller/User/account_user.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool rePasswordVisibility = true;
  bool passwordVisibility = true;
  final editingPasswordFormKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final rePasswordController = TextEditingController();
  late Future<String> theVerificationCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theVerificationCode = Account_User.getVerificationCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Change Password",
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
            key: editingPasswordFormKey,
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

                        TextFormField(
                          validator: (enteredPasswordVal) =>
                              enteredPasswordVal!.length < 8
                                  ? "Password is too short"
                                  : null,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: passwordVisibility,
                          controller: newPasswordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.vpn_key_sharp,
                              color: Colors.deepOrange,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.blue,
                              icon: passwordVisibility
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              // color: Colors.deepOrange,
                              onPressed: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                            ),
                            label: const Text(
                              " Password",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.deepOrange,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
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
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        // هاد ال حقل الخاص ب اعادة ال password
                        TextFormField(
                          validator: (enteredPasswordVal) =>
                              enteredPasswordVal != newPasswordController.text
                                  ? "re-Password isn't current"
                                  : null,
                          obscureText: rePasswordVisibility,
                          controller: rePasswordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.vpn_key_sharp,
                              color: Colors.deepOrange,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.blue,
                              icon: rePasswordVisibility
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              // color: Colors.deepOrange,
                              onPressed: () => setState(
                                () => rePasswordVisibility =
                                    !rePasswordVisibility,
                              ),
                            ),
                            label: const Text(
                              " Re-Password",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.2,
                                color: Colors.deepOrange,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
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
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final changePasswordFormKey =
                                editingPasswordFormKey.currentState!;
                            if (changePasswordFormKey.validate()) {
                              // تابع ارسال البيانات
                              Account_User.Reset_password(
                                  newPasswordController.text,
                                  rePasswordController.text);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (_){
                                    return  ProjectsPage(admin);

                                  },
                                ),
                              );
                            }
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
