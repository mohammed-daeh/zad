// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/home/domin/entities/prayer_state.dart';
import 'package:zad_almuslem/featuers/home/presentation/controllers/prayer_controller.dart';
import 'package:zad_almuslem/featuers/home/presentation/widget/card_date_location.dart';
import 'package:zad_almuslem/featuers/home/presentation/widget/card_todays_dua.dart';
import 'package:zad_almuslem/featuers/home/presentation/widget/card_todays_hadith.dart';
import 'package:zad_almuslem/featuers/home/presentation/widget/daytime_widget.dart';
import 'package:zad_almuslem/featuers/home/presentation/widget/prayer_card_widget.dart';
import 'package:zad_almuslem/featuers/home/presentation/widget/row_of_icons.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String formatTime(DateTime time) {
    return DateFormat.jm().format(time); 
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(prayerControllerProvider);

    if (state.prayerTimes == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Failed to load prayer times.'),
            SizedBox(height: 10),
            Text('Please check your location settings and try again.'),
          ],
        ),
      );
    }

    final nextPrayer = state.nextPrayer;
    final nextPrayerTime = nextPrayer != null
        ? state.prayerTimes!.timeForPrayer(nextPrayer)
        : null;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox.expand(),
          Positioned(child: PictureDaytime()),
          Positioned(
            top: 52,
            left: 16,
            right: 202,
            child: CardDateLocation(),
          ),
          Positioned(
            top: 236,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                color: Color(0xffEEF5FA),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: IconRowWidget(),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          CardTodaysHadith(),
                          CardTodaysDua(),
                          SizedBox(height: 90),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            left: 25,
            top: 165,
            child: Row(
              children: [
                PrayerCard(
                  title: 'Last Prayer'.i18n,
                  prayerName: _getLastPrayerName(state),
                  prayerTime: _formatTime(
                      _getLastPrayerTime(state), state.is24HourFormat),
                  timeInfo: _getTimeDifference(
                      _getLastPrayerTime(state), state.currentTime),
                ),
                Spacer(),
                PrayerCard(
                  title: 'Next Prayer'.i18n,
                  prayerName: nextPrayer?.toString().split('.').last ?? '-',
                  prayerTime: _formatTime(nextPrayerTime, state.is24HourFormat),
                  timeInfo:
                      _getTimeDifference(nextPrayerTime, state.currentTime),
                  isNext: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _getLastPrayerName(PrayerState state) {
    final prayerTimes = state.prayerTimes;
    if (prayerTimes == null) return '-';
    for (var prayer in Prayer.values.reversed) {
      final prayerTime = prayerTimes.timeForPrayer(prayer);
      if (prayerTime != null && prayerTime.isBefore(state.currentTime)) {
        return prayer.toString().split('.').last;
      }
    }
    return '-';
  }

  DateTime? _getLastPrayerTime(PrayerState state) {
    final prayerTimes = state.prayerTimes;
    if (prayerTimes == null) return null;
    for (var prayer in Prayer.values.reversed) {
      final prayerTime = prayerTimes.timeForPrayer(prayer);
      if (prayerTime != null && prayerTime.isBefore(state.currentTime)) {
        return prayerTime;
      }
    }
    return null;
  }

  String _formatTime(DateTime? time, bool is24HourFormat) {
    if (time == null) return '-';
    if (is24HourFormat) {
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    } else {
      final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
      final period = time.hour < 12 ? 'AM' : 'PM';
      return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
    }
  }

  String _getTimeDifference(DateTime? prayerTime, DateTime currentTime) {
    if (prayerTime == null) return '-';
    final difference = prayerTime.difference(currentTime);
    final duration = Duration(minutes: difference.inMinutes.abs());

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (difference.isNegative) {
      return '${hours}h ${minutes}m';
    } else {
      return '${hours}h ${minutes}m';
    }
  }
}