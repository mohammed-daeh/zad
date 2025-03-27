// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';


enum InputStyle { underlined, outlined, filled }


class ReactiveTextInputWidget extends StatelessWidget {
  const ReactiveTextInputWidget({
    super.key,
    required this.hint,
    this.validationMessages,
    required this.controllerName,
    this.inputStyle = InputStyle.outlined,
    this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
  });

  final String hint;
  final Map<String, String Function(Object)>? validationMessages;
  final String controllerName;
  final InputStyle inputStyle;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ReactiveTextField(
      formControlName: controllerName,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: hint.i18n,
        hintText: hint.i18n,
        labelStyle: TextStyle(
          color: AppColors.greyHintForm,
          fontSize: 14,
        ),
        filled: true,
        fillColor: AppColors.white.withOpacity(0.05),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        border: _getInputBorder(inputStyle),
        enabledBorder: _getInputBorder(inputStyle),
        focusedBorder: _getInputBorder(inputStyle).copyWith(
          borderSide: BorderSide(
            color: AppColors.mountainMeadow,
            width: 1.8,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: theme.colorScheme.error,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: theme.colorScheme.error,
            width: 2,
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8, right: 4),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 8, left: 4),
                child: suffixIcon,
              )
            : null,
      ),
      validationMessages: validationMessages ??
          {
            "required": (o) => "Required".i18n,
            "email": (o) => "Email is not valid".i18n,
            "minLength": (o) => "Too short".i18n,
          },
    );
  }

  InputBorder _getInputBorder(InputStyle? style) {
    switch (style) {
      case InputStyle.underlined:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyHintForm),
        );
      case InputStyle.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.greyHintForm.withOpacity(0.3),
            width: 1.2,
          ),
        );
      case InputStyle.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.greyHintForm.withOpacity(0.3),
            width: 1.2,
          ),
        );
    }
  }
}