import 'package:flutter/material.dart';

class RequestsStates {
  final String gateTitle;
  final String serviceTitle;
  final String serviceDate;
  final TimeOfDay serviceTime;
  final int minuteDuration;
  final int hoursDuration;
  final String user;
  // final List choosedStaffs;
  const RequestsStates({
    required this.gateTitle,
    required this.serviceTitle,
    required this.serviceDate,
    required this.minuteDuration,
    required this.serviceTime,
    required this.hoursDuration,
    required this.user,
    // required this.choosedStaffs,
  });
}
