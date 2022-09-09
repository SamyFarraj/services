import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/controller/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogInPage extends StatefulWidget {
  const UserLogInPage({Key? key}) : super(key: key);

  @override
  State<UserLogInPage> createState() => _UserLogInPageState();
}

class _UserLogInPageState extends State<UserLogInPage> {
  // هدول ال controller
  // مشان ال textFields


  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();

  // هاد ال key  مشات ال  validation
  final loginFormKey = GlobalKey<FormState>();

  //متغير ل تحديد طهور ال password
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "LogIn",
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
          Form(
            key: loginFormKey,
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
                          validator: (enteredEmailVal) =>
                              enteredEmailVal != null &&
                                      !EmailValidator.validate(enteredEmailVal)
                                  ? "Please Enter a Valid E-Mail"
                                  : null,
                          keyboardType: TextInputType.emailAddress,
                          controller: userEmailController,
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
                          obscureText: passwordVisibility,
                          controller: userPasswordController,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "forgot password?",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        //هاد الزر اخر شي مننقل كلشي جوا ال on pressed
                        // buttonsOfAuthentication(context, 'Login', (){
                        //   //هون لازم نضيف ال validator
                        //   //     // حاليا رح اتركو بتعليق مشات
                        //   //     // ما يعذبك وقت التجريب اخر شي بزبطو
                        //   //
                        //        final LoginFormKeyCurrent = LoginFormKey.currentState!;
                        //         if(LoginFormKeyCurrent.validate()){
                        //           // تابع ارسال البيانات
                        //            print("Test Request SignUp m");
                        //         }
                        //
                        //
                        // }),
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Icon(
                                  Icons.lock_open_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.05,
                                ),
                                const Text(
                                  "LogInS",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            //هون لازم نضيف ال validator
                            // حاليا رح اتركو بتعليق مشات
                            // ما يعذبك وقت التجريب اخر شي بزبطو
                            /*
                                final formKey = loginFormKey.currentState!;
                            if(formKey.validate()){
                              // تباع الارسال
                            }
                             */
                            print('pressed');
                            logincontroller().signInUser(userEmailController.text,
                                userPasswordController.text);
                          },
                        )
                        //  هي كبسة ال login
                        // جوا ال onPressed منحط ال استدعاء تابع ارسال البيانات لل database
/*
                        ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            logincontroller().signIn(emailController.text,passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.30,
                            ),
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
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
                                "LogIn",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

 */
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
