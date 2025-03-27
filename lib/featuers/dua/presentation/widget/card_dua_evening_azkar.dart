// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/dua/presentation/controllers/evening_azkar_state.dart';

class CardEveningAzkar extends ConsumerWidget {
  const CardEveningAzkar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eveningAzkarControllerProvider);

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
            child: SvgPicture.asset(
              'assets/images/duaPage/zagrafa_corner_bottom_right.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/duaPage/Evening_Azkar.svg',
                  width: 40,
                  height: 40,
                ),
                SizedBox(height: 8),
                Text(
                  'evening Azkar'.i18n,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${state.currentDuaIndex + 1} / ${state.totalDuas}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff062437),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
                SizedBox(
                  width: 131,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: state.progress,
                    backgroundColor: const Color(0xffFFF2E5),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xffDEA56E)),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
