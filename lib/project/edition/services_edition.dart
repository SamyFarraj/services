import 'package:flutter/material.dart';
import 'package:project_mohammad/components/dash_board.dart';
import 'package:project_mohammad/project/home/service_info_input.dart';
import 'package:project_mohammad/services/choices.dart';

class ServiceEdition extends StatefulWidget {
  const ServiceEdition({Key? key}) : super(key: key);

  @override
  _ServiceEditionState createState() => _ServiceEditionState();
}

class _ServiceEditionState extends State<ServiceEdition> {
  @override
  Widget build(BuildContext context) {
    String selectedService = 'Select Service';
    String selectedStreet = "Select Street";
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 3.7,
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              value: selectedStreet,
                              items: streetEdition
                                  .map(
                                    (street) => DropdownMenuItem<String>(
                                      value: street,
                                      child: Text(
                                        street,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (street) => setState(
                                () {
                                  selectedStreet = street!;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 6.0,
                                      color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                value: selectedService,
                                items: gatesEdition
                                    .map(
                                      (service) => DropdownMenuItem<String>(
                                        value: service,
                                        child: Text(
                                          service,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (service) {
                                  return setState(() {
                                    selectedService = service!;
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => ServiceInformationInput(
                                            gateName: selectedService),
                                      ),
                                    );
                                  });
                                }),
                          ),
                        ],
                      ),
                    )
                    // ListView(
                    //   children: selectStreet
                    //       .map(
                    //         (tile) => BasicTileWidget(
                    //       tile: tile,
                    //     ),
                    //   )
                    //       .toList(),
                    // ),
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

/*

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
                return ServiceInformationInput(
                  gateName: title,
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
          children:
          servicesList.map((tile) => BasicTileWidget(tile: tile)).toList(),
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

 */
