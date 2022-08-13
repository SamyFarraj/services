import 'package:flutter/material.dart';
import 'package:project_mohammad/authentication/choose_auth_type.dart';

import 'Api/shredpreference.dart';
import 'project/projects_page.dart';
import 'splash_screen.dart';


Future main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await splashSc();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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

//  Widget build(BuildContext context) =>  AdminLogInPage();

Widget build(BuildContext context) =>  ProjectsPage();
}
