import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contact Us",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 230, 84, 15),
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
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                color: const Color.fromARGB(150, 60, 60, 100),
              ),
            ),
            SingleChildScrollView(
              child: Column(
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
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1.211,
                    color: const Color.fromARGB(180, 0, 0, 65),
                    child: Column(
                      children: [
                        Container(
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
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                ),
                                child: Column(
                                  children: const <Widget>[
                                    SizedBox(
                                      height: 65,
                                    ),
                                    Icon(
                                      Icons.location_pin,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 210,
                                    ),
                                    Icon(
                                      Icons.phone,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 410,
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 300,
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text(
                                      "Contact Info",
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "1410 Farmer St.",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Detriot, MI 48226",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Barton Malow - Hudson Field Office",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "United States",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Text(
                                      ''' (586) 630-1019 - Chad Beldyga. 
                                          (313) 363-0474 - Rick Evans.
                                          (248) 331-6893 - Zack Pung.
                                          (412) 818-5782 - Dominic Lmbardo.
                                      ''',
                                      style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Text(
                                      "06:00 Am - 06:00 PM",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(180, 0, 0, 65),
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
