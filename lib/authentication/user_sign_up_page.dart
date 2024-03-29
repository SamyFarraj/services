import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/Cubit Accountant -User/accountant_cubit.dart';
import '/Api/controller/signup_controller.dart';
import '/authentication/user_log_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // هدول متعيرات مشان اظهار ال password وال re password
  bool userRePasswordVisibility = true;
  bool userPasswordVisibility = true;

  // هدول ال controllers مشات الحقول
  //هاد لل اسم
  final userNameController = TextEditingController();

  //هاد لل email
  final userEmailController = TextEditingController();

  //هاد لل password
  final userPasswordController = TextEditingController();

  //هاد ل إعادة password
  final userRePasswordController = TextEditingController();

  //هاد ل إعادة رقم ال هاتف
  final userPhoneController = TextEditingController();

  //هاد ال key مسان ال validation
  final userSignUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign Up",
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
            key: userSignUpFormKey,
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
                  BlocConsumer<AccountantCubit, UserAccountantState>(
  listener: (context, state) {
    // TODO: implement listener
    if (state is SuccessSignUpState) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserLogInPage(),
        ),
      );

    }

//في حال دخل كلمة سر خطأ
    if(state is FailedSignUpState)
    {
      //هون حط توست ماسج انو كلمة السر غلط
      print("dasdas");

    }
  },
  builder: (context, state) {
    var cubit=AccountantCubit.get(context);
    return Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.67,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromARGB(180, 0, 0, 65)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        // هاد ال حقل الخاص ب الاسم
                        TextFormField(
                          validator: (enteredPasswordVal) =>
                              enteredPasswordVal!.length < 6
                                  ? "Name is too short"
                                  : null,
                          controller: userNameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.deepOrange,
                            ),
                            label: Text(
                              "Full Name",
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
                          height: MediaQuery.of(context).size.height * 0.005,
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
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // هاد ال حقل الخاص ب ال password
                        TextFormField(
                          validator: (enteredPasswordVal) =>
                              enteredPasswordVal!.length < 8
                                  ? "Password is too short"
                                  : null,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: userPasswordVisibility,
                          controller: userPasswordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.vpn_key_sharp,
                              color: Colors.deepOrange,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.blue,
                              icon: userPasswordVisibility
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              // color: Colors.deepOrange,
                              onPressed: () => setState(
                                () => userPasswordVisibility =
                                    !userPasswordVisibility,
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
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // هاد ال حقل الخاص ب اعادة ال password
                        TextFormField(
                          validator: (enteredPasswordVal) =>
                              enteredPasswordVal != userPasswordController.text
                                  ? "re-Password isn't current"
                                  : null,
                          obscureText: userRePasswordVisibility,
                          controller: userRePasswordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.vpn_key_sharp,
                              color: Colors.deepOrange,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.blue,
                              icon: userRePasswordVisibility
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              // color: Colors.deepOrange,
                              onPressed: () => setState(
                                () => userRePasswordVisibility =
                                    !userRePasswordVisibility,
                              ),
                            ),
                            label: const Text(
                              "Re-Password",
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
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // هاد ال حقل الخاص ب رقم الهاتف
                        TextFormField(
                          validator: (enteredPhoneVal) =>
                              enteredPhoneVal!.length < 9
                                  ? "phone is too short"
                                  : null,
                          keyboardType: TextInputType.phone,
                          controller: userPhoneController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.deepOrange,
                            ),
                            label: Text(
                              "phone Number",
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
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        //هاد الزر اخر شي مننقل كلشي جوا ال on pressed
                        // buttonsOfAuthentication(context, 'Sign Up', (){
                        //   //هون لازم نضيف ال validator
                        //   //     // حاليا رح اتركو بتعليق مشات
                        //   //     // ما يعذبك وقت التجريب اخر شي بزبطو
                        //   //
                        //        final signupFormKeyCurrent = signUpFormKey.currentState!;
                        //         if(signupFormKeyCurrent.validate()){
                        //           // تابع ارسال البيانات
                        //            print("Test Request SignUp m");
                        //         }
                        //
                        //
                        // }),
                        //  هي كبسة ال signUp
                        // جوا ال onPressed منحط ال استدعاء تابع ارسال البيانات لل database
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

                                cubit.sign_Up_request(
                                  userNameController.text,
                                  userEmailController.text,
                                  userPasswordController.text,
                                  userRePasswordController.text,
                                  userPhoneController.text,
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
                                primary: Colors.blue,
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
                                    "Sign Up",
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
                            )),
                        /*
                        ElevatedButton(
                          onPressed: () {
                            //هون لازم نضيف ال validator
                            // حاليا رح اتركو بتعليق مشات
                            // ما يعذبك وقت التجريب اخر شي بزبطو
                            /*
                                final signUpFormKey = signupFormKey.currentState!;
                              if(signUpFormKey.validate()){

                                // تابع ارسال البيانات
                              }
                             */
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserLogInPage(),
                              ),
                            );
                            print("Test Request SignUp");
                            sign_Up().sign_Up_request(
                                userNameController.text,
                                userEmailController.text,
                                userPasswordController.text,
                                userRePasswordController.text,
                                userPhoneController.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.25,
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
                                "Sign Up",
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
                  );
  },
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
