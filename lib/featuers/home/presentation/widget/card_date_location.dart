// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'dart:ui';

import 'package:zad_almuslem/featuers/home/presentation/controllers/location_provider.dart';

class CardDateLocation extends ConsumerWidget {
  CardDateLocation({super.key});
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationProvider);

    String displayLocation = locationState.isLocationFetched
        ? locationState.location
        : 'Fetching location...';

    HijriCalendar hijriDate = HijriCalendar.fromDate(now);
    const hijriMonths = [
      'Muharram',
      'Safar',
      'Rabi al-Awwal',
      'Rabi al-Thani',
      'Jumada al-Awwal',
      'Jumada al-Thani',
      'Rajab',
      'Shaaban',
      'Ramadan',
      'Shawwal',
      'Dhul-Qi\'dah',
      'Dhul-Hijjah'
    ];

    String monthName = hijriMonths[
        hijriDate.hMonth - 1]; 

    String formattedHijriDate =
        '${hijriDate.hDay} / ${hijriDate.hMonth} / ${hijriDate.hYear}   -   ${monthName.i18n}';

    bool isNight = now.hour >= 17 || now.hour <= 5;
    Color textColor = isNight ? Colors.white : Colors.black;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.all(16),
          height: 82,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            backgroundBlendMode: BlendMode.dstATop,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedHijriDate,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    fit: BoxFit.scaleDown,
                    color: textColor,
                    width: 14, 
                    height: 14,
                  ),
                  SizedBox(width: 10),
                  Text(
                    displayLocation,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
