// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
final List<Map<String, String>> mapOnBoarding = [
  {
    'title': 'Welcome to Zad Almuslem',
    'description1': 'Accurate prayer times based on your location,',
    'description2': 'with precise alerts for every prayer.',
    'image': 'assets/onboarding/prayer_time.svg',
  },
  {
    'title': 'The Holy Quran at Your Fingertips',
    'description1': 'Recitation, Tafsir, and reading progress tracking—',
    'description2': 'everything you need in one digital Mushaf.',
    'image': 'assets/onboarding/quran_reading.svg',
  },
  {
    'title': 'Glorify, Seek Forgiveness, and Pray',
    'description1': 'Smart Tasbih counter and a variety of supplications,',
    'description2': 'making your remembrance of Allah easier and organized.',
    'image': 'assets/onboarding/zikr_dua.svg',
  },
];


  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Widget _buildDot({required int index}) {
    return InkWell(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: _currentPage == index ? 32 : 8,
        decoration: BoxDecoration(
          color: _currentPage == index ? AppColors.oxfordBlue : Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 40,
            child: PageView.builder(
                onPageChanged: _onPageChanged,
                controller: _pageController,
                itemCount: mapOnBoarding.length,
                itemBuilder: (context, index) {
                  return Stack(clipBehavior: Clip.none, children: [
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Container(
                      height: 553,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
                      ),
                      child: SvgPicture.asset(
                        mapOnBoarding[index]['image'].toString(),
                        width: 50,
                        height: 50,
                        fit: BoxFit.scaleDown,
                      ),
                    ),

                    Positioned(
                      bottom: 130,
                      right: 15,
                      left: 15,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: Offset(0, 5),
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mapOnBoarding[index]['title'].toString().i18n,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  mapOnBoarding[index]['description1']
                                      .toString()
                                      .i18n,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  mapOnBoarding[index]['description2']
                                      .toString()
                                      .i18n,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      left: 20,
                      bottom: 40,
                      child: Column(
                        children: [
                          if (_currentPage != 2)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear,
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 148,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppColors.oxfordBlue,
                                      borderRadius: BorderRadius.circular(48),
                                    ),
                                    child: Text(
                                      'Next'.i18n,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _pageController.animateToPage(
                                      2,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.linear,
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.greyborder,
                                      ),
                                      borderRadius: BorderRadius.circular(48),
                                    ),
                                    width: 148,
                                    height: 48,
                                    child: Text(
                                      'Skip'.i18n,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyborder,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          else
                            Center(
                              child: InkWell(
                                onTap: () {
                                  context.push('/regester');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 297,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppColors.zomp,
                                    borderRadius: BorderRadius.circular(48),
                                  ),
                                  child: Text(
                                    'Lets Start Now'.i18n,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  
                  ]);
                }),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(mapOnBoarding.length, (index) {
              return _buildDot(index: index);
            }),
          ),
        ],
      ),
    );
  }
}
 
