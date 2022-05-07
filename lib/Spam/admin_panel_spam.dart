//
//هاد الملف في كواد مو مهمة حاليا وممكن ما نحتاجها بنوب بس تركتها تحسبا
//
//
//
//
// child: SingleChildScrollView(
//   child: Column(
//     children: <Widget>[
//       /*
//
//           هي كانت مسان ال staff
//            عملتها تعليق لانو لغاها
//            وتركتها لانو في احتمال
//            يطلبها ع ال Update
//
//        */
//
//       // Row(
//       //   children: <Widget>[
//       //     Container(
//       //       padding: const EdgeInsets.all(13),
//       //       child: ElevatedButton(
//       //         onPressed: () {
//       //           Navigator.of(context).push(
//       //             MaterialPageRoute(
//       //               builder: (_) => const AddNewStaff(),
//       //             ),
//       //           );
//       //         },
//       //         style: ElevatedButton.styleFrom(
//       //           minimumSize: const Size(155, 155),
//       //           primary:
//       //           const Color.fromARGB(55, 100, 100, 255),
//       //           shape: RoundedRectangleBorder(
//       //             borderRadius: BorderRadius.circular(30),
//       //           ),
//       //           elevation: 15.0,
//       //         ),
//       //         child: Column(
//       //           children: const <Widget>[
//       //             Text(
//       //               "Add",
//       //               style: TextStyle(
//       //                 fontSize: 24,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //             Text(
//       //               "Staff",
//       //               style: TextStyle(
//       //                 fontSize: 24,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //           ],
//       //         ),
//       //       ),
//       //     ),
//       //     Container(
//       //       padding: const EdgeInsets.all(13),
//       //       child: ElevatedButton(
//       //         onPressed: () {
//       //           Navigator.of(context).push(
//       //             MaterialPageRoute(
//       //               builder: (_) => const DeleteStaff(),
//       //             ),
//       //           );
//       //         },
//       //         style: ElevatedButton.styleFrom(
//       //           minimumSize: const Size(155, 155),
//       //           primary:
//       //           const Color.fromARGB(55, 100, 100, 255),
//       //           shape: RoundedRectangleBorder(
//       //             borderRadius: BorderRadius.circular(30),
//       //           ),
//       //           elevation: 15.0,
//       //         ),
//       //         child: Column(
//       //           children: const <Widget>[
//       //             Text(
//       //               "Delete",
//       //               style: TextStyle(
//       //                 fontSize: 24,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //             Text(
//       //               "Staff",
//       //               style: TextStyle(
//       //                 fontSize: 24,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //           ],
//       //         ),
//       //       ),
//       //     ),
//       //   ],
//       // ),
//       Row(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.all(13),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => const AddNewService(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(155, 155),
//                 primary:
//                     const Color.fromARGB(55, 100, 100, 255),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 elevation: 15.0,
//               ),
//               child: Column(
//                 children: const <Widget>[
//                   Text(
//                     "Add",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Service",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(13),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => const DeleteService(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(155, 155),
//                 primary:
//                     const Color.fromARGB(55, 100, 100, 255),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 elevation: 15.0,
//               ),
//               child: Column(
//                 children: const <Widget>[
//                   Text(
//                     "Delete",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Service",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       Row(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.all(13),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => const BlockService(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(155, 155),
//                 primary:
//                 const Color.fromARGB(55, 100, 100, 255),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 elevation: 15.0,
//               ),
//               child: Column(
//                 children: const <Widget>[
//                   Text(
//                     "Block",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Service",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(13),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => const UnBlockService(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(155, 155),
//                 primary:
//                 const Color.fromARGB(55, 100, 100, 255),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 elevation: 15.0,
//               ),
//               child: Column(
//                 children: const <Widget>[
//                   Text(
//                     "Un Block",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Service",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       Row(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.all(13),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => const AddNewAdmin(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(155, 155),
//                 primary:
//                 const Color.fromARGB(55, 100, 100, 255),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 elevation: 15.0,
//               ),
//               child: Column(
//                 children: const <Widget>[
//                   Text(
//                     "Add",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Admin",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(13),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => const RemoveAdmin(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(155, 155),
//                 primary:
//                 const Color.fromARGB(55, 100, 100, 255),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 elevation: 15.0,
//               ),
//               child: Column(
//                 children: const <Widget>[
//                   Text(
//                     "Remove",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Admin",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       Row(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.all(13),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => const ServiceCalender(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(155, 155),
//                 primary:
//                 const Color.fromARGB(55, 100, 100, 255),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 elevation: 15.0,
//               ),
//               child: Column(
//                 children: const <Widget>[
//                   Text(
//                     "Service",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "calender",
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           /*
//
//                 هي مشان ينقل ع واجهة add Admin
//                 هلا ما بدنا اياها
//                 لانو رح نضيفها ع التحديث
//
//            */
//           // Container(
//           //   padding: const EdgeInsets.all(13),
//           //   child: ElevatedButton(
//           //     onPressed: () {
//           //       Navigator.of(context).push(
//           //         MaterialPageRoute(
//           //           builder: (_) => const AddNewAdmin(),
//           //         ),
//           //       );
//           //     },
//           //     style: ElevatedButton.styleFrom(
//           //       minimumSize: const Size(155, 155),
//           //       primary:
//           //       const Color.fromARGB(55, 100, 100, 255),
//           //       shape: RoundedRectangleBorder(
//           //         borderRadius: BorderRadius.circular(30),
//           //       ),
//           //       elevation: 15.0,
//           //     ),
//           //     child: Column(
//           //       children: const <Widget>[
//           //         Text(
//           //           "Add",
//           //           style: TextStyle(
//           //             fontSize: 24,
//           //             color: Colors.white,
//           //           ),
//           //         ),
//           //         Text(
//           //           "Admin",
//           //           style: TextStyle(
//           //             fontSize: 24,
//           //             color: Colors.white,
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//
//         ],
//       ),
//     ],
//   ),
// ),