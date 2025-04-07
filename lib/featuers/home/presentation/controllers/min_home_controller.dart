import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavController extends StateNotifier<int> {
  BottomNavController() : super(0); 

  void changeTabIndex(int index) {
    state = index; 
  }
}

final bottomNavProvider = StateNotifierProvider<BottomNavController, int>(
  (ref) => BottomNavController(),
);
