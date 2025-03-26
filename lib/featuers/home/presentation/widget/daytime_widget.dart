// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PictureDaytime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String imagePath;

    if (now.hour >= 18 || now.hour < 5) {
      imagePath = 'assets/images/fajr01.svg';
    } else if (now.hour >= 5 && now.hour < 12) {
      imagePath = 'assets/images/dinner.svg';
    } else if (now.hour >= 12 && now.hour < 18) {
      imagePath = 'assets/images/noon.svg';
    } else {
      imagePath = 'assets/images/noon.svg';
    }

    return SizedBox(
      width: double.infinity, height: 300,
      // color: Colors.amber,
      child: SvgPicture.asset(
        imagePath,
        // height: 400,
        fit: BoxFit.cover,
      ),
    );
  }
}
