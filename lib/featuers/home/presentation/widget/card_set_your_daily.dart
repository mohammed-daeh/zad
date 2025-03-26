// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class CardSetYourDaily extends StatelessWidget {
  const CardSetYourDaily({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        height: 124,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE0ECEE)),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              child: SvgPicture.asset(
                'assets/images/dou.svg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Set your daily goal'.i18n,
                        style: TextStyle(
                          color: Color(0xff124D73),
                          fontSize: 16,
                          letterSpacing: 0.15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Text(
                    'you have n\'t seta daily goal yet.'.i18n,
                    style: TextStyle(fontSize: 12, color: Color(0xff124D73)),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 36,
                      width: 171,
                      decoration: BoxDecoration(
                        color: Color(0xffFFF2E5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'set Now'.i18n,
                            style: TextStyle(
                              color: Color(0xff124D73),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),
                          SvgPicture.asset(
                            'assets/icons/arrow_right_with_circel.svg',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:quran/translation/translation.dart';

// class CardSetYourDaily extends StatelessWidget {
//   const CardSetYourDaily({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         width: double.infinity,
//         height: 124,
//         decoration: BoxDecoration(
//           border: Border.all(color: Color(0xffE0ECEE)),
//           borderRadius: BorderRadius.circular(16),
//           color: Colors.white,
//         ),
//         child: Stack(
//           children: [

//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                    Text( Utils.localize('setYourDailyGoal'),
//                         style: TextStyle(
//                           color: Color(0xff124D73),
//                           fontSize: 16,
//                           letterSpacing: 0.15,
//                           fontWeight: FontWeight.w600,
//                         )),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     SvgPicture.asset(
//                       'assets/icons/arrow_right.svg',
//                       width: 20,
//                       height: 20,
//                       fit: BoxFit.cover,
//                     )
//                   ],
//                 ),
//                Text( Utils.localize('youhaventsetadailygoalyet.'),
//                     style: TextStyle(fontSize: 12, color: Color(0xff124D73))),
//                 InkWell(
//                   onTap: () {},
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 36,
//                     width: 171,
//                     decoration: BoxDecoration(
//                       color: Color(0xffFFF2E5),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                        Text( Utils.localize(
//                           'setNow'),
//                           style: TextStyle(
//                               color: Color(0xff124D73),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         SvgPicture.asset(
//                           'assets/icons/arrow_right_with_circel.svg',
//                           width: 20,
//                           height: 20,
//                           fit: BoxFit.cover,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
