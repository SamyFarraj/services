import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/controller/login_controller.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // هدول ال controller
  // مشان ال textFields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                      TextField(
                        controller: emailController,
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
                      TextField(
                        obscureText: passwordVisibility,
                        controller: passwordController,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              Icon(
                                Icons.lock_open_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "LogIffn",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ) ,
                        onTap: ()
                        {
                          print('fasfsdfesfdfs');
                          logincontroller().signIn(emailController.text,passwordController.text,'/user');
                        },
                      )
                      //  هي كبسة ال login
                      // جوا ال onPressed منحط ال استدعاء تابع ارسال البيانات لل database
/*
                      ElevatedButton(
                        onPressed: () {
                          print('fasfsdfesfdfs');
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
        ],
      ),
    );
  }
}
