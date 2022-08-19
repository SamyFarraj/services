import 'package:flutter/material.dart';
import 'package:project_mohammad/authentication/choose_auth_type.dart';
import 'package:project_mohammad/project/admin/delete_service.dart';
import 'package:project_mohammad/project/edition/service_info_new_ed.dart';
import 'package:project_mohammad/project/edition/services_edition.dart';

import 'Api/shredpreference.dart';
import 'project/projects_page.dart';
//import 'splash_screen.dart';
String tokenUser='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTM3MTVmNTA3MDc5ODhjNDQxMGJhODA3NjVlNzEwNGQwYTExYWRkMzIxOWY0YTA3ZDQ4ZmRhNWZhYjFiMTAzNTU3MjE0NTc5YjkyMTVmYzgiLCJpYXQiOjE2NTY1NDM0MzEuNjczMTEyLCJuYmYiOjE2NTY1NDM0MzEuNjczMTE2LCJleHAiOjE2ODgwNzk0MzEuNjY2OTc5LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bcUsdGdE_kADK3JewonGItp4c53U90unMqGFG4z3KUQF_ZGivNOvclpf9le-gGxs5Cd-aX6EAjxe1yuqs36N5O5GE2yeSph5eac3VtfktIWHc5Z7vwJNohoRG6P2UHFVFIPdRLXgVbRrG8Zo6FB_nRoS5_1u_l1yCa46jL0JxSZEObpVe1hYcaa-CmnJXx5Zm-ot-aqOOD5Dcb06qdoTaYc1UCl8fEnzZU4-1lEeVys7dgiARNniJqWshVo3rRJ25_P8m4O4YIUtP_WPcs2AqZoDdVv96Uc1R2FZbDekiM-GV1QN7dckodMpziToIUkJKc2Lg8psi9D7BiBYrn419rYi6ib3X0SbkQSokzJns5sYp7vZafXpMbd0NXqfVspJixhdaJHmsUfOMl0enbM2h6Y8SZ1XFlJfR9bykPikSbdFeVceI5Yhy5AlZNyCoWXg5O-3RkLugAzLXvK4YgD6MX0hsGnOoUWNgU8uDP8Z9YIPAZQyGAcdIpAmz6uZGi_jSt8Kk5cwkBM8RLvOx1ODX9ZO4f0-W_Q4qCSts247ZpmEkli2dSlgzRJLi476cc8T_usiHhE2Ejecxf1EWwegfwr2P-FaMyOasYf8cCs9qgzljVq7wMNWn1FDBSO2MxlNxGecMFM5megpUbg9tNssJa77ZVebfWXLDuaWPlOIap4';

String tokenAdmin='';

Future main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//  await splashSc();
  // WidgetsFlutterBinding.ensureInitialized();
  tokenUser='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTM3MTVmNTA3MDc5ODhjNDQxMGJhODA3NjVlNzEwNGQwYTExYWRkMzIxOWY0YTA3ZDQ4ZmRhNWZhYjFiMTAzNTU3MjE0NTc5YjkyMTVmYzgiLCJpYXQiOjE2NTY1NDM0MzEuNjczMTEyLCJuYmYiOjE2NTY1NDM0MzEuNjczMTE2LCJleHAiOjE2ODgwNzk0MzEuNjY2OTc5LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bcUsdGdE_kADK3JewonGItp4c53U90unMqGFG4z3KUQF_ZGivNOvclpf9le-gGxs5Cd-aX6EAjxe1yuqs36N5O5GE2yeSph5eac3VtfktIWHc5Z7vwJNohoRG6P2UHFVFIPdRLXgVbRrG8Zo6FB_nRoS5_1u_l1yCa46jL0JxSZEObpVe1hYcaa-CmnJXx5Zm-ot-aqOOD5Dcb06qdoTaYc1UCl8fEnzZU4-1lEeVys7dgiARNniJqWshVo3rRJ25_P8m4O4YIUtP_WPcs2AqZoDdVv96Uc1R2FZbDekiM-GV1QN7dckodMpziToIUkJKc2Lg8psi9D7BiBYrn419rYi6ib3X0SbkQSokzJns5sYp7vZafXpMbd0NXqfVspJixhdaJHmsUfOMl0enbM2h6Y8SZ1XFlJfR9bykPikSbdFeVceI5Yhy5AlZNyCoWXg5O-3RkLugAzLXvK4YgD6MX0hsGnOoUWNgU8uDP8Z9YIPAZQyGAcdIpAmz6uZGi_jSt8Kk5cwkBM8RLvOx1ODX9ZO4f0-W_Q4qCSts247ZpmEkli2dSlgzRJLi476cc8T_usiHhE2Ejecxf1EWwegfwr2P-FaMyOasYf8cCs9qgzljVq7wMNWn1FDBSO2MxlNxGecMFM5megpUbg9tNssJa77ZVebfWXLDuaWPlOIap4';
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
