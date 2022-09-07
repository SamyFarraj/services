import 'package:flutter/material.dart';

import 'Api/shred_preference.dart';
import 'project/projects_page.dart';
//import 'splash_screen.dart';

String userToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWQwZjA2NTVmM2UzYTNjN2JjMTVkZmI5ODRkYzEyODIyODQyNTUzNTI5ZDY3ZjlhYmM5YWFhZGYyMWJhZWM1ODYwZjhlZjJlOTI3Mjg2YzgiLCJpYXQiOjE2NjE0NDAwMjcuNDUxMzksIm5iZiI6MTY2MTQ0MDAyNy40NTEzOTUsImV4cCI6MTY5Mjk3NjAyNy4zNDc0MjMsInN1YiI6IjQiLCJzY29wZXMiOltdfQ.Pr5ayF7QkxpTnpc4BCRUXWq0-MOCGisnfY6qMLuLPazh0HsQv6Ukr8jN2muAqGDgaFPxwArS98BZwyW57EQrfSbS7WKCd3ZLQHdJIjJEvYakt0RzGvS_62I21upDugLkCz15XKeTZeQQ6D0wKcGBpfQ5QbC_IdR-PVRE_WKfTD2hD_-U_hv6UUI_7b1noGIyrj3jKWyIiWgZIWXou36VtEPAh2SvGkIvpoeUNQWVxJ8qf3DLmSQw1ZoMwf3rNDtDrUglftVMtOPI3XPdN6ZyzbzjcU1dJjld7jARU0X0Js18bPnCNn75yfk3ExgDzidf4t-TAHWbiVeSJtFKRdndqOT2FkiGIVZuI3zVcf1baBxqUYLJ062iv3iaYbnxkCDwiBnMyhpiUnfC6xH1B-UhgYuZitnzpqfPSQa-3J2l7u_Q8HfSMPaOqGrZ0PFkeE7ebTKZwKvKjXadcuJebNsA8qLCL3dortpjRhlJZpgQ09wfsFN2UbE2PqT4N5_Df0skaqvnBDjXA1HMtqxkcVmDYA4YGxjRnR1m_AFp29wawbouupy31CoKwIW-oNotBwO7X10b2Z3typLdDjs1SYBCIbYpI6MZ5lGUlJOS29Ks75OlwKrskna9j6IgqXz7rDlBlb-05RRl-NEfluhJ47Q3f1k1XW7xJIlTHrfuyDrRdRU';

String adminToken = '';

Future main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//  await splashSc();
  // WidgetsFlutterBinding.ensureInitialized();
  userToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWQwZjA2NTVmM2UzYTNjN2JjMTVkZmI5ODRkYzEyODIyODQyNTUzNTI5ZDY3ZjlhYmM5YWFhZGYyMWJhZWM1ODYwZjhlZjJlOTI3Mjg2YzgiLCJpYXQiOjE2NjE0NDAwMjcuNDUxMzksIm5iZiI6MTY2MTQ0MDAyNy40NTEzOTUsImV4cCI6MTY5Mjk3NjAyNy4zNDc0MjMsInN1YiI6IjQiLCJzY29wZXMiOltdfQ.Pr5ayF7QkxpTnpc4BCRUXWq0-MOCGisnfY6qMLuLPazh0HsQv6Ukr8jN2muAqGDgaFPxwArS98BZwyW57EQrfSbS7WKCd3ZLQHdJIjJEvYakt0RzGvS_62I21upDugLkCz15XKeTZeQQ6D0wKcGBpfQ5QbC_IdR-PVRE_WKfTD2hD_-U_hv6UUI_7b1noGIyrj3jKWyIiWgZIWXou36VtEPAh2SvGkIvpoeUNQWVxJ8qf3DLmSQw1ZoMwf3rNDtDrUglftVMtOPI3XPdN6ZyzbzjcU1dJjld7jARU0X0Js18bPnCNn75yfk3ExgDzidf4t-TAHWbiVeSJtFKRdndqOT2FkiGIVZuI3zVcf1baBxqUYLJ062iv3iaYbnxkCDwiBnMyhpiUnfC6xH1B-UhgYuZitnzpqfPSQa-3J2l7u_Q8HfSMPaOqGrZ0PFkeE7ebTKZwKvKjXadcuJebNsA8qLCL3dortpjRhlJZpgQ09wfsFN2UbE2PqT4N5_Df0skaqvnBDjXA1HMtqxkcVmDYA4YGxjRnR1m_AFp29wawbouupy31CoKwIW-oNotBwO7X10b2Z3typLdDjs1SYBCIbYpI6MZ5lGUlJOS29Ks75OlwKrskna9j6IgqXz7rDlBlb-05RRl-NEfluhJ47Q3f1k1XW7xJIlTHrfuyDrRdRU';
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
