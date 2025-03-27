// ignore_for_file: unused_local_variable, avoid_print

import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zad_almuslem/featuers/home/domin/entities/prayer_state.dart';

final prayerControllerProvider =
    StateNotifierProvider<PrayerController, PrayerState>(
  (ref) => PrayerController(),
);

class PrayerController extends StateNotifier<PrayerState> {
  Timer? _timer;

  PrayerController() : super(PrayerState(currentTime: DateTime.now())) {
    _initializePrayerTimes();
  }
  void checkStoredLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final latitude = prefs.getDouble('latitude');
    final longitude = prefs.getDouble('longitude');

    if (latitude == null || longitude == null) {
      print("Location data is missing or invalid.");
    } else {
      print("Stored location: Latitude=$latitude, Longitude=$longitude");
    }
  }

  Future<void> _initializePrayerTimes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final latitude = prefs.getDouble('latitude');
      final longitude = prefs.getDouble('longitude');

      if (latitude == null || longitude == null) {
        throw Exception("Location data not found in SharedPreferences.");
      }

      final myCoordinates = Coordinates(latitude, longitude);
      final params = CalculationMethod.karachi.getParameters();
      params.madhab = Madhab.hanafi;

      final todayDateComponents = DateComponents.from(DateTime.now());

      final prayerTimes = PrayerTimes(
        myCoordinates,
        todayDateComponents, 
        params, 
      );

      for (var prayer in Prayer.values) {
        final prayerTime = prayerTimes.timeForPrayer(prayer);
        print(
            '${prayer.toString().split('.').last}: ${prayerTime?.toString()}');
      }

      Prayer? nextPrayer;
      DateTime? nextPrayerTime;

      for (var prayer in Prayer.values) {
        final prayerTime = prayerTimes.timeForPrayer(prayer);
        if (prayerTime != null && prayerTime.isAfter(DateTime.now())) {
          nextPrayer = prayer;
          nextPrayerTime = prayerTime;
          break;
        }
      }

      if (nextPrayer == null) {
        final tomorrow = DateTime.now().add(Duration(days: 1));
        final tomorrowDateComponents = DateComponents.from(tomorrow);

        final tomorrowPrayerTimes = PrayerTimes(
          myCoordinates,
          tomorrowDateComponents,
          params, 
        );

        nextPrayer = Prayer.fajr;
        nextPrayerTime = tomorrowPrayerTimes.timeForPrayer(Prayer.fajr);
      }

      state = state.copyWith(prayerTimes: prayerTimes, nextPrayer: nextPrayer);

      _schedulePrayerNotifications(prayerTimes);
      _startTimer();
    } catch (e) {
      print("Error initializing prayer times: $e");

      state = state.copyWith(prayerTimes: null, nextPrayer: null);
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      state = state.copyWith(currentTime: DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void toggleTimeFormat() {
    state = state.copyWith(is24HourFormat: !state.is24HourFormat);
  }

  void _schedulePrayerNotifications(PrayerTimes prayerTimes) {
    for (final prayer in Prayer.values) {
      final prayerTime = prayerTimes.timeForPrayer(prayer);
      if (prayerTime == null || !prayerTime.isAfter(DateTime.now())) continue;

      if (prayer == Prayer.fajr) {
        _scheduleSegmentedFajrNotification(prayer, prayerTime);
      } else {
        _scheduleStandardNotification(prayer, prayerTime);
      }
    }
  }

  void _scheduleStandardNotification(Prayer prayer, DateTime time) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: prayer.index + 100,
        channelKey: 'prayer_channel_adhan',
        title: 'موعد صلاة ${prayer.toString().split('.').last}',
        body:
            'حان الآن موعد صلاة ${prayer.toString().split('.').last} في ${time.hour}:${time.minute.toString().padLeft(2, '0')}',
        payload: {
          'prayer': prayer.toString().split('.').last,
          'time': '${time.hour}:${time.minute.toString().padLeft(2, '0')}'
        },
      ),
      schedule: NotificationCalendar.fromDate(date: time),
    );
  }

  void _scheduleSegmentedFajrNotification(Prayer prayer, DateTime time) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: prayer.index + 300,
        channelKey: 'prayer_channel_alfajr',
        title: 'أذان الفجر',
        body:
            'حان الآن موعد صلاة الفجر في ${time.hour}:${time.minute.toString().padLeft(2, '0')}. الصلاة خير من النوم!',
        payload: {
          'prayer': prayer.toString().split('.').last,
          'time': '${time.hour}:${time.minute.toString().padLeft(2, '0')}'
        },
      ),
      schedule: NotificationCalendar.fromDate(date: time),
    );
  }
}