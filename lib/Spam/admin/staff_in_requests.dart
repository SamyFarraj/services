//هاد ال container كان مشان ال staffs
// كونو لغاه مؤقتا عملت كلشي يتعلق فيه
// تعليقات لانو احتمال يطلبو بعدين

// Container(
//   alignment: Alignment.center,
//   height: 90,
//   width:
//       MediaQuery.of(context).size.width *
//           0.7,
//   decoration: BoxDecoration(
//     border: Border.all(
//         width: 2, color: Colors.blue),
//   ),
//   child: ListView(
//     padding: const EdgeInsets.only(
//       top: 1,
//       left: 30,
//     ),
//     children: [
//       ...val.choosedStaffs.map((staff) {
//         return Text(
//           staff,
//           style: const TextStyle(
//               fontSize: 22,
//               color: Colors.white),
//         );
//       }).toList(),
//     ],
//   ),
// ),