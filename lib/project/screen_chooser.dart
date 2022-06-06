import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home/service_management_page_choosing.dart';
import 'home/home_page.dart';
import 'home/requests.dart';

class ScreenChooser extends StatefulWidget {
  const ScreenChooser({Key? key}) : super(key: key);

  @override
  _ScreenChooserState createState() => _ScreenChooserState();
}

class _ScreenChooserState extends State<ScreenChooser> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 1;

  final screens = [
    const ServiceManagementPageChooser(),
    const HomePage(),
    const Requests(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.format_list_bulleted,
        size: 40,
      ),
      const Icon(
        Icons.home,
        size: 40,
      ),
      const Icon(
        Icons.request_page,
        size: 40,
      ),
    ];
    return Scaffold(
      body: screens[index],
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          items: items,
          index: index,
          height: 60,
          color: const Color.fromARGB(190, 0, 20, 145),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.fastLinearToSlowEaseIn,
          onTap: (index) => setState(
            () {
              this.index = index;
            },
          ),
        ),
      ),
    );
  }
}
