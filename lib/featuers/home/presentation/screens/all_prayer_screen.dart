// ignore_for_file: depend_on_referenced_packages

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/home/presentation/controllers/prayer_controller.dart';

class PrayerTimesPage extends ConsumerWidget {
  const PrayerTimesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(prayerControllerProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120), 
          child: AppBar(
            backgroundColor: AppColors.primary, 
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  "أوقات الصلاة",
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 10), 
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30), 
              child: Container(
                decoration: BoxDecoration(
                
                    ),
                child: TabBar(
                  indicatorColor:
                      AppColors.cardBackground2, 
                  labelColor: AppColors.yallowLight, 
                  unselectedLabelColor: AppColors.white, 
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(text: "اليوم".i18n),
                    Tab(text: "الشهر".i18n),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: state.prayerTimes == null
            ? Center(child: CircularProgressIndicator())
            : TabBarView(
                children: [
                  _buildDailyPrayerList(
                      state.prayerTimes!, state.is24HourFormat), 
                  _buildMonthlyPrayerTable(state.prayerTimes!), 
                ],
              ),
      ),
    );
  }

  Widget _buildDailyPrayerList(PrayerTimes prayerTimes, bool is24HourFormat) {
    final prayers = [
      {
        "name": "fajr".i18n,
        "icon": Icons.wb_sunny_outlined,
        "prayer": Prayer.fajr
      },
      {
        "name": "dhuhr".i18n,
        "icon": Icons.sunny,
        "prayer": Prayer.dhuhr,
      },
      {
        "name": "asr".i18n,
        "icon": Icons.cloud,
        "prayer": Prayer.asr,
      },
      {
        "name": "maghrib".i18n,
        "icon": Icons.sunny_snowing,
        "prayer": Prayer.maghrib
      },
      {
        "name": "isha".i18n,
        "icon": Icons.nightlight_round,
        "prayer": Prayer.isha
      },
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Gap(60),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                final prayerData = prayers[index];
                final prayer = prayerData["prayer"] as Prayer;
                final time = prayerTimes.timeForPrayer(prayer);
                final formattedTime = time != null
                    ? _formatTime(
                        time,
                      )
                    : "غير متاح";

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.yallowLight.withAlpha(150),
                            AppColors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.oxfordBlue,
                          child: Icon(
                            prayerData["icon"] as IconData,
                            color: AppColors.greyIconForm,
                          ),
                        ),
                        title: Text(
                          prayerData["name"] as String,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        trailing: Text(
                          formattedTime,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyPrayerTable(PrayerTimes prayerTimes) {
    final now = DateTime.now();
    final daysInMonth = List.generate(
      DateTime(now.year, now.month + 1, 0).day,
      (index) => DateTime(now.year, now.month, index + 1),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
              label:
                  Text("اليوم", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label:
                  Text("الفجر", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label:
                  Text("الظهر", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label:
                  Text("العصر", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text("المغرب",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text("العشاء",
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: daysInMonth.map((day) {
          final dailyPrayerTimes = PrayerTimes(
            Coordinates(36.58, 37.03), 
            DateComponents.from(day),
            CalculationMethod.karachi.getParameters(),
          );

          return DataRow(cells: [
            DataCell(Text(DateFormat('dd MMM').format(day))), 
            DataCell(
                Text(_formatTime(dailyPrayerTimes.timeForPrayer(Prayer.fajr)))),
            DataCell(Text(
                _formatTime(dailyPrayerTimes.timeForPrayer(Prayer.dhuhr)))),
            DataCell(
                Text(_formatTime(dailyPrayerTimes.timeForPrayer(Prayer.asr)))),
            DataCell(Text(
                _formatTime(dailyPrayerTimes.timeForPrayer(Prayer.maghrib)))),
            DataCell(
                Text(_formatTime(dailyPrayerTimes.timeForPrayer(Prayer.isha)))),
          ]);
        }).toList(),
      ),
    );
  }

  String _formatTime(DateTime? time) {
    if (time == null) return "غير متاح";
    return DateFormat('hh:mm a').format(time); 
  }
}