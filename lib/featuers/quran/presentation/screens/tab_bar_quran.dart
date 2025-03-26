// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/quran/presentation/screens/hizb_tab_view.dart';
import 'package:zad_almuslem/featuers/quran/presentation/screens/juz_tab_view.dart';
import 'package:zad_almuslem/featuers/quran/presentation/screens/sura_tap_view.dart';

class TabBarQuran extends StatelessWidget {
  TabBarQuran({super.key});
  final PageController _pageController = PageController();
  // final TabControllerPageQuran _tabController =
  //     Get.put(TabControllerPageQuran());
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 115,
                    child: GestureDetector(
                        onTap: () {
                          // _tabController.changeTab(0);
                          _pageController.animateToPage(
                            0,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child:
                            //  Obx(() =>
                            Text(
                          'Sura'.i18n,
                          style: TextStyle(
                              color: Colors.red,
                              // color: _tabController.indexPageQuran == 0
                              //     ? Color(0xff124D73)
                              //     : Color(0xff79747E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                        // ),
                        ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 115,
                    child: GestureDetector(
                        onTap: () {
                          // _tabController.changeTab(1);
                          _pageController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child:
                            // Obx(() =>
                            Text(
                          'Juz'.i18n,
                          style: TextStyle(
                              color: Colors.red,
                              // color: _tabController.indexPageQuran == 1
                              //     ? Color(0xff124D73)
                              //     : Color(0xff79747E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                        // ),
                        ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 115,
                    child: GestureDetector(
                        onTap: () {
                          // _tabController.changeTab(2);
                          _pageController.animateToPage(
                            2,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child:
                            // Obx(() =>
                            Text(
                          'Hizb'.i18n,
                          style: TextStyle(
                              color: Colors.green,
                              // color: _tabController.indexPageQuran == 2
                              //     ? Color(0xff124D73)
                              //     : Color(0xff7E7479),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                        // ),
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              height: 4,
              width: double.infinity,
              color: Color(0xffEEF7F9),
              child: Stack(
                children: [
                  // Obx(
                  // () =>
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(
                        // left: _tabController.indexPageQuran.toDouble() *
                        // ((MediaQuery.of(context).size.width - 32) / 3),
                        ),
                    width: 83,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xff124D73),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  // _tabController.changeTab(index);
                },
                children: [
                  // Text('data'),
                  // Text('data'),
                  // Text('data'),
                  SuraTapView(),
                  JuzTabView(),
                  HizbTabView(),
                ],
              ),
            ),
          ],
        ));
  }
}
