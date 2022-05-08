import 'package:flutter/material.dart';
import 'package:project_mohammad/Api/controller/Admin/add_service_controller.dart';
import 'package:project_mohammad/services/choices.dart';

class AddNewService extends StatefulWidget {
  const AddNewService({Key? key}) : super(key: key);

  @override
  State<AddNewService> createState() => _AddNewServiceState();
}

class _AddNewServiceState extends State<AddNewService> {
  final serviceNameController = TextEditingController();
  List<String> streetsList = ["Select Street", "WoodWard", "Farmer","BothStreet"];
  String? selectedStreet = "Select Street";
final Streetname=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Service",
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
      body: Builder(
        builder: (context) {
          return Stack(
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 40,
                        right: 40,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.704,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        color: Color.fromARGB(180, 0, 0, 65),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            SizedBox(
                              width: 220,
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
                                items: streetsList
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
                                onChanged: (street) => setState(() {
                                  selectedStreet = street;
                                  Streetname.text=street!;
                                }),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            TextField(
                              controller: serviceNameController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.add,
                                  color: Colors.deepOrange,
                                  size: 40,
                                ),
                                label: Text(
                                  "Service Name",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2.0,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                            // buttonOfManageServices(
                            //   context,
                            //   () {
                            //      setState(() {
                            //
                            //            checkNewService(selectedStreet!, serviceNameController.text);
                            //            Add_sercive_Admin().Add_Servicee(serviceNameController.text, Streetname.text);
                            //      });
                            //   },
                            //   "Add Service",
                            //   const Color.fromARGB(255, 10, 150, 10),
                            // ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {

                                  checkNewService(selectedStreet!, serviceNameController.text);
                                  Add_sercive_Admin().Add_Servicee(serviceNameController.text, Streetname.text);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 60),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                primary: const Color.fromARGB(255, 10, 150, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 30.0,
                              ),
                              child: const Text(
                                "Add Service",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
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
          );
        }
      ),
    );
  }
  bool checkNewService(String selectedStreet , String serviceName){
    if(selectedStreet == "Select Street"){
      snackBar(context, 'Please Select Street' , const Color.fromARGB(255, 150, 10, 10));
        return false;
    }
    else if(serviceName == ''){
      snackBar(context, 'Please Enter Service Name',const Color.fromARGB(255, 150, 10, 10));
          return false;
    }
    else{
      for (var service in servicesList) {
        if(serviceName == service){
          snackBar(context, 'Service Name Exited',const Color.fromARGB(255, 150, 10, 10));
          return false;
        }
      }
      snackBar(context, "Service Add Successfully", const Color.fromARGB(255, 15, 150, 10));
      return true;
    }
  }
  void snackBar(BuildContext context , String errorMessage , Color snackBarColor){
    final snackBar = SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      backgroundColor: snackBarColor,
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(snackBar);
  }
}
