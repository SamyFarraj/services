/*

              ////////////        staffs        ////////////

  */

//هي ال widget  اللي بتعرض خيار ال  select all staffs ك checkBox

// Widget buildGroupStaffCheckbox(StaffCheckBox staffCheckBox) =>
//     CheckboxListTile(
//       controlAffinity: ListTileControlAffinity.leading,
//       title: Text(
//         staffCheckBox.staff_name,
//         style: const TextStyle(
//           fontSize: 24,
//           color: Colors.orange,
//         ),
//       ),
//       activeColor: Colors.blue,
//       value: staffCheckBox.isChecked,
//       onChanged: toggleGroupStaffCheckbox,
//     );

// for choosing all staffs in one choice
// its called select all staffs
// هاد تابع بيتقق اذا تم اختبار ال كل ال staffs او لأ
//مشان الخيار select all staffs

// void toggleGroupStaffCheckbox(bool? isChecked) {
//   if (isChecked == null) return;
//   setState(() {
//     selectAllStaff.isChecked = isChecked;
//     // ignore: avoid_function_literals_in_foreach_calls
//     chooseStaff.forEach((staff) => staff.isChecked = isChecked);
//   });
// }

//هي ال widget  اللي بتعرض ال staffs ك checkBox

// Widget buildStaffCheckbox(StaffCheckBox staffCheckBox) => CheckboxListTile(
//       onChanged: (staffValue) => setState(() {
//         staffCheckBox.isChecked = staffValue!;
//         selectAllStaff.isChecked =
//             chooseStaff.every((staff) => staff.isChecked == true);
//       }),
//       controlAffinity: ListTileControlAffinity.leading,
//       activeColor: Colors.blue,
//       value: staffCheckBox.isChecked,
//       title: Text(
//         staffCheckBox.staff_name,
//         style: const TextStyle(fontSize: 24, color: Colors.white),
//       ),
//     );