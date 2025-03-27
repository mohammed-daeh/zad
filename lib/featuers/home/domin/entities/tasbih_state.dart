class TasbihState {
  final int currentCount;
  final int selectedTarget;
  final String currentTasbih;

  TasbihState({
    required this.currentCount,
    required this.selectedTarget,
    required this.currentTasbih,
  });

  TasbihState copyWith({
    int? currentCount,
    int? selectedTarget,
    String? currentTasbih,
  }) {
    return TasbihState(
      currentCount: currentCount ?? this.currentCount,
      selectedTarget: selectedTarget ?? this.selectedTarget,
      currentTasbih: currentTasbih ?? this.currentTasbih,
    );
  }
}