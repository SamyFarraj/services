import 'package:flutter/material.dart';

import 'screen_chooser.dart';

bool admin = false;

class ProjectsPage extends StatefulWidget {
  bool isAdmin = false;
   ProjectsPage(this.isAdmin) {
     admin=isAdmin;
   }


  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}


class _ProjectsPageState extends State<ProjectsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBarContent(),
      body: Stack(
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
            color: const Color.fromARGB(150, 60, 60, 100),
          ),
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Image.asset(
                "asset/images/logo.png",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.095,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    color: Color.fromARGB(180, 0, 0, 65)),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 0, 60, 190),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return const ScreenChooser();
                              },
                            ),
                          );
                        },
                        splashColor: Colors.white,
                        hoverColor: Colors.blue,
                        child: Column(
                          children: <Widget>[
                            Ink.image(
                              image: const AssetImage(
                                  'asset/images/HDS_WoodWard_Elev.png'),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  'asset/images/HDS_WoodWard_Elev.png',
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.8,
                              fit: BoxFit.contain,
                            ),
                            const Text(
                              "Hudson's Site Development",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  AppBar _appBarContent () => AppBar(
    centerTitle: true,
    title: _appBarTitle(),
    backgroundColor: const Color.fromARGB(80, 0, 30, 70),
  );

  Text _appBarTitle() => const Text(
    "Select Project",
    style: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      fontStyle: FontStyle.italic,
      color: Colors.deepOrange,
    ),
  );
}
