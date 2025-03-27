import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/home/presentation/controllers/tasbih_notifier.dart';

class TasbihScreen extends ConsumerWidget {
  const TasbihScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(tasbihProvider.notifier);
    final state = ref.watch(tasbihProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "التسبيح",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Choose Target".i18n,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.targets.length,
                itemBuilder: (context, index) {
                  final target = controller.targets[index];
                  return GestureDetector(
                    onTap: () => controller.setTarget(target),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 100,
                      decoration: BoxDecoration(
                        color: state.selectedTarget == target
                            ? Colors.teal
                            : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "$target",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: state.selectedTarget == target
                                ? Colors.white
                                : Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              state.currentTasbih,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "${state.currentCount} / ${state.selectedTarget}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: controller.incrementCounter,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                "Tasbih".i18n,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.oxfordBlue),
              ),
            ),
            SizedBox(height: 30),
            OutlinedButton(
              onPressed: controller.resetCounter,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white, width: 2),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                "Reset".i18n,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
