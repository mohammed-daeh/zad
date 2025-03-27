import 'package:adhan/adhan.dart';

class PrayerState {
  final PrayerTimes? prayerTimes;
  final Prayer? nextPrayer;
  final DateTime currentTime;
  final bool is24HourFormat; 

  PrayerState({
    this.prayerTimes,
    this.nextPrayer,
    required this.currentTime,
    this.is24HourFormat = true,
  });

  PrayerState copyWith({
    PrayerTimes? prayerTimes,
    Prayer? nextPrayer,
    DateTime? currentTime,
    bool? is24HourFormat,
  }) {
    return PrayerState(
      prayerTimes: prayerTimes ?? this.prayerTimes,
      nextPrayer: nextPrayer ?? this.nextPrayer,
      currentTime: currentTime ?? this.currentTime,
      is24HourFormat: is24HourFormat ?? this.is24HourFormat,
    );
  }
}