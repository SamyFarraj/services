import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '/project/constant.dart';
import '/services/choices.dart';
import '../../../Api/model/name_service.dart';
import '../../../Cubit/Admin Level Operation/admin_level_cubit.dart';
import '../../../components/snack_bar.dart';
import '../../../main.dart';

class BlockService extends StatefulWidget {
  const BlockService({Key? key}) : super(key: key);

  @override
  State<BlockService> createState() => _BlockServiceState();
}

class _BlockServiceState extends State<BlockService> {
  List<String> woodWardServices = [];
  List<String> farmerServices = [];
  List<String> bothStreetsServices = [];
  List<String> servicesList = [];

  int i = 0;

  String selectedService = 'Select Service';
  String? selectedStreet = "Farmer";
  late int serviceId;

  Future<ListService> fetchAlbum() async {
    //   servicesList.clear();

    final response = await http.get(Uri.parse('${baseUrl}/api/Admin/services'),
        headers: {'Authorization': 'Bearer $adminToken'}
        // snapshot.data!.services.woodWard[1].street
        );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ListService.fromJson(jsonDecode(response.body));
    } else {
      //

      throw Exception('Failed to load album');
    }
  }

  late Future<ListService> date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    date = fetchAlbum();

    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _appBarContent(),
      body: _bodyContent(),
    );
  }

  AppBar _appBarContent() => AppBar(
        centerTitle: true,
        title: _appBarTitle(),
        backgroundColor: const Color.fromARGB(180, 0, 0, 65),
      );

  Text _appBarTitle() => const Text(
        "Block Service",
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
          fontStyle: FontStyle.italic,
          color: Colors.deepOrange,
        ),
      );

  Builder _bodyContent() => Builder(builder: (context) {
    return Stack(
      children: <Widget>[
        // هاد container بيحوي صورة الخلفية
        _backgroundImage(),
        //هاد لون فوق الخلفية مشات وضوح الكتابة
        _colorCorrectionLayer(),

        BlocConsumer<AdminLevelCubit, AdminLevelState>(
          listener: (context, state) {
            _listenerFunction(state);
          },
          builder: (context, state) {
            var cubit = AdminLevelCubit.get(context);

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _logoImage(),
                  _streetAndServiceContainer(
                    state,
                    cubit,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  });

  Widget _backgroundImage() => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "asset/images/background_picture.png",
          fit: BoxFit.cover,
        ),
      );

  Widget _colorCorrectionLayer() => Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(150, 60, 60, 100),
      );

  _listenerFunction(state) {
    // TODO: implement listener
    if (state is SuccessStatus) {
      Navigator.pop(context);
      TheSnackBar(
        context,
        'Service Blocked Successfully',
        const Color.fromARGB(255, 10, 150, 10),
      );
    }

    //في حال دخل كلمة سر خطأ
    if (state is FailureStatus) {
      //هون حط توست ماسج انو كلمة السر غلط
      TheSnackBar(
        context,
        "couldn't block Service",
        const Color.fromARGB(255, 150, 10, 10),
      );
      print("رسالة الخطأ ");
    }
    // TODO: implement listener
  }

  Widget _logoImage() => Container(
        padding: EdgeInsets.only(top: 60),
        height: MediaQuery.of(context).size.height * 0.295,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //  هاد logo  الشركة
            Image.asset(
              "asset/images/logo.png",
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.095,
            ),
          ],
        ),
      );

  Widget _streetAndServiceContainer(state, cubit) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.704,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          color: Color.fromARGB(180, 0, 0, 65),
        ),
        child: _streetServiceBuilder(state, cubit),
      );

  Widget _streetServiceBuilder(state, cubit) => SingleChildScrollView(
        child: FutureBuilder<ListService>(
          future: date,
          builder: (context, snapshot) =>
              _builderFunction(context, snapshot, state, cubit),
        ),
      );

  _builderFunction(context, snapshot, state, cubit) {
    if (snapshot.hasData) {
      woodWardServices.clear();
      farmerServices.clear();
      bothStreetsServices.clear();

      farmerServices.add('select service');
      for (int i = 0; i < snapshot.data!.services.bothStreet.length; i++) {
        bothStreetsServices.add(snapshot.data!.services.bothStreet[i].name);
      }
      for (int i = 0; i < snapshot.data!.services.woodward.length; i++) {
        woodWardServices.add(snapshot.data!.services.woodward[i].name);
      }
      //

      if (farmerServices.length <= snapshot.data!.services.farmer.length) {
        for (int i = 0; i < snapshot.data!.services.farmer.length; i++) {
          farmerServices.add(snapshot.data!.services.farmer[i].name);
        }
      }
      return Column(
        children: <Widget>[
          ///الليست القديمة //
          _streetDropDownMenu(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          _serviceDropDownMenu(snapshot),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          _conditionBuilder(state, cubit),
        ],
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }

    // By default, show a loading spinner.
    return Center(child: const CircularProgressIndicator());
  }

  Widget _streetDropDownMenu() => SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                width: 3.6,
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          items: selectStreet
              .map(
                (street) => DropdownMenuItem<String>(
                  value: street.title,
                  child: _text(
                    street.title,
                  ),
                ),
              )
              .toList(),
          hint: _text(
            "Select Street",
          ),
          onChanged: (street) => _onChangedStreet(street),
        ),
      );

  Widget _serviceDropDownMenu(snapshot) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
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
          hint: _text(
            "Select Service",
          ),
          items: servicesList
              .map(
                (service) => DropdownMenuItem<String>(
                  value: service,
                  child: _text(service),
                ),
              )
              .toList(),
          onChanged: (service) => _onChangedServices(service, snapshot),
        ),
      );

  ElevatedButton _blockServiceButton(cubit, onPressed) => ElevatedButton(
        onPressed: onPressed,
        style: _blockButtonStyle(),
        child: _blockButtonText(),
      );

  ButtonStyle _blockButtonStyle() => ElevatedButton.styleFrom(
        minimumSize: const Size(300, 60),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: MediaQuery.of(context).size.width * 0.2,
        ),
        backgroundColor: const Color.fromARGB(255, 150, 10, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 15.0,
      );

  Text _blockButtonText() => Text(
        "Block Service",
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      );

  _onChangedStreet(street) => setState(() {
        selectedStreet = street;

        if (selectedStreet == 'FARMER') {
          if (farmerServices.length == 0) {
            // farmerServices.add('');
            servicesList = List.from(farmerServices);
            //    servicesList.add('select services');

          } else {
            servicesList = List.from(farmerServices);
            selectedService = servicesList[0];
          }
        }
        if (selectedStreet == 'WOODWARD') {
          servicesList = List.from(woodWardServices);
          selectedService = servicesList[0];
        }
        if (selectedStreet == 'BothStreet') {
          servicesList = List.from(bothStreetsServices);
          selectedService = servicesList[0];
        }
        // servicesList.clear();
      });

  _onChangedServices(service, snapshot) => setState(() {
        selectedService = service!;

        if (selectedStreet == 'WOODWARD') {
          for (int i = 0; i < snapshot.data!.services.woodward.length; i++) {
            if (selectedService == snapshot.data!.services.woodward[i].name) {
              serviceId = snapshot.data!.services.woodward[i].id;

              break;
            }
          }
        } else {
          if (selectedStreet == 'FARMER') {
            for (int i = 0; i < snapshot.data!.services.farmer.length; i++) {
              if (selectedService == snapshot.data!.services.farmer[i].name) {
                serviceId = snapshot.data!.services.farmer[i].id;

                break;
              }
            }
          }
        }
        // servicesList.clear();
        //    servicesList.clear();
      });

  _conditionBuilder(state, cubit) => ConditionalBuilder(
        condition: state is RefreshLevelState || state is AdminLevelInitial,
        builder: (context) => _blockServiceButton(cubit, () {
          if (checkServiceBlock(selectedService)) {
            cubit.Block_Service(serviceId);
          }
        }),
        fallback: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );

  Text _text(String content) => Text(
        content,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.blue,
        ),
      );

  bool checkServiceBlock(String selectedService) {
    if (selectedStreet == "Select Street") {
      TheSnackBar(
        context,
        'Please Select Street',
        const Color.fromARGB(255, 150, 10, 10),
      );
      return false;
    } else if (selectedService == 'Select Service') {
      TheSnackBar(context, 'Please Select Service',
          const Color.fromARGB(255, 150, 10, 10));
      return false;
    } else {
      return true;
    }
  }
}
