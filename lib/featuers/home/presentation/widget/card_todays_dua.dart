// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class CardTodaysDua extends StatelessWidget {
  CardTodaysDua({super.key});
  String dua =
      'هم بقوة تدبيرك وعظيم عفوك وسعة حلمك وفيض كرمك، إحفظنا مما تخفيه المقادير، وألطف بنا يا عزيز يا قدير، ربي أنت المحيط بكل أمورنا، والعليم بكل شؤوننا، فألطف بنا من حوادث الزمن وإحفظنا في كل زمان ومكان';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE0ECEE)),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SvgPicture.asset(
                'assets/images/zz.svg',
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('assets/images/flower.svg')),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'today Dua'.i18n,
                            style: TextStyle(
                                color: Color(0xff124D73),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Container(
                            height: 2,
                            width: 32,
                            decoration: BoxDecoration(color: Color(0xffF6DAC2)),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/copy.svg',
                        ),
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/sharing.svg',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      dua,
                      style: TextStyle(
                        color: Color(0xff124D73),
                        fontSize: 16,
                      ),
                      textDirection: TextDirection.rtl,
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