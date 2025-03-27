// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/featuers/quran/presentation/screens/header_page.dart';
import 'package:zad_almuslem/featuers/quran/presentation/screens/tab_bar_quran.dart';
import 'package:zad_almuslem/featuers/quran/presentation/widget/card_player.dart';

class QuranScreen extends StatelessWidget {
 const QuranScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff134e74),
              Color(0xff2b6b89),
            ], begin: Alignment.topRight, end: Alignment.topLeft)),
          ),
          SvgPicture.asset('assets/images/quranPage/zagrafa_blue.svg',
              width: double.infinity, height: 250, fit: BoxFit.cover),
          Positioned(
            right: 16,
            left: 16,
            top: 50,
            child: HeaderPage(),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 172,
            bottom: 0,
            child: TabBarQuran(),
          ),
          Positioned(
            right: 16,
            left: 16,
            bottom: 80,
            child:
              Visibility(
                child: CardPlayer(),
              )
          
          ),
        ],
      ),
    );
  }
}
