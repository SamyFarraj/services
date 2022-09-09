import 'package:flutter/material.dart';

import '../admin/admin_requests_page.dart';
import '../projects_page.dart';
import '../user/user_requests.dart';

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
