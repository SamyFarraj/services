import 'package:flutter/material.dart';


import '../admin/services_manage/admin_requests_new.dart';
import '../projects_page.dart';
import '../user/user_requests_new.dart';

int val = 0;

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (admin) {
      return AdminRequestsPageEd();
    } else {
      return const UserRequestsPage();
    }
  }
}
