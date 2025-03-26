// ignore_for_file: must_be_immutable, prefer_const_constructors, deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class CardDateLocation extends StatelessWidget {
  CardDateLocation({super.key});
  String hijriDate = '25 Muhrram , 1446';
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            padding: EdgeInsets.all(16),
            height: 82,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hijriDate,
                  style: TextStyle(
                      color: now.hour >= 17 || now.hour <= 5
                          ? Colors.black
                          : Colors.white,
                      fontSize: 14),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location.svg',
                      fit: BoxFit.scaleDown,
                      color: now.hour >= 17 || now.hour <= 5
                          ? Colors.black
                          : Colors.white,
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'istanbul'.i18n,
                      style: TextStyle(
                        color: now.hour >= 17 || now.hour <= 5
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
