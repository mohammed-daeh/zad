// // ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:zad_almuslem/core/translations/translation.dart';

// class CardNextPrayer extends StatelessWidget {
//   CardNextPrayer(
//       {super.key,
//       required this.next_prayer,
//       required this.remaining_time,
//       required this.secund_Time});
//   String next_prayer;
//   String secund_Time;
//   String remaining_time;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 108,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 8),
//             child: Container(
//               height: 24,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Color(0xffEEF7F9),
//               ),
//               child: Text(
//                 'Next Prayer'.i18n,
//                 style: TextStyle(color: Colors.black, fontSize: 11),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 4.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: next_prayer,
//                         style: TextStyle(
//                           color: Color(0xffF18C2C),
//                           fontSize: 16,
//                           letterSpacing: 0.15,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       TextSpan(
//                         text: ' at ',
//                         style: TextStyle(
//                           color: Color(0xff062437),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       TextSpan(
//                         text: secund_Time,
//                         style: TextStyle(
//                           color: Color(0xff062437),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 'assets/icons/time.svg',
//                 fit: BoxFit.scaleDown,
//                 width: 12,
//                 height: 12,
//               ),
//               Gap(
//                 5,
//               ),
//               Text(
//                 'Remaining '.i18n,
//               ),
//               Text(' $remaining_time')
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
