import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _appBarContent(),
        body: _bodyContent(context),
      ),
    );
  }

  AppBar _appBarContent() => AppBar(
        centerTitle: true,
        title: _appBarTitle(),
        backgroundColor: const Color.fromARGB(150, 0, 0, 65),
      );

  Text _appBarTitle() => const Text(
        "Contact Us",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Color.fromARGB(255, 230, 84, 15),
        ),
      );

  Widget _bodyContent(BuildContext context) => Stack(
    children: <Widget>[
      _backgroundImage(),
      Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: const Color.fromARGB(150, 60, 60, 100),
      ),
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _logoContent(context),
            _backgroundColorContainer(context),
          ],
        ),
      ),
    ],
  );

  Widget _backgroundImage () => SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Image.asset(
      "asset/images/background_picture.png",
      fit: BoxFit.cover,
    ),
  );

  Widget _logoContent (BuildContext context) => Column(
    children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
      ),
      Image.asset(
        "asset/images/logo.png",
        width: 200,
        height: 80,
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );

  Widget _backgroundColorContainer (BuildContext context) => Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 1.211,
    color: const Color.fromARGB(180, 0, 0, 65),
    child: Column(
      children: [
        _allContactContainer(context),
        const SizedBox(
          height: 30,
        ),
      ],
    ),
  );

  Widget _allContactContainer (BuildContext context) => Container(
    height: MediaQuery.of(context).size.height * 1.15,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(35),
      border: Border.all(
        color: Colors.blue,
        // color: const Color.fromARGB(255, 230, 84, 15),
        width: 5,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _siteLocation(context),
        _adminsContactPhones(context),
        _openingHours(),
      ],
    ),
  );

  Widget _siteLocation(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _iconInfo(Icons.location_pin),
          _locationData(context),
        ],
      );

  Widget _locationData(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.33,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _textInfo(
              "1410 Farmer St.",
              28,
            ),
            _textInfo(
              "Detriot, MI 48226",
              24,
            ),
            _textInfo(
              "Barton Malow - Hudson Field Office",
              24,
            ),
            _textInfo(
              "United States",
              24,
            ),
          ],
        ),
      );

  Widget _adminsContactPhones(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _iconInfo(Icons.phone),
          _adminsContactData(context),
        ],
      );

  Widget _adminsContactData(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.36,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _textInfo(
              "Chad Beldyga \n (586) 630-1019  ",
              29,
            ),
            _textInfo(
              "Rick Evans \n (313) 363-0474",
              29,
            ),
            _textInfo(
              "Zack Pung \n (248) 331-6893",
              29,
            ),
            _textInfo(
              "Dominic Lmbardo \n (412) 818-5782",
              29,
            ),
          ],
        ),
      );

  Widget _openingHours() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _iconInfo(Icons.access_time),
          _textInfo(
            "06:00 Am - 06:00 PM",
            25,
          ),
        ],
      );

  Icon _iconInfo(IconData icon) => Icon(
        icon,
        size: 40,
        color: Colors.white,
      );

  Text _textInfo(String text, int fontSize) => Text(
        text,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          wordSpacing: 5,
          height: 1.5,
        ),
      );
}
