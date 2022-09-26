import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/services/choices.dart';
import '../../../Api/controller/Admin/add_new_admin_controller.dart';
import '../../../Cubit/Admin Level Operation/admin_level_cubit.dart';
import '../../../components/snack_bar.dart';

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
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: _appBarContent(),
          body: _bodyContent()),
    );
  }

  AppBar _appBarContent() => AppBar(
        centerTitle: true,
        title: _appBarTitle(),
        backgroundColor: const Color.fromARGB(180, 0, 0, 65),
      );

  Widget _appBarTitle() => const Text(
        "Add Admin",
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
          fontStyle: FontStyle.italic,
          color: Colors.deepOrange,
        ),
      );

  _bodyContent() => Builder(
        builder: (context) {
          return Stack(
            children: <Widget>[
              // هاد container بيحوي صورة الخلفية
              _backgroundImage(),
              //هاد لون فوق الخلفية مشات وضوح الكتابة
              _colorCorrectionLayer(),
              _form(),
            ],
          );
        },
      );

  Form _form() => Form(
        key: addAdminFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _logoImage(),
              _contentContainer(),
            ],
          ),
        ),
      );

  Widget _backgroundImage() => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "asset/images/background_picture.png",
          fit: BoxFit.cover,
        ),
      );

  Widget _colorCorrectionLayer() => Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(150, 60, 60, 100),
      );

  Widget _logoImage() => Column(
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
        ],
      );

  Widget _contentContainer() => Container(
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
        child: _blocConsumer(),
      );

  _blocConsumer() => BlocConsumer<AdminLevelCubit, AdminLevelState>(
        listener: (context, state) => _listener(context, state),
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _adminEmailField(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                _conditionBuilder(state),
              ],
            ),
          );
        },
      );

  _listener(context, state) {
    // TODO: implement listener
    if (state is SuccessStatus) {
      Navigator.pop(context);
      print("success");
    }

    //في حال دخل كلمة سر خطأ
    if (state is FailureStatus) {
      //هون حط توست ماسج انو كلمة السر غلط
      print("رسالة الخطأ ");
    }
  }

  Widget _fallBack() => Center(child: CircularProgressIndicator());

  Widget _adminEmailField() => TextFormField(
        validator: (enteredEmailVal) =>
            enteredEmailVal != null && !EmailValidator.validate(enteredEmailVal)
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
      );

  _conditionBuilder(state) => ConditionalBuilder(
        condition: state is RefreshLevelState || state is AdminLevelInitial,
        builder: (context) => _addAdminButton(context),
        fallback: (context) => _fallBack(),
      );

  ElevatedButton _addAdminButton(BuildContext context) => ElevatedButton(
        onPressed: _buttonOnPressed,
        style: _buttonStyle(),
        child: _buttonText(),
      );

  _buttonOnPressed() {
    final formKey = addAdminFormKey.currentState!;
    if (formKey.validate()) {
      // تباع الارسال
      // checkNewAdmin(adminEMailController.text);
      checkNewAddAdminRequest();
      AddNewAdminController.addNewAdmin(adminEMailController.text);
    }
  }

  ButtonStyle _buttonStyle() => ElevatedButton.styleFrom(
        minimumSize: const Size(300, 60),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: MediaQuery.of(context).size.width * 0.2,
        ),
        backgroundColor: const Color.fromARGB(
          255,
          10,
          150,
          10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 15.0,
      );

  Text _buttonText() => const Text(
        "Add Admin",
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      );

  bool checkNewAddAdminRequest() {
    if (_checkNewAdmin(
      adminEMailController.text,
    )) {
      addAdminList.add(
        adminEMailController.text,
      );
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
    } else if (adminEMail.length < 8) {
      TheSnackBar(context, 'E-Mail Is Too Short',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      for (var admin in addAdminList) {
        if (adminEMail == admin) {
          TheSnackBar(context, 'Admin E-mail Exited',
              const Color.fromARGB(255, 150, 10, 10));
          return false;
        }
      }
      //    addAdminList.add(adminName);
      TheSnackBar(context, 'Admin Added Successfully',
          const Color.fromARGB(255, 10, 150, 10));
      return true;
    }
  }
}
