import 'package:flutter/material.dart';
import 'package:project_mohammad/components/dash_board.dart';
import 'package:project_mohammad/Spam/home_pages/service_info_input_old_ver.dart';
import 'package:project_mohammad/services/choices.dart';
import 'package:project_mohammad/services/street_service_chooser.dart';

import '../../services/on_hold.dart';

class StreetServiceChoosing extends StatefulWidget {
  const StreetServiceChoosing({Key? key}) : super(key: key);

  @override
  _StreetServiceChoosingState createState() => _StreetServiceChoosingState();
}

class _StreetServiceChoosingState extends State<StreetServiceChoosing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DashBoard(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Select Street",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(150, 0, 0, 65),
      ),



      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "asset/images/background_picture.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(150, 60, 60, 80),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                Image.asset(
                  "asset/images/logo.png",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.095,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.716,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(180, 0, 0, 65),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),

                  child: ListView(children: selectStreet.map((tile) => BasicTileWidget(tile: tile,),).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

DateTime selectedTime = DateTime.now();
////هون



class _BasicTileWidgetState extends State<BasicTileWidget> {
  @override
  Widget build(BuildContext context) {
    final title = widget.tile.title;
    final servicesList = widget.tile.serviceChoosingList;
    if (servicesList.isEmpty) {
      return ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 26, color: Colors.white),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return OnHold(title: title,);
                return ServiceInformationInput(
                  gateName: title, both: [], listservice: [],
                );
              },
            ),
          );
        },
      );



























    } else {
      return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 3,
            color: Colors.blue,
          ),
        ),
        child: ExpansionTile(
          key: PageStorageKey(title),
          title: Text(
            title,
            style: const TextStyle(fontSize: 26, color: Colors.white),
          ),
          children: servicesList.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
    }
  }
}

class BasicTileWidget extends StatefulWidget {
  final ServiceChooser tile;

  const BasicTileWidget({
    Key? key,
    required this.tile,
  }) : super(key: key);

  @override
  _BasicTileWidgetState createState() => _BasicTileWidgetState();
}
