import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollControllerX extends StateNotifier<double> {
  ScrollControllerX() : super(0.0);

  void updateScroll(double offset) => state = offset;
}

final scrollOffsetProvider = StateNotifierProvider<ScrollControllerX, double>(
  (ref) => ScrollControllerX(),
);
