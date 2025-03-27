import 'package:flutter_riverpod/flutter_riverpod.dart';

class EveningAzkarState {
  final int currentDuaIndex;
  final int totalDuas;

  EveningAzkarState({
    required this.currentDuaIndex,
    required this.totalDuas,
  });

  double get progress {
    return ((currentDuaIndex + 1) / totalDuas).clamp(0.0, 1.0);
  }

  EveningAzkarState copyWith({
    int? currentDuaIndex,
    int? totalDuas,
  }) {
    return EveningAzkarState(
      currentDuaIndex: currentDuaIndex ?? this.currentDuaIndex,
      totalDuas: totalDuas ?? this.totalDuas,
    );
  }
}

class EveningAzkarController extends StateNotifier<EveningAzkarState> {
  EveningAzkarController()
      : super(EveningAzkarState(
            currentDuaIndex: 0, totalDuas: 10)); 

  void nextDua() {
    if (state.currentDuaIndex < state.totalDuas - 1) {
      state = state.copyWith(currentDuaIndex: state.currentDuaIndex + 1);
    }
  }

  void resetProgress() {
    state = EveningAzkarState(currentDuaIndex: 0, totalDuas: state.totalDuas);
  }
}

final eveningAzkarControllerProvider =
    StateNotifierProvider<EveningAzkarController, EveningAzkarState>(
  (ref) => EveningAzkarController(),
);
