// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class TextFieldSearchQuran extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldSearchQuran({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search'.i18n,
          suffixIcon: SvgPicture.asset(
            'assets/icons/research.svg',
            width: 10,
            height: 10,
            fit: BoxFit.scaleDown,
          ),
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xffAFACB2)),
          // color: Color.fromRGBO(121, 116, 126, 1)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffECEBE3)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff124D73)),
          ),
        ),
      ),
    );
  }
}
