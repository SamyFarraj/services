import 'dart:convert';

import 'package:flutter/material.dart';


import '../user/user_requests.dart';
import '../admin/admin_requests_page.dart';
import '../projects_page.dart';

int val = 0;

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (admin) {
      return AdminRequestsPage();
    } else {
      return const UserRequestsPage();
    }
  }
}
