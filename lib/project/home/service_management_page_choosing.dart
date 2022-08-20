import 'package:flutter/material.dart';

import '../admin/admin_control_panel.dart';
import '../user/services.dart';
import 'package:project_mohammad/project/projects_page.dart';
// import 'services.dart';


class ServiceManagementPageChooser extends StatefulWidget {
  const ServiceManagementPageChooser({Key? key}) : super(key: key);

  @override
  State<ServiceManagementPageChooser> createState() => _ServiceManagementPageChooserState();
}

class _ServiceManagementPageChooserState extends State<ServiceManagementPageChooser> {
  @override
  Widget build(BuildContext context) {
    if(admin) return const AdminControlPanel();
    // return const StreetServiceChoosing();
    return const ServiceEditionS();
  }
}
