// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class MorningDuaView extends StatelessWidget {
  MorningDuaView({super.key});

  String basmalah = 'أَعُوذُ باللّهِ مِنَ الشَّيطَانِ الرَّجِيم';
  String sura =
      'اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ. ';
  String text =
      'مَن قالها حين يُصبح أُجيرَ مِن الجِنِّ حتّى يُمسي. ومَن قالها حين يُمسي أُجيرَ مِن الجِنِّ حتّى يُصبح.';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: myLinearGradient),
          ),
          Positioned(
            left: 0,
            child: SvgPicture.asset(
              'assets/images/khatamPage/zagrafa_horizontal.svg',
            ),
          ),
          Positioned(
            top: 55,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/images/khatamPage/arrow_back_white.svg',
                    width: 16,
                    height: 16,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'morning Dua',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/duaPage/sound.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SvgPicture.asset(
                      'assets/images/duaPage/refresh.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SvgPicture.asset(
                      'assets/images/duaPage/setting.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 90,
            child: Container(
              color: Color(0xffFFF2E5),
              height: 8,
              child: LinearProgressIndicator(
                // value: progres,
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(10)),
                backgroundColor: const Color(0xffFFF2E5),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xffDEA56E)),
              ),
            ),
          ),
          Positioned(
            top: 98,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 16,
                left: 15,
                right: 15,
                bottom: 60,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffE0ECEE),
                  ),
                  color: Color(0xffF8FCFF),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/images/duaPage/refresh_blue.svg',
                            width: 15,
                            height: 15,
                          ),
                          Text(
                            'reset'.i18n,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff063350),
                            ),
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Text(
                            'controller',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff063350),
                            ),
                          ),
                          Text(
                            'out Of'.i18n,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff063350),
                            ),
                          ),
                          Text(
                            'controller',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff063350),
                            ),
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Text(
                            'repetitions:'.i18n,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff063350),
                            ),
                          ),
                          Text(
                            'controller',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff063350),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xffE0ECEE),
                    ),
                    SizedBox(
                      height: 53,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            textDirection: TextDirection.rtl,
                            basmalah,
                            style: TextStyle(
                              color: Color(0xff345870),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            sura,
                            style: TextStyle(
                              color: Color(0xff124D73),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            text,
                            style: TextStyle(
                              color: Color(0xff345870),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 176,
            right: 16,
            child: SvgPicture.asset(
                'assets/images/duaPage/zagrafa_corner_top_right2.svg'),
          ),
          Positioned(
            bottom: 60,
            left: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)),
              child: SvgPicture.asset(
                  'assets/images/duaPage/zagrafa_corner_bottom_left.svg'),
            ),
          ),
          
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xffE0ECEE), width: 1),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 120,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 7,
                                color: Colors.white,
                              ),
                            ),
                            child: ProgressWithText(
                              progress: 15.5,
                              text:
                                  'controller',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressWithText extends StatelessWidget {
  final double progress;
  final String text;

  const ProgressWithText(
      {super.key, required this.progress, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 88,
          height: 88,
          child: CircularProgressIndicator(
            semanticsLabel: 'progress',
            value: progress,
            strokeCap: StrokeCap.round,
            backgroundColor: const Color(0xffE0ECEE),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff124D73)),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff124D73),
          ),
        ),
      ],
    );
  }
}
