import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_mohammad/services/requests_form.dart';
import 'package:project_mohammad/services/services_check_box.dart';
import 'package:project_mohammad/services/staff.dart';

import '../Api/model/allreservation_mode.dart';
import '../Api/model/name_service.dart';
import 'street_service_chooser.dart';



class getdata {

 static late ListService l1 ;
 getdata(ListService l )
 {
   l1=l;
 }

}
//مصفوفة لاسم الشوارع
//المتغير الاول title يرمز لاسم الشارع
//المتغير الثاني srChooser يرمز للمصفوفة المحتواة في اسم الشارع
//والتي تحوي الخدمات (البوابات) التي يمكن حجزها من الشارع
final selectStreet = <ServiceChooser>[
  ServiceChooser(title: 'WOODWARD', serviceChoosingList: woodWardStreetList),
  ServiceChooser(title: 'FARMER', serviceChoosingList: farmerStreetList),
];

//مصفوفة ال بوابات
//المتغير title يرمز لاسم البوابة
/////////
//اخر خيار في كل مصفوفة ضمن الشارع مخصص لحجز الشارع في حالة كات يريد المستخدم
//ان يركن شاحنة عندها ي الشارع يصبح محجوز بالكامل

final woodWardStreetList = <ServiceChooser>[
  const ServiceChooser(title: 'Gate 1'),
  const ServiceChooser(title: 'Gate 2'),
  const ServiceChooser(title: 'WOODWARD street'),
];
//مصفوفة ال بوابات


//المتغير title يرمز لاسم البوابة

final farmerStreetList = <ServiceChooser>[
  const ServiceChooser(title: 'Gate 3'),
  const ServiceChooser(title: 'Gate 4'),
  const ServiceChooser(title: 'FARMER street'),
];
//مصفوفة الخدمات
//خيار Self Unloaded Delivery بيمكن المستخدم من
//حجز خدمة مع البوابة او انه يريد حجز البوابة فقط
//فكرة حجز البوابة فقط هي التأكد اذا كانت الخدمة Not Assigned فإنه
//يتجاهلها وما عدا ذلك سوف يرسلها لقاعدة البيانات
late ListService ss ;

/*
List<String> servicesList = [

];//هي list   مسان ال blocked services




*/
//
/*
List <String> gatesEdition =[
  'Select Service'
];
*/

List<String> blockedServicesList = [
  'Select Service',
  'blocked service 1',
  'blocked service 2',
  'blocked service 3',
  'blocked service 4',
  'blocked service 5',
];

//هي مشان يقدر المستخدم يختار كل ال staffs المتاحين
//بكبسة وحدة تسمها Select all staffs
// final selectAllStaff = StaffCheckBox(staff_name: "Select All Staffs");
final selectAllServices = ServicesCheckBox(serviceName: "Select All Services");
//هي ال List الخاصة بال staffs
// طبعا هي ال list بتكون فاضية لانو ال admin
//هو اللي رح يضيف اسماء ال staff  او يحذفها حسب الموجود
final chooseStaff = [
  StaffCheckBox(staff_name: "staff 1"),
  StaffCheckBox(staff_name: "staff 2"),
  StaffCheckBox(staff_name: "staff 3"),
  StaffCheckBox(staff_name: "staff 4"),
  StaffCheckBox(staff_name: "staff 5"),
  StaffCheckBox(staff_name: "staff 6"),
  StaffCheckBox(staff_name: "staff 7"),
  StaffCheckBox(staff_name: "staff 8"),
  StaffCheckBox(staff_name: "staff 9"),
  StaffCheckBox(staff_name: "staff 10"),
];


final chooseService = [
  ServicesCheckBox(serviceName: "self Unloaded Delivery"),

];

List<AllReseervatios> adminCalendarList = [];

// هي list  مشان اضافة newAdmin
//رح يضيفها ع  ال database
// هي الميزة لل update

List<RequestsStates> adminRequestsManageList = [
  RequestsStates(
    user: "user 1",
    gateTitle: "gate1",
    serviceTitleList: ['service1.0', 'service1.1', 'service1.2'],
    serviceStartDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        6,
        30,
      ),
    ),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        6,
        30,
      ),
    ),
    serviceTime: TimeOfDay(hour: 8, minute: 10),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(
      hour: 12,
      minute: 40,
    ),
  ),
  RequestsStates(
    user: "user 2",
    gateTitle: "gate2",
    serviceTitleList: ['service2.0', 'service2.1' ,'service2.2'],
    serviceStartDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        7,
        30,
      ),
    ),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        7,
        30,
      ),
    ),
    serviceTime: TimeOfDay.now(),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(hour:00 , minute: 00,),
  ),
  RequestsStates(
    user: "user 3",
    gateTitle: "gate3",
    serviceTitleList: ['service3.0', 'service3.1' ,'service3.2'],
    serviceStartDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        6,
        30,
      ),
    ),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        6,
        30,
      ),
    ),
    serviceTime: TimeOfDay(
      hour: 14,
      minute: 15,
    ),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(
      hour: 16,
      minute: 10,
    ),
  ),
  RequestsStates(
    user: "user 4",
    gateTitle: "gate4",
    serviceTitleList: ['service4.0', 'service4.1' ,'service4.2'],
    serviceStartDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        8,
        30,
      ),
    ),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        8,
        30,
      ),
    ),
    serviceTime: TimeOfDay.now(),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(
      hour: 3,
      minute: 15,
    ),
  ),
  RequestsStates(
    user: "user 5",
    gateTitle: "gate4",
    serviceTitleList: ['service5.0', 'service5.1', 'service5.2'],
    serviceStartDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        9,
        30,
      ),
    ),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        9,
        30,
      ),
    ),
    serviceTime: TimeOfDay.now(),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(
      hour: 00,
      minute: 00,
    ),
  ),
  RequestsStates(
    user: "user 6",
    gateTitle: "gate4",
    serviceTitleList: ['service6.0', 'service6.1' ,'service6.2'],
    serviceStartDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        6,
        30,
      ),
    ),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(
      DateTime(
        2022,
        6,
        30,
      ),
    ),
    serviceTime: TimeOfDay(
      hour: 16,
      minute: 30,
    ),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(
      hour: 17,
      minute: 40,
    ),
  ),
];

List<String> addAdminList = [
  'Select Admin'
];




List<String> gatesEdition = [
  'Select Gate',

];
List<String> streetEdition = [
  'Select Street',
  'WOODWARD',
  'FARMER',
];

