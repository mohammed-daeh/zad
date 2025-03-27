// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reactive_forms/reactive_forms.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/auth/presentation/widgets/reactive_text_input_widget.dart';

class ReactivePasswordInputWidget extends ConsumerWidget {
  const ReactivePasswordInputWidget({
    super.key,
    required this.hint,
    this.validationMessages,
    required this.controllerName,
    this.inputStyle = InputStyle.outlined,
    this.showEye = true,
    this.textInputAction,
  });

  final String hint;
  final Map<String, String Function(Object)>? validationMessages;
  final String controllerName;
  final InputStyle inputStyle;
  final bool showEye;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context, ref) {
    var showText = ref.watch(showTextProvider(controllerName));
    final theme = Theme.of(context);

    return ReactiveTextField(
      textInputAction: textInputAction ?? TextInputAction.done,
      obscureText: !showText, 
      formControlName: controllerName,
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
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
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
        suffixIcon: showEye
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      ref.read(showTextProvider(controllerName).notifier).state = !showText;
                    },
                    icon: Icon(
                      showText ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.greyHintForm,
                      size: 22,
                    ),
                  ),
                ),
              )
            : null,
      ),
      validationMessages: validationMessages ?? {
        "required": (o) => "Required".i18n,
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


final showTextProvider = StateProvider.family<bool, String>((ref, controllerName) {
  return false;
});
