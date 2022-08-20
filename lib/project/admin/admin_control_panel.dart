import 'package:flutter/material.dart';
import 'package:project_mohammad/components/dash_board.dart';
import 'package:project_mohammad/project/admin/admins_manage/add_new_admin.dart';
import 'package:project_mohammad/project/admin/admins_manage/remove_admin.dart';

import '../../components/buttons.dart';
import 'services_manage/add_new_service.dart';
import 'services_manage/block_service.dart';
import 'services_manage/delete_service.dart';
import 'service_calender.dart';
import 'services_manage/un_block_service.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Control Panel",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontStyle: FontStyle.italic,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(180, 0, 0, 65),
      ),
      body: Stack(
        children: <Widget>[
          // هاد container بيحوي صورة الخلفية
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "asset/images/background_picture.png",
              fit: BoxFit.cover,
            ),
          ),
          //هاد لون فوق الخلفية مشات وضوح الكتابة
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(150, 60, 60, 100),
          ),

          SingleChildScrollView(
            child: Column(
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
                SingleChildScrollView(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget panelGridView() {
    final controlPanelButtonsList = [
      buttonsOfControlPanel(context, const AddNewService(), "Add", "service"),
      buttonsOfControlPanel(
          context, const DeleteService(), "Delete", "service"),
      buttonsOfControlPanel(context, const BlockService(), "Block", "service"),
      buttonsOfControlPanel(
          context, const UnBlockService(), "UnBlock", "service"),
      buttonsOfControlPanel(context, const AddNewAdmin(), "Add", "Admin"),
      buttonsOfControlPanel(context, const RemoveAdmin(), "Delete", "Admin"),
      buttonsOfControlPanel(
          context, const ServiceCalender(), "Services", "Calendar"),
    ];
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
