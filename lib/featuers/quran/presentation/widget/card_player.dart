// ignore_for_file: prefer_const_constructors, must_be_immutable, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardPlayer extends StatelessWidget {
  CardPlayer({super.key});
  String sura = 'Al-Fatihah';
  String pageNumper = '1';
  // final CardPlayController isPlayer = Get.put(CardPlayController());

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffEEF5FA),
        ),
        width: double.infinity,
        height: 85,
      ),
      Positioned(
          top: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
            child: SvgPicture.asset(
              'assets/images/quranPage/zagrafa_corner_right.svg',
              width: 50,
              height: 50,
            ),
          )),
      Positioned(
          bottom: 0,
          left: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              'assets/images/quranPage/zagrafa_corner_left.svg',
              width: 50,
              height: 50,
            ),
          )),
      Positioned(
        top: 0,
        left: 24,
        right: 35,
        bottom: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 24,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/quranPage/readerMishary.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              height: 48,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sura,
                    style: TextStyle(
                        color: Color(0xff124D73),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Page ${pageNumper}',
                    style: TextStyle(
                        color: Color(0xff124D73),
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/quranPage/play.svg',
                width: 20,
                height: 20,
              ),
            ),
            SizedBox(
              width: 28,
            ),
            InkWell(
              onTap: () {
                // isPlayer.toggleVisibility();
              },
              child: SvgPicture.asset(
                'assets/images/quranPage/exite.svg',
                width: 20,
                height: 20,
              ),
            )
          ],
        ),
      )
    ]);
  }
}
