import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/routers/router.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedPreferencesAsync prefs = SharedPreferencesAsync();
//---------------------------------------------------
  // final themeStr =
  //     await rootBundle.loadString("assets/themes/light_theme.json");
  // final themeJson = jsonDecode(themeStr);
  // final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  // //-----------------//
  // final darkThemeStr =
  //     await rootBundle.loadString("assets/themes/dark_theme.json");
  // final darkThemeJson = jsonDecode(darkThemeStr);
  // final darkTtheme = ThemeDecoder.decodeThemeData(darkThemeJson)!;
//*************************************************************************** */
  await MyI18n.loadTranslations();
  var language = await prefs.getString("language");
  Locale local = Locale("en", "US");
  switch (language) {
    case "arabic":
      local = Locale("ar", "AR");
      break;
    default:
  }
/////////////////////////////////////////////////
  runApp(
    I18n(
      initialLocale: local,
      child: ProviderScope(
        child: MyApp(
            // theme: theme,
            // darkTheme: darkTtheme,
            ),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
// final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      builder: BotToastInit(),
      // theme: theme.copyWith(),
      // darkTheme: darkTheme,
      //     themeMode: themeMode,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Zain'),
        ),
      ),
      routerConfig: ref.watch(router),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("en", "US"), Locale("ar", "AR")],
      locale: I18n.of(context).locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
