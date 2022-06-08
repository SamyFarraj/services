// import 'package:flutter/material.dart';
//
//
// class _BasicTileWidgetState extends State<BasicTileWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final title = widget.tile.title;
//     final servicesList = widget.tile.serviceChoosingList;
//     if (servicesList.isEmpty) {
//       return ListTile(
//         title: Text(
//           title,
//           style: const TextStyle(fontSize: 26, color: Colors.white),
//         ),
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (_) {
//                 return null;
//               },
//             ),
//           );
//         },
//       );
//     } else {
//       return Container(
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(
//             width: 3,
//             color: Colors.blue,
//           ),
//         ),
//         child: ExpansionTile(
//           key: PageStorageKey(title),
//           title: Text(
//             title,
//             style: const TextStyle(fontSize: 26, color: Colors.white),
//           ),
//           children:
//           servicesList.map((tile) => BasicTileWidget(tile: tile)).toList(),
//         ),
//       );
//     }
//   }
// }
//
// class BasicTileWidget extends StatefulWidget {
//   final ServiceChooser tile;
//
//   const BasicTileWidget({
//     Key? key,
//     required this.tile,
//   }) : super(key: key);
//
//   @override
//   _BasicTileWidgetState createState() => _BasicTileWidgetState();
// }
//
//