import 'package:flutter/material.dart';

class RequestsStates {
  final String gateTitle;
  // final String serviceTitle;
  final serviceTitle;
  final String serviceStartDate;
  final String serviceEndDate;
  final TimeOfDay serviceTime;
  final int minuteDuration;
  final int hoursDuration;
  final String user;
  final TimeOfDay endingTime;
  // final List choosedStaffs;
  const RequestsStates({
    required this.gateTitle,
    required this.serviceTitle,
    required this.serviceStartDate,
    required this.serviceEndDate,
    required this.minuteDuration,
    required this.serviceTime,
    required this.hoursDuration,
    required this.user,
    required this.endingTime,
    // required this.choosedStaffs,
  });
}
