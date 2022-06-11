import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_mohammad/services/requests_form.dart';
import 'package:project_mohammad/services/staff.dart';

import 'street_service_chooser.dart';

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

List<String> servicesList = [
  'Select Service',
  'Self Unloaded Delivery',
  'Tower Crane 1',
  'Tower Crane 2',
  'BLK BuckHoist',
  'TWR BuckHoist',
  'ForkLift',
  'Trailer Pump',
  'Ramp-BSE',
];
//هي list   مسان ال blocked services
//
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
final selectAllStaff = StaffCheckBox(staff_name: "Select All Staffs");
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
// هي list  مشان اضافة newAdmin
//رح يضيفها ع  ال database
// هي الميزة لل update

List<RequestsStates> adminRequestsManageList = [
  RequestsStates(
    user: "user 1",
    gateTitle: "gate1",
    serviceTitle: 'service1',
    serviceStartDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceTime: TimeOfDay.now(),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(hour:00 , minute: 00,),
  ),
  RequestsStates(
    user: "user 2",
    gateTitle: "gate2",
    serviceTitle: 'service2',
    serviceStartDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceTime: TimeOfDay.now(),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(hour:00 , minute: 00,),
  ),
  RequestsStates(
    user: "user 3",
    gateTitle: "gate3",
    serviceTitle: 'service3',
    serviceStartDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceTime: TimeOfDay.now(),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(hour:00 , minute: 00,),
  ),
  RequestsStates(
    user: "user 4",
    gateTitle: "gate4",
    serviceTitle: 'service4',
    serviceStartDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceTime: TimeOfDay.now(),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(hour:00 , minute: 00,),
  ),
  RequestsStates(

    user: "user 5",
    gateTitle: "gate4",
    serviceTitle: 'service5',
    serviceStartDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceTime: TimeOfDay.now(),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(hour:00 , minute: 00,),
  ),
  RequestsStates(
    user: "user 6",
    gateTitle: "gate4",
    serviceTitle: 'service6',
    serviceStartDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceEndDate: DateFormat("MM/dd/yyyy").format(DateTime.now()),
    serviceTime: TimeOfDay.now(),
    hoursDuration: int.parse("1"),
    minuteDuration: int.parse("30"),
    endingTime: TimeOfDay(hour:00 , minute: 00,),
  ),
];

List<String> addAdminList = [
  'Select Admin',
  'Admin 1',
  'Admin 2',
  'Admin 3',
  'Admin 4',
  'Admin 5',
  'Admin 6',
  'Admin 7',
];



List <String> gatesEdition =[
  'Select Service',
  'Gate 1',
  'Gate 2',
  'Gate 3',
  'Gate 4',
];
List <String> streetEdition=[
  'Select Street',
  'WOODWARD',
  'FARMER',
];

