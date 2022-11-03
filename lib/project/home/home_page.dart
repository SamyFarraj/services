import 'package:flutter/material.dart';
import 'package:project_mohammad/components/dash_board.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DashBoard(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBarContent(),
      body: _bodyContent(context),
    );
  }
  AppBar _appBarContent() => AppBar(
    centerTitle: true,
    title: _appBarTitle(),
    backgroundColor: const Color.fromARGB(150, 0, 0, 65),
  );

  Text _appBarTitle() => const Text(
    "Hudson's project",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 230, 84, 15),
    ),
  );

  Widget _bodyContent (BuildContext context) => SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Stack(
      children: <Widget>[
        _backgroundImage(),
        _colorCorrectionLayer(),
        _logoAndBackgroundColor(context),
        _projectImage(context),
      ],
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
    color: const Color.fromARGB(150, 60, 60, 80),
  );

  Widget _logoAndBackgroundColor(BuildContext context) => Column(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
      ),
      Image.asset(
        "asset/images/logo.png",
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.085,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.008,
      ),
      Container(
        color: const Color.fromARGB(140, 0, 0, 65),
        height: MediaQuery.of(context).size.height * 0.777,
      )
    ],
  );

  Widget _projectImage(BuildContext context) => Column(
    children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.26,
      ),
      Image.asset(
        "asset/images/project_picture.png",
        height: MediaQuery.of(context).size.height * 0.63,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ],
  );




}
