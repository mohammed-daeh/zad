// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';


class CardProphetsDua extends StatelessWidget {
  const CardProphetsDua({super.key});

  @override
  Widget build(BuildContext context) {

        return Stack(
          children: [
            Container(
              width: 163,
              height: 124,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/duaPage/Prophets_Dua.svg',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'prophetsDua'.i18n,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'maxValue',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff062437),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
                child: SvgPicture.asset(
                  'assets/images/duaPage/zagrafa_corner_bottom_right.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
   
    );
  }
}
