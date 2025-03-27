import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class PrayerCard extends StatelessWidget {
  final String title;
  final String prayerName;
  final String prayerTime;
  final String timeInfo;
  final bool isNext;

  const PrayerCard({
    super.key,
    required this.title,
    required this.prayerName,
    required this.prayerTime,
    required this.timeInfo,
    this.isNext = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffEEF7F9),
              ),
              child: Text(
                title.i18n,
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: prayerName.i18n,
                        style: TextStyle(
                          color: Color(0xffF18C2C),
                          fontSize: 14,
                          letterSpacing: 0.15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' at ',
                        style: TextStyle(
                          color: Color(0xff062437),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: prayerTime,
                        style: TextStyle(
                          color: Color(0xff062437),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/time.svg',
                  fit: BoxFit.scaleDown,
                  width: 12,
                  height: 12,
                ),
                SizedBox(width: 5),
                Text(
                  isNext ? 'after '.i18n : '',
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  timeInfo,
                  style: TextStyle(fontSize: 13),
                ),
                if (!isNext)
                  Text(
                    ' ago'.i18n,
                    style: TextStyle(fontSize: 13),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
