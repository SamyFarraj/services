import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/controller/User/work/Services_controller.dart';
import 'package:project_mohammad/authentication/admin_log_in_page.dart';
import 'package:project_mohammad/authentication/log_in_page.dart';
import 'package:project_mohammad/authentication/sign_up_page.dart';
import 'package:project_mohammad/project/admin/admin_requests_page.dart';
import 'package:project_mohammad/project/admin/block_service.dart';
import 'package:project_mohammad/project/admin/delete_service.dart';
import 'package:project_mohammad/project/edition/DEMO.dart';
import 'package:project_mohammad/project/edition/services_edition.dart';
import 'package:project_mohammad/project/home/dash_board_pages/Settings/change_password_page.dart';
import 'package:project_mohammad/project/home/dash_board_pages/Settings/edit_account_info.dart';
import 'package:project_mohammad/project/home/home_page.dart';
import 'package:project_mohammad/project/home/requests.dart';
import 'package:project_mohammad/project/home/service_info_input.dart';
import 'package:project_mohammad/project/home/service_management_page_choosing.dart';
import 'package:project_mohammad/project/home/services.dart';
import 'package:project_mohammad/services/on_hold.dart';

import 'Api/shredpreference.dart';
import 'project/projects_page.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 2));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Barton Malow",
        home: MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MyHomePage();
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getshared();
  }


  @override
  // Widget build(BuildContext context) => const DeleteService();
  Widget build(BuildContext context) =>  ProjectsPage();
}
