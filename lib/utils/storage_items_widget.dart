// import 'package:flutter/material.dart';
// import 'package:pantry_saver_fe/bloc/freezer_bloc.dart';
// import 'package:pantry_saver_fe/config/styles.dart';
// import 'package:pantry_saver_fe/model/items.dart';
// import 'package:pantry_saver_fe/utils/textfield_item_widget.dart';
// import 'package:pantry_saver_fe/utils/textfield_widget.dart';
// import 'package:pantry_saver_fe/utils/textfield_widget.dart';
//
// class StorageItemWidget extends StatelessWidget {
//   final int maxLines;
//   final String text;
//   final ValueChanged<String> onChanged;
//   final VoidCallback onClicked;
//
//   const StorageItemWidget({
//     Key? key,
//     required this.text,
//     this.maxLines = 1,
//     required this.onChanged,
//     required this.onClicked,
//   }) : super(key: key);
//
//   final FreezerBloc _bloc;
//   final ItemModel items;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Card(
//           color: Colors.white,
//           elevation: 4.0,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(25.0))),
//           child: Padding(
//             padding: EdgeInsets.only(left: 5),
//             child: Column(
//               children: <Widget>[
//                 ListBody(
//                   children: <Widget>[
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                             child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 16.0, top: 8, bottom: 8),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 item[index].name,
//                                 style: TextStyle(
//                                     color: greenPrimary, fontSize: 22),
//                               ),
//                               Text(
//                                   "Expires in ${item[index].expiry_countdown_in_days} day(s)",
//                                   style: TextStyle(
//                                       color: greyPrimary, fontSize: 13))
//                             ],
//                           ),
//                         )),
//                         Container(
//                           padding: EdgeInsets.only(right: 32),
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                             child: ItemFieldWidget(
//                                 text: text, onChanged: onChanged),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
