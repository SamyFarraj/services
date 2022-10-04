import 'package:flutter/material.dart';

import '/components/dash_board.dart';
import 'control_panel_list.dart';

//هدول ال imports تبع ال staff
// import 'add_new_staff.dart';
// import 'delete_staff.dart';
//وهي لل add admin
// import 'add_new_admin.dart';

class AdminControlPanel extends StatefulWidget {
  const AdminControlPanel({Key? key}) : super(key: key);

  @override
  State<AdminControlPanel> createState() => _AdminControlPanelState();
}

class _AdminControlPanelState extends State<AdminControlPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DashBoard(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBarContent(),
      body: _bodyContent(),
    );
  }

  AppBar _appBarContent() => AppBar(
        centerTitle: true,
        title:_appBarTitle(),
        backgroundColor: const Color.fromARGB(180, 0, 0, 65),
      );

  Text _appBarTitle() => const Text(
    "Control Panel",
    style: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      fontStyle: FontStyle.italic,
      color: Colors.deepOrange,
    ),
  );

  Widget _bodyContent() => Stack(
    children: <Widget>[
      // هاد container بيحوي صورة الخلفية
      _backgroundImage(),
      //هاد لون فوق الخلفية مشات وضوح الكتابة
      _colorCorrectionLayer(),

      Column(
        children: <Widget>[
          _logoImage(),
          _controlPanelBody(),
        ],
      ),
    ],
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

  Widget _controlPanelBody() => SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.fromLTRB(
        10,
        0.0005,
        10,
        10,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.703,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Color.fromARGB(180, 0, 0, 65),
      ),
      child: panelGridView(),
    ),
  );

  Widget panelGridView() {
    List controlPanelButtonsList = controlPanelButtons(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final currentButton = controlPanelButtonsList[index];
        return buildButton(currentButton);
      },
      itemCount: 7,
    );
  }

  Widget buildButton(currentButton) => GridTile(
        child: Center(
          child: currentButton,
        ),
      );
}
