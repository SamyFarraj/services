import 'package:flutter/material.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  // هاد ال controller
  // مشان ال textField
  final verificationCodeController = TextEditingController();
  String correctVerificationCode = "123456";

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
          "Verify",
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
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      // هاد ال حقل الخاص ب ال code تبع التحقق
                      TextField(
                        controller: verificationCodeController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.deepOrange,
                          ),
                          label: Text(
                            "Code",
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
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),

                      //  هي كبسة ال Submit
                      // جوا ال onPressed منحط ال استدعاء تابع
                      // مقارنة الكود اللي اجا من ال database
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal:
                              MediaQuery.of(context).size.width * 0.21,
                            ),
                            primary: const Color.fromARGB(255, 10, 150, 10),
                            elevation: 15.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
            ),
          ),
        ],
      ),
    );
  }

  void checkVerificationCode() {
    if(verificationCodeController.text == correctVerificationCode){

    }
    else if (verificationCodeController.text == '') {
      snackBar(
        context,
        "Please Enter Verification Code",
        const Color.fromARGB(255, 150, 10, 10),
      );
    }else{
      snackBar(
        context,
        "Please Enter Verification Code",
        const Color.fromARGB(255, 150, 10, 10),
      );
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
