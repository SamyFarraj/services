import 'package:flutter/material.dart';

import 'Api/shred_preference.dart';
import 'project/projects_page.dart';
//import 'splash_screen.dart';

String userToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYThhNzI1OTU3MmRhMWNiNDAxYjE2YTk4Y2ZjN2FlZjY5M2VmMzNmMzY4ODdiMTc1MDhmYTViM2QzZjBmNGRhOTRhNzhiMWFlNTI1YzhkODciLCJpYXQiOjE2NjE2MTA3MDMuMTI5NjA4LCJuYmYiOjE2NjE2MTA3MDMuMTI5NjEzLCJleHAiOjE2OTMxNDY3MDMuMDE2NjgyLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.WeeCDfWhI49KXnzIPVrERjE6sq9DONRBH7y55UudgkNIzn0l3Cqmygm-ZN8CQqlHLx-TE8Q8DCmB7PWFeV3_LGoG_FWeU6gvmfqU5PwM9GaTs7JDSO0mkaFrWj8P4SvhPHbPHEv4MaochMF20cASl4d060yveT1pEblNqcHenW4r-vCTLr2tORG4Qg2Oq-ECbM-42fcpuvFdkpzkxmm4wuCgf95W1kUd6rshrRYIgA_i9_ol6JRDELdoJylPKKcm9k7cj48xGI0moaWdapJ1W1q-1XB4d7PT8CIPS4MXKxJcc0tTqO5WP0VJCNxdGzCN207Is5XRK1jLRCL7HYSjFBCsn6-eLmWuHv_1Ke3fUcH_4V6ZgWEpW-JnBH8pkUEyzOq2kQuV_x6Cm30oQ4I6o38Yjyn6q0LVYZDXogCPEnjJs_JyxN9Y6wvR94nwl4ZuMvhCcgra5DiLlVyPYt0wa1EbWXQZG8hkyhAVeMkUVpY7UV4q4easpTfLGZc9YQP8-vAqzI42nkRboSXEat08EuWjVDiRT3-d-F1MXi6WKQ10h2v8TfibdDGFUZUl7arZpH7wSmZkEpWnSYPOEIFzBv-GuIqM_pJDXxuQzxSpwcjkS-lqYjsy3IfvwzLhcZ5srfDuOt7tulPGEl5WeOTIX67oQpaRZ4dv31kMqvHcXHI';

String adminToken = '';

Future main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//  await splashSc();
  // WidgetsFlutterBinding.ensureInitialized();
  userToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYThhNzI1OTU3MmRhMWNiNDAxYjE2YTk4Y2ZjN2FlZjY5M2VmMzNmMzY4ODdiMTc1MDhmYTViM2QzZjBmNGRhOTRhNzhiMWFlNTI1YzhkODciLCJpYXQiOjE2NjE2MTA3MDMuMTI5NjA4LCJuYmYiOjE2NjE2MTA3MDMuMTI5NjEzLCJleHAiOjE2OTMxNDY3MDMuMDE2NjgyLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.WeeCDfWhI49KXnzIPVrERjE6sq9DONRBH7y55UudgkNIzn0l3Cqmygm-ZN8CQqlHLx-TE8Q8DCmB7PWFeV3_LGoG_FWeU6gvmfqU5PwM9GaTs7JDSO0mkaFrWj8P4SvhPHbPHEv4MaochMF20cASl4d060yveT1pEblNqcHenW4r-vCTLr2tORG4Qg2Oq-ECbM-42fcpuvFdkpzkxmm4wuCgf95W1kUd6rshrRYIgA_i9_ol6JRDELdoJylPKKcm9k7cj48xGI0moaWdapJ1W1q-1XB4d7PT8CIPS4MXKxJcc0tTqO5WP0VJCNxdGzCN207Is5XRK1jLRCL7HYSjFBCsn6-eLmWuHv_1Ke3fUcH_4V6ZgWEpW-JnBH8pkUEyzOq2kQuV_x6Cm30oQ4I6o38Yjyn6q0LVYZDXogCPEnjJs_JyxN9Y6wvR94nwl4ZuMvhCcgra5DiLlVyPYt0wa1EbWXQZG8hkyhAVeMkUVpY7UV4q4easpTfLGZc9YQP8-vAqzI42nkRboSXEat08EuWjVDiRT3-d-F1MXi6WKQ10h2v8TfibdDGFUZUl7arZpH7wSmZkEpWnSYPOEIFzBv-GuIqM_pJDXxuQzxSpwcjkS-lqYjsy3IfvwzLhcZ5srfDuOt7tulPGEl5WeOTIX67oQpaRZ4dv31kMqvHcXHI';
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
    getSharedData();
  }

  @override
  Widget build(BuildContext context) => ProjectsPage();
}
