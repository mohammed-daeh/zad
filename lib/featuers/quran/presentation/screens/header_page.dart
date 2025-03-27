// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Quran'.i18n,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/quranPage/quran_white.svg',
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              'Al_Faatiha'.i18n,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Start Reading'.i18n,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow_right_white.svg',
                    width: 13,
                    height: 13,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/quranPage/Reading_plan.svg',
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              'Reading plan'.i18n,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            InkWell(
              onTap: () {
              },
              child: Text(
                'Start Khatam'.i18n,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            SvgPicture.asset(
              'assets/icons/arrow_right_white.svg',
              width: 13,
              height: 13,
            ),
          ],
        )
      ],
    );
  }
}
