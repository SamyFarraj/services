import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/Cubit Accountant -User/accountant_cubit.dart';
import '../components/snack_bar.dart';
import '../project/projects_page.dart';

class UserLogInPage extends StatefulWidget {
  const UserLogInPage({Key? key}) : super(key: key);

  @override
  State<UserLogInPage> createState() => _UserLogInPageState();
}

class _UserLogInPageState extends State<UserLogInPage> {
  // هدول ال controller
  // مشان ال textFields

  final adminEmailController = TextEditingController();
  final adminPasswordController = TextEditingController();

  // هاد ال key مسان ال  validator
  final adminLoginFormKey = GlobalKey<FormState>();

  //متغير ل تحديد طهور ال password
  bool adminPasswordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "User LogIn",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontStyle: FontStyle.italic,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
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
          // هاد مشان لما نفتح ال keyboard
          // ما يعطي pixels rendered out error
          // يعني مشات  ما تطلع ال pixels  من الشاشة

          BlocConsumer<AccountantCubit, UserAccountantState>(
            listener: (context, state) {
              var cubit=AccountantCubit.get(context);


              if (state is Seccfullog) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ProjectsPage(false)),
                      (Route<dynamic> route) => false,
                );

              }

//في حال دخل كلمة سر خطأ
              if(state is ErrorPasswordState)
                {
                  TheSnackBar(
                    context,
                        ' incorrect email or password',
                    const Color.fromARGB(255, 150, 10, 10),
                  );
                  //هون حط توست ماسج انو كلمة السر غلط
                  print("wrong password");

                }
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit=AccountantCubit.get(context);
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
                    // هاد ال container اللي بيحتوي ع ال textFields
                    // هون شغل الربط
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromARGB(180, 0, 0, 65),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          // هاد ال حقل الخاص ب ال email
                          TextFormField(
                            validator: (enteredEmailVal) => enteredEmailVal !=
                                null &&
                                !EmailValidator.validate(enteredEmailVal)
                                ? "Please Enter a Valid E-Mail"
                                : null,
                            keyboardType: TextInputType.emailAddress,
                            controller: adminEmailController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.deepOrange,
                              ),
                              label: Text(
                                "E-Mail",
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
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          // هاد ال حقل الخاص ب ال password
                          TextFormField(
                            validator: (enteredPasswordVal) =>
                            enteredPasswordVal!.length < 8
                                ? "Password is too short"
                                : null,
                            obscureText: adminPasswordVisibility,
                            controller: adminPasswordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.vpn_key_sharp,
                                color: Colors.deepOrange,
                              ),
                              suffixIcon: IconButton(
                                color: Colors.blue,
                                icon: adminPasswordVisibility
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                // color: Colors.deepOrange,
                                onPressed: () => setState(
                                      () => adminPasswordVisibility =
                                  !adminPasswordVisibility,
                                ),
                              ),
                              label: const Text(
                                "Password",
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
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          //  هي كبسة ال login
                          // جوا ال onPressed منحط ال استدعاء
                          // تابع ارسال البيانات لل database
                          // buttonsOfAuthentication(context ,"login" ,(){
                          //   final adminLoginFormKeyCurrent =
                          //                  adminLoginFormKey.currentState!;
                          //   //         if(adminLoginFormKeyCurrent.validate()){
                          //   //           // تابع ارسال البيان
                          //   //            print("Test Request SignUp m");
                          //   //         }
                          // }),

                          ConditionalBuilder(
                              condition: state is RefreshLevelState || state is UserAccountantInitial,
                              builder: (context) => ElevatedButton(
                                onPressed: () {
                                  /*
                          final formKey = adminLoginFormKey.currentState!;
                            if(formKey.validate()){
                                Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectsPage(),
                            ),
                          );
                            }
                           */

                                  print('Pressed');

                                  cubit.signInUser(
                                    adminEmailController.text,
                                    adminPasswordController.text,
                                  );
                                  print('before send request ');
                                  // loginController().signIn(adminEmailController.text,adminPasswordController.text,'/Admin');
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal:
                                    MediaQuery.of(context).size.width *
                                        0.30,
                                  ),
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 15.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.lock_open_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "LogIn",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              fallback: (context) => Center(
                                child: CircularProgressIndicator(),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
