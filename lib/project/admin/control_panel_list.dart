import '/project/admin/services_manage/add_new_service.dart';
import '/project/admin/services_manage/block_service.dart';
import '/project/admin/services_manage/delete_service.dart';
import '../../components/buttons.dart';
import 'admins_manage/add_new_admin.dart';
import 'admins_manage/remove_admin.dart';
import 'service_calender.dart';
import 'services_manage/un_block_service.dart';

List controlPanelButtons(context) => [
      buttonsOfControlPanel(
        context,
        const AddNewService(),
        "Add",
        "service",
      ),
      buttonsOfControlPanel(
        context,
        const DeleteService(),
        "Delete",
        "service",
      ),
      buttonsOfControlPanel(
        context,
        const BlockService(),
        "Block",
        "service",
      ),
      buttonsOfControlPanel(
        context,
        const UnBlockService(),
        "UnBlock",
        "service",
      ),
      buttonsOfControlPanel(
        context,
        const AddNewAdmin(),
        "Add",
        "Admin",
      ),
      buttonsOfControlPanel(
        context,
        const RemoveAdmin(),
        "Delete",
        "Admin",
      ),
      buttonsOfControlPanel(
        context,
        const ServiceCalender(),
        "Services",
        "Calendar",
      ),
    ];
