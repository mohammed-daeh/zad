
// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class CardTodaysHadith extends StatelessWidget {
  CardTodaysHadith({super.key});
  String hadeth =
      'عَنْ أَبِي سَعِيدٍ الْخُذْرِيِّ رَضِيَ اللَّهُ عَنْهُ عَنْ رَسُولِ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ قَالَ : ( إِذَا خَلَصَ الْمُؤْمِنُونَ مِنْ النَّارِ حُبِسُوا بِقَنْطَرَةِ بَيْنَ الْجَنَّةِ وَالنَّارِ ، فَيَتَقَاصُونَ مَظَالِمَ كَانَتْ بَيْنَهُمْ فِي الدُّنْيَا ، حَتَّى إِذَا نُقُوا وَهُذِّبُوا أُذِنَ لَهُمْ بِدُخُولِ الْجَنَّةِ )';
  String alraawy = 'رواه البخاري';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE0ECEE)),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SvgPicture.asset(
                'assets/images/zz.svg',
                fit: BoxFit.scaleDown,
         
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'today hadith'.i18n,
                            style: TextStyle(
                                color: Color(0xff124D73),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Container(
                            height: 2,
                            width: 32,
                            decoration: BoxDecoration(color: Color(0xffF6DAC2)),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/copy.svg',
                        ),
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/sharing.svg',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      hadeth,
                      style: TextStyle(
                        color: Color(0xff124D73),
                        fontSize: 16,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Divider(color: Color(0xffECEBE3)),
                  Text(
                    alraawy,
                    style: TextStyle(
                      color: Color(0xff124D73),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
