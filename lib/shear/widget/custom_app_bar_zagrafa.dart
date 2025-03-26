// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class CustomAppBarZagrafa extends StatelessWidget {
  CustomAppBarZagrafa({
    super.key,
    required this.titel,
    required this.body,
    required this.sizeAppBar,
    this.action,
  });
  String titel;
  double sizeAppBar;
  Widget body;
  SvgPicture? action;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: myLinearGradient),
        ),
        Positioned(
          left: 0,
          child: SvgPicture.asset(
            'assets/images/khatamPage/zagrafa_horizontal.svg',
          ),
        ),
        Positioned(
          top: 55,
          left: 16,
          right: 18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/images/khatamPage/arrow_back_white.svg',
                  width: 16,
                  height: 16,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                titel.i18n,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              SizedBox(child: action),
            ],
          ),
        ),
        Positioned(
            top: sizeAppBar,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: body,
            ))
      ],
    );
  }
}
