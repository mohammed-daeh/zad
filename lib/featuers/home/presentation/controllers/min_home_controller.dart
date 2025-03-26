import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavController extends StateNotifier<int> {
  BottomNavController() : super(0); // القيمة الافتراضية 

  void changeTabIndex(int index) {
    state = index; // تحديث الـ state مباشرة ليعمل مع Riverpod
  }
}

final bottomNavProvider = StateNotifierProvider<BottomNavController, int>(
  (ref) => BottomNavController(),
);
