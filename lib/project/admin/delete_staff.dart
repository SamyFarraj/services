import 'package:flutter/material.dart';

class DeleteStaff extends StatefulWidget {
  const DeleteStaff({Key? key}) : super(key: key);

  @override
  State<DeleteStaff> createState() => _DeleteStaffState();
}

class _DeleteStaffState extends State<DeleteStaff> {
  String? selectedStaff = 'Select Staff';
  List <String> staffList=[
    'Select Staff',
    'staff 1',
    'staff 2',
    'staff 3',
    'staff 4',
    'staff 5',
    'staff 6',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Delete Staff",
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
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.704,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        color:  Color.fromARGB(180, 0, 0, 65),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children:  <Widget>[

                            SizedBox(
                              width: 220,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 6.0,
                                      color: Colors.blue,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(25),
                                  ),
                                ),
                                value: selectedStaff,
                                items: staffList
                                    .map(
                                      (service) =>
                                      DropdownMenuItem<String>(
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
                                onChanged: (service) => setState(() {
                                  selectedStaff = service!;
                                }),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                            ElevatedButton(
                              onPressed: () {
                                checkStaffDelete(selectedStaff!);
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 60),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal:
                                  MediaQuery.of(context).size.width * 0.2,
                                ),
                                primary: const Color.fromARGB(255, 150, 10, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15.0,
                              ),
                              child: const Text(
                                "Delete Staff",
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
  bool checkStaffDelete(String selectedService) {
    if (selectedService == 'Select Staff') {
      snackBar(context, "Please Select Staff",
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      snackBar(context, "Staff Deleted Successfully",
          const Color.fromARGB(255, 15, 150, 10));
      return true;
    }
  }

  void snackBar(
      BuildContext context, String errorMessage, Color snackBarColor) {
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
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
