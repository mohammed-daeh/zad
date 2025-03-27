import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zad_almuslem/featuers/dua/presentation/screens/dua_view.dart';
import 'package:zad_almuslem/featuers/home/presentation/screens/home_screen.dart';
import 'package:zad_almuslem/featuers/home/presentation/widget/custom_bottom_navigation_bar.dart';
import 'package:zad_almuslem/featuers/quran/presentation/screens/quran_screen.dart';
import 'package:zad_almuslem/featuers/settings/presentation/screens/settings_screen.dart';
import 'package:zad_almuslem/featuers/home/presentation/controllers/min_home_controller.dart';

class MainHome extends ConsumerWidget {
  MainHome({super.key});

  final List<String> iconPathsActive = [
    'assets/icons/home_screen_color.svg',
    'assets/icons/quran_color.svg',
    'assets/icons/dua_color.svg',
    'assets/icons/settings.svg',
  ];

  final List<String> iconPathsInactive = [
    'assets/icons/home_screen_gray.svg',
    'assets/icons/quran_gray.svg',
    'assets/icons/dua_gray.svg',
    'assets/icons/settings.svg',
  ];

  final List<Widget> _pages = [
    HomeScreen(),
    QuranScreen(),
    DuaView(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex =
        ref.watch(bottomNavProvider); 

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

     
        );
  }
}
