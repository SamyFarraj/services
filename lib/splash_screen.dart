import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'authentication/log_in_page.dart';
import 'project/projects_page.dart';

Future splashSc()async{
  return FlutterNativeSplash.removeAfter(await initialization);
}
Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(milliseconds: 800));

}
    String token = "Token val";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    if(token == "Token val")
      return ProjectsPage();
    return LogInPage();
  }
}
