import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zad_almuslem/featuers/dua/dua/dua_view.dart';
import 'package:zad_almuslem/featuers/home/presentation/screens/home_screen.dart';
import 'package:zad_almuslem/featuers/home/presentation/widget/custom_bottom_navigation_bar.dart';
import 'package:zad_almuslem/featuers/quran/presentation/screens/quran_screen.dart';
// import 'package:zad_almuslem/test/test3.dart';
import 'package:zad_almuslem/test/test4.dart';
import 'package:zad_almuslem/featuers/home/presentation/controllers/min_home_controller.dart'; // تأكد من استيراد الكنترولر الصحيح

class MainHome extends ConsumerWidget {
  MainHome({super.key});

  final List<String> iconPathsActive = [
    'assets/icons/home_screen_color.svg',
    'assets/icons/quran_color1.svg',
    'assets/icons/prayer.svg',
    // 'assets/icons/statistics.svg',
    'assets/icons/settings.svg',
  ];

  final List<String> iconPathsInactive = [
    'assets/icons/home_screen_gray.svg',
    'assets/icons/quran_gray.svg',
    'assets/icons/prayer.svg',
    // 'assets/icons/statistics.svg',
    'assets/icons/settings.svg',
  ];

  final List<Widget> _pages = [
    HomeScreen(),
    QuranScreen(),
    DuaView(),
    // Test3(),
    Test4(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex =
        ref.watch(bottomNavProvider); // احصل على الحالة مباشرة

    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(child: _pages[selectedIndex]),
        Positioned(
          right: 10,
          left: 10,
          bottom: 20,
          child: CustomBottomNavigationBar(
            activeIcons: iconPathsActive,
            inactiveIcons: iconPathsInactive,
            selectedIndex: selectedIndex,
            onTabSelected: (index) =>
                ref.read(bottomNavProvider.notifier).changeTabIndex(index),
          ),
        )
      ],
    )

        //  _pages[selectedIndex], // تحديث تلقائي عند تغيير الـ state
        // bottomNavigationBar: CustomBottomNavigationBar(
        //   activeIcons: iconPathsActive,
        //   inactiveIcons: iconPathsInactive,
        //   selectedIndex: selectedIndex,
        //   onTabSelected: (index) =>
        //       ref.read(bottomNavProvider.notifier).changeTabIndex(index),
        // ),
        );
  }
}
