import 'package:flutter/material.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.width,
  });
  final String text;
  final Function()? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF2575fc),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        onPressed: onTap,
        child: Text(text.i18n),
      ),
    );
  }
}
