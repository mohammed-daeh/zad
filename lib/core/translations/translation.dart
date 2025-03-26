import 'package:i18n_extension/i18n_extension.dart';
import 'package:i18n_extension_importer/i18n_extension_importer.dart';

class MyI18n {
  static Translations translations = Translations.byLocale("en-US");

  static Future<void> loadTranslations() async {
    translations +=
        await JSONImporter().fromAssetDirectory("assets/translations/");
  }
}

extension Localization on String {
  String get i18n => localize(this, MyI18n.translations);
  String fill(List<Object> params) => localizeFill(this, params);
  String plural(value) => localizePlural(value, this, MyI18n.translations);
}
