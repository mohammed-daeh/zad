// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class CardCurrentPrayer extends StatelessWidget {
   CardCurrentPrayer({super.key});
String current_prayer = 'Isha';
  String first_Time = '19:02';
  String has_passed_time = '1h 23 M';
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 108,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16, right: 16, left: 16, bottom: 8),
                    child: Container(
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffEEF7F9),
                      ),
                      child:Text( 
                        'currentPrayer'.i18n,
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: current_prayer,
                                style: TextStyle(
                                  color: Color(0xffF18C2C),
                                  fontSize: 16,
                                  letterSpacing: 0.15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: ' at ',
                                style: TextStyle(
                                  color: Color(0xff062437),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: first_Time,
                                style: TextStyle(
                                  color: Color(0xff062437),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/time.svg',
                        fit: BoxFit.scaleDown,
                        width: 16,
                        height: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${has_passed_time} ago')
                    ],
                  )
                ],
              ),
            );
  }
}