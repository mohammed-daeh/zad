import 'package:flutter_riverpod/flutter_riverpod.dart';

class MorningAzkarState {
  final int currentDuaIndex;
  final int totalDuas;

  MorningAzkarState({
    required this.currentDuaIndex,
    required this.totalDuas,
  });

  double get progress {
    return ((currentDuaIndex + 1) / totalDuas).clamp(0.0, 1.0);
  }

  MorningAzkarState copyWith({
    int? currentDuaIndex,
    int? totalDuas,
  }) {
    return MorningAzkarState(
      currentDuaIndex: currentDuaIndex ?? this.currentDuaIndex,
      totalDuas: totalDuas ?? this.totalDuas,
    );
  }
}

class MorningAzkarController extends StateNotifier<MorningAzkarState> {
  MorningAzkarController()
      : super(MorningAzkarState(
            currentDuaIndex: 0, totalDuas: 10)); // تحديث العدد الإجمالي إلى 11

  void nextDua() {
    if (state.currentDuaIndex < state.totalDuas - 1) {
      state = state.copyWith(currentDuaIndex: state.currentDuaIndex + 1);
    }
  }

  void resetProgress() {
    state = MorningAzkarState(currentDuaIndex: 0, totalDuas: state.totalDuas);
  }
}

final morningAzkarProvider =
    StateNotifierProvider<MorningAzkarController, MorningAzkarState>(
  (ref) => MorningAzkarController(),
);
