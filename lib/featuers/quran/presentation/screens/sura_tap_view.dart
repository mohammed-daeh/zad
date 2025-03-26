// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:zad_almuslem/featuers/quran/data/datasources/test/map_card_sura.dart';
import 'package:zad_almuslem/featuers/quran/presentation/widget/card_quran_sura.dart';
import 'package:zad_almuslem/shear/widget/text_field_search_quran.dart';

class SuraTapView extends StatelessWidget {
  SuraTapView({super.key});
  TextEditingController searchSuraView = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          TextFieldSearchQuran(controller: searchSuraView),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: mapSuraSura.length,
              itemBuilder: (context, index) {
                return CardQuranSura(
                  suraNumber: mapSuraSura[index]['suraNumber'].toString(),
                  suraName: mapSuraSura[index]['suraName'].toString(),
                  versesNumber: mapSuraSura[index]['versesNumber'].toString(),
                  suraType: mapSuraSura[index]['suraType'].toString(),
                  pathOfNameSura:
                      mapSuraSura[index]['pathOfNameSura'].toString(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
