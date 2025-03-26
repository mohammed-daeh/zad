// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zad_almuslem/featuers/quran/data/datasources/test/map_card_juz.dart';
import 'package:zad_almuslem/featuers/quran/presentation/widget/card_quran_juz.dart';
import 'package:zad_almuslem/shear/widget/text_field_search_quran.dart';



class JuzTabView extends StatelessWidget {
  JuzTabView({super.key});
  TextEditingController searchSuraView = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          TextFieldSearchQuran(
            controller: searchSuraView,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: mapCardJuz.length,
              itemBuilder: (context, index) {
                return CardQuranJuz(
                  juzNumber: mapCardJuz[index]['juzNumber'].toString(),
                  juzName: mapCardJuz[index]['juzName'].toString(),
                  count: mapCardJuz[index]['count'].toString(),
                  sura: mapCardJuz[index]['sura'].toString(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
