import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zad_almuslem/featuers/home/domin/entities/tasbih_state.dart';

class TasbihNotifier extends StateNotifier<TasbihState> {
  TasbihNotifier()
      : super(TasbihState(
            currentCount: 0, selectedTarget: 33, currentTasbih: "سبحان الله")) {
    _loadData();
  }

  final List<int> targets = [10, 33, 100, 1000];
  final List<String> tasbihaat = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر"
  ];

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentCount', state.currentCount);
    await prefs.setInt('selectedTarget', state.selectedTarget);
    await prefs.setString('currentTasbih', state.currentTasbih);
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('currentCount') ?? 0;
    final target = prefs.getInt('selectedTarget') ?? 33;
    final tasbih = prefs.getString('currentTasbih') ?? "سبحان الله";
    state = TasbihState(
        currentCount: count, selectedTarget: target, currentTasbih: tasbih);
  }

  void incrementCounter() {
    if (state.currentCount < state.selectedTarget) {
      state = state.copyWith(currentCount: state.currentCount + 1);
    } else {
      nextTasbih();
    }
    _saveData();
  }

  void nextTasbih() {
    int currentIndex = tasbihaat.indexOf(state.currentTasbih);
    final newTasbih = tasbihaat[(currentIndex + 1) % tasbihaat.length];
    state = state.copyWith(currentTasbih: newTasbih, currentCount: 0);
    _saveData();
  }

  void resetCounter() {
    state = TasbihState(
        currentCount: 0, selectedTarget: 33, currentTasbih: tasbihaat[0]);
    _saveData();
  }

  void setTarget(int target) {
    state = state.copyWith(
        selectedTarget: target, currentCount: 0, currentTasbih: tasbihaat[0]);
    _saveData();
  }
}

final tasbihProvider =
    StateNotifierProvider<TasbihNotifier, TasbihState>((ref) {
  return TasbihNotifier();
});
