
import '../admin/admin_control_panel.dart';
import 'services.dart';
import 'package:project_mohammad/project/projects_page.dart';
import 'package:flutter/material.dart';

class ServiceManagementPageChooser extends StatefulWidget {
  const ServiceManagementPageChooser({Key? key}) : super(key: key);

  @override
  State<ServiceManagementPageChooser> createState() => _ServiceManagementPageChooserState();
}

class _ServiceManagementPageChooserState extends State<ServiceManagementPageChooser> {
  @override
  Widget build(BuildContext context) {
    if(admin) return const AdminControlPanel();
    return const StreetServiceChoosing();
  }
}
