import 'package:flutter/material.dart';
import 'package:project_mohammad/project/dash_board_components/General/contact_us.dart';
import 'package:project_mohammad/project/dash_board_components/Settings/account_settings.dart';
import 'package:project_mohammad/project/dash_board_components/Settings/change_password_page.dart';
import 'package:project_mohammad/project/dash_board_components/Settings/edit_account_info.dart';

final generalDashboardList = [
  "Contact Us",
];
final settingsDashboardList = [
  "Account Settings",
  "Change Password",
  "Edit Account Info",
];

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(150, 0, 0, 65),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            children: const <Widget>[
              Text(
                "General",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 3,
            color: Colors.blue,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: const BoxDecoration(
              // color: Color.fromARGB(180, 0, 0, 65),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: ListView(
              children: generalDashboardList
                  .map(
                    (tile) => BasicTileWidget(
                      tile: tile,
                    ),
                  )
                  .toList(),
            ),
          ),
          Row(
            children: const <Widget>[
              Text(
                "settings",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 3,
            color: Colors.blue,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.216,
            decoration: const BoxDecoration(
              // color: Color.fromARGB(180, 0, 0, 65),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: ListView(
              children: settingsDashboardList
                  .map(
                    (tile) => BasicTileWidget(
                  tile: tile,
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BasicTileWidget extends StatefulWidget {
  final String tile;

  const BasicTileWidget({
    Key? key,
    required this.tile,
  }) : super(key: key);

  @override
  _BasicTileWidgetState createState() => _BasicTileWidgetState();
}

class _BasicTileWidgetState extends State<BasicTileWidget> {
  @override
  Widget build(BuildContext context) {
    final title = widget.tile;

    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 26, color: Colors.white),
      ),
      onTap: () {
        Widget page = const Text(
          "not ",
          style: TextStyle(fontSize: 22, color: Colors.blue),
        );
        if (title == "Contact Us") {
          page = const ContactUs();
        } else if(title == "Account Settings"){
          page = const AccountSettings();
        } else if(title == "Change Password"){
          page = const ChangePasswordPage();
        } else if(title == "Edit Account Info"){
          page = const EditAccountInfo();
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return page;
            },
          ),
        );
      },
    );
  }
}
