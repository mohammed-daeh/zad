// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

enum Languages { english, arabic }

class LanguageDialogWidget extends StatelessWidget {
  const LanguageDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = I18n.of(context).locale.languageCode == "en"
        ? Languages.english
        : Languages.arabic;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text("Select Language".i18n),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            selectedTileColor: AppColors.primary.withOpacity(0.2),
            selected: lang == Languages.english,
            title: Text("English".i18n),
            onTap: () async {
              SharedPreferencesAsync lang = SharedPreferencesAsync();
              await lang.setString('language', Languages.english.name).then(
                (value) {
                  I18n.of(context).locale = const Locale('en', 'US');
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          const Divider(height: 1, color: Colors.grey),

          ListTile(
            selectedTileColor: AppColors.primary.withOpacity(0.2),
            selected: lang == Languages.arabic,
            title: Text("Arabic".i18n),
            onTap: () async {
              SharedPreferencesAsync lang = SharedPreferencesAsync();
              await lang.setString('language', Languages.arabic.name).then(
                (value) {
                  I18n.of(context).locale = const Locale('ar', 'SA');
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
