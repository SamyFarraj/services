import 'package:project_mohammad/project/admin/add_new_admin.dart';
import 'package:project_mohammad/project/admin/add_new_service.dart';
import 'package:project_mohammad/project/admin/admin_control_panel.dart';
import 'package:project_mohammad/project/admin/admin_requests_page.dart';
import 'package:project_mohammad/project/admin/block_service.dart';
import 'package:project_mohammad/project/admin/delete_service.dart';
import 'package:project_mohammad/project/admin/un_block_service.dart';
import 'package:project_mohammad/project/home/account_settings.dart';
import 'package:project_mohammad/project/home/home_page.dart';
import 'package:project_mohammad/project/home/requests.dart';
import 'package:project_mohammad/project/home/screen_chooser.dart';
import 'package:project_mohammad/project/home/services.dart';
import 'package:project_mohammad/project/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:project_mohammad/services/change_passowrd_page.dart';
import 'package:project_mohammad/services/edit_account_info.dart';
import 'package:project_mohammad/services/on_hold.dart';

import 'authentication/admin_log_in_page.dart';
import 'authentication/sign_up_page.dart';

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
  Widget build(BuildContext context) =>  BlockService();
}
