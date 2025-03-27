// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class CardQuranSura extends StatelessWidget {
  final String suraNumber;
  final String suraName;
  final String versesNumber;
  final String suraType;
  final String pathOfNameSura;
  const CardQuranSura(
      {super.key,
      required this.suraNumber,
      required this.suraName,
      required this.versesNumber,
      required this.suraType,
      required this.pathOfNameSura});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        height: 82,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xffE3EBEC), width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              SvgPicture.asset(
                'assets/icons/containar_zagrafa.svg',
                width: 26,
                height: 26,
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      suraNumber,
                      style: TextStyle(
                          color: Color(0xff124D73),
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(
              width: 17,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraName.i18n,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff124D73)),
                ),
                Row(
                  children: [
                    Text(
                      '${versesNumber}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAD5500),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Verses',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAD5500),
                      ),
                    ),
                    Text(
                      ' | ',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAD5500),
                      ),
                    ),
                    Text(
                      suraType,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAD5500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            SvgPicture.asset(
              pathOfNameSura,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
