import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/controller/Admin/account.dart';
import 'package:project_mohammad/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/controller/User/account_user.dart';
import '../authentication/choose_auth_type.dart';
import '../project/home/dash_board_pages/General/contact_us.dart';
import '../project/home/dash_board_pages/Settings/dashboard_verification_code_page.dart';
import '../project/home/dash_board_pages/Settings/edit_account_info.dart';

final generalDashboardList = [
  "Contact Us",
];
final settingsDashboardList = [
  "Change Password",
  "Edit Account Info",
  "logout",
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
  Future<String> checkAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('tokenUser','');
    await  prefs.setString('tokenAdmin','');

    return '';
  }
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
          "not",
          style: TextStyle(fontSize: 22, color: Colors.blue),
        );
        if (title == "Contact Us") {
          page = const ContactUs();
        } else if (title == "Change Password") {
          page = const DashBoardVerificationCodePage(
            correctVerificationCode: '2',
          );
        } else if (title == "Edit Account Info") {
          page = const EditAccountInfo();
        }
        if (title == "logout") {
          if(adminToken!=''){
<<<<<<< HEAD
            
=======
>>>>>>> d78ccfe1f90cae1e39628346e5e1beb3a0194e13
            account.logoutAdmin();
            checkAuthenticated();
          }
          else
<<<<<<< HEAD
            {
              account.logoutUser();
                checkAuthenticated();
            }

page= const AuthChoosingPage();
=======
          {
            account.logoutUser();
            checkAuthenticated();
          }

          page= const AuthChoosingPage();
>>>>>>> d78ccfe1f90cae1e39628346e5e1beb3a0194e13

        }
        Navigator.of(context).push(
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
