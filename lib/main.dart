import 'package:flutter/material.dart';

import 'project/edition/service_info_new_ed.dart';
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


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  // Widget build(BuildContext context) => const DeleteService();
  Widget build(BuildContext context) => const ProjectsPage();
// Widget build(BuildContext context) => ServiceInfoInputNewEd(
//   gateName: "mod Gate",
// );

}
