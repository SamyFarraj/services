import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '/Api/controller/Admin/add_new_admin_controller.dart';
import '/Api/model/show_admins_model.dart';
import '/project/constant.dart';
import '/services/choices.dart';
import '../../../Cubit/Admin Level Operation/admin_level_cubit.dart';
import '../../../components/snack_bar.dart';
import '../../../main.dart';

class RemoveAdmin extends StatefulWidget {
  const RemoveAdmin({Key? key}) : super(key: key);

  @override
  State<RemoveAdmin> createState() => _RemoveAdminState();
}

class _RemoveAdminState extends State<RemoveAdmin> {
  List<ShowAdmins> theUsersList = [];
  List<ShowAdmins> userLists = [];

  static List<ShowAdmins> parseAgents(String responseBody) {
    //Map<String,String>.from(oldMap)
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ShowAdmins>((json) => ShowAdmins.fromJson(json)).toList();
  }

  Future<List<ShowAdmins>> fetchData() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/Admin/ShowAllAdmins'),
      headers: {'Authorization': 'Bearer ${adminToken}'},
    );
    print('the statues is ${response.statusCode}');
    if (response.statusCode == 200) {
      // final List parsedList = json.decode(response.body);
      // List<MyReservations> list = parsedList.map((val) => MyReservations.fromJson(val)).toList();
      //  print("${response.body}");json.decode(response.body);
      List<ShowAdmins> list = parseAgents(response.body);
      return list;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  List<String> usersList = [];

  @override
  void initState() {
    if (addAdminList.length > 0) {
      addAdminList.length = 1;
    }
    // addAdminList.clear();
    // addAdminList.add('select');
    super.initState();
    fetchData().then((subjectFromServer) {
      setState(() {
        theUsersList = subjectFromServer;
        userLists = theUsersList;

        //   addAdminList=List.from(userLists)
        for (int i = 0; i < userLists.length; i++) {
          print("hdfg");
          addAdminList.add(userLists[i].name);
        }
      });
    });
  }

  String? selectedAdmin = 'Select Admin';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _appBarContent(),
        body: _bodyContent(),
      ),
    );
  }

  AppBar _appBarContent() => AppBar(
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
      );

  Widget _bodyContent() => Builder(builder: (context) {
  return Stack(
  children: <Widget>[
  // هاد container بيحوي صورة الخلفية
  _backgroundImage(),
  //هاد لون فوق الخلفية مشات وضوح الكتابة
  _colorCorrectionLayer(),

  _blocConsumer(),
  ],
  );
  });

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

  BlocConsumer _blocConsumer() => BlocConsumer<AdminLevelCubit, AdminLevelState>(
    listener: (context, state) {
      // TODO: implement listener
      _listener(context ,state);
    },
    builder: (context, state) {
      return Column(
        children: <Widget>[
          _logoImage(),
          _contentContainer(context ,state),
        ],
      );
    },
  );

  _listener(context , state) {
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

  Widget _contentContainer(context ,state) => Expanded(
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 40,),
      decoration: _contentContainerDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _dropDownButtonList(),

          _conditionalBuilder(context , state),
        ],
      ),
    ),
  );

  BoxDecoration _contentContainerDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(35),
      topRight: Radius.circular(35),
    ),
    color: Color.fromARGB(180, 0, 0, 65),
  );

  DropdownButtonFormField _dropDownButtonList() =>
      DropdownButtonFormField<String>(
        decoration: _dropDownListDecoration(),
        hint: _hintText(),
        items: addAdminList
            .map(
              (adminName) => DropdownMenuItem<String>(
                value: adminName,
                child: _itemsText(adminName),
              ),
            )
            .toList(),
        onChanged: (currentChoice) => setState(() {
          selectedAdmin = currentChoice!;
        }),
      );

  _dropDownListDecoration() => InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            width: 6.0,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      );

  Text _hintText() => _itemsText("Select Admin");

  ConditionalBuilder _conditionalBuilder(context , state) => ConditionalBuilder(
        condition: state is RefreshLevelState || state is AdminLevelInitial,
        builder: (context) => _removeAdminButton(),
        fallback: (context) => _fallBack(),
      );

  Widget _removeAdminButton() => ElevatedButton(
        onPressed: _onPressedFunction,
        style: _buttonStyle(),
        child: _buttonText(),
      );

  _onPressedFunction() {
    checkAdminDelete(selectedAdmin!);
    for (int i = 0; i < userLists.length; i++) {
      if (selectedAdmin == userLists[i].name) {
        AddNewAdminController.RemoveAdmin(userLists[i].id);
        break;
      }
    }

    // هون تابع حذف ادمن لازم ينحط
  }

  ButtonStyle _buttonStyle() => ElevatedButton.styleFrom(
        minimumSize: const Size(300, 60),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: MediaQuery.of(context).size.width * 0.2,
        ),
        backgroundColor: const Color.fromARGB(255, 150, 10, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 15.0,
      );

  _buttonText() => const Text(
        "Remove Admin",
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      );

  Widget _fallBack() => Center(
        child: CircularProgressIndicator(),
      );

  Text _itemsText(String title) => Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.blue),
      );

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
