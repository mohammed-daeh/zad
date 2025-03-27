import 'package:awesome_notifications/awesome_notifications.dart';
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
import 'package:zad_almuslem/featuers/home/presentation/controllers/location_provider.dart';
import 'package:zad_almuslem/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedPreferencesAsync prefs = SharedPreferencesAsync();

  // إعداد AwesomeNotifications
  await AwesomeNotifications().initialize(
    'resource://mipmap/ic_launcher',
    [
      NotificationChannel(
        channelKey: 'prayer_channel_adhan',
        channelName: 'Basic Notifications',
        channelDescription: 'Channel for basic notifications',
        enableVibration: true,
        ledColor: Colors.red,
        ledOnMs: 1000,
        ledOffMs: 500,
        importance: NotificationImportance.Max,
        playSound: true,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        soundSource: 'resource://raw/notification_sound',
      ),
      NotificationChannel(
        channelKey: 'prayer_channel_alfajr',
        channelName: 'Basic Notifications',
        channelDescription: 'Channel for basic notifications',
        enableVibration: true,
        ledColor: Colors.red,
        ledOnMs: 1000,
        ledOffMs: 500,
        importance: NotificationImportance.Max,
        playSound: true,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        soundSource: 'resource://raw/notification_soundfajr',
      ),
    ],
  );

  // Language ------------------------------------------------------------------
  await MyI18n.loadTranslations();
  var language = await prefs.getString("language");
  Locale local = Locale("en", "US");
  switch (language) {
    case "arabic":
      local = Locale("ar", "AR");
      break;
    default:
  }
  // ---------------------------------------------------------------------------

  runApp(
    I18n(
      initialLocale: local,
      child: ProviderScope(
        child: MyApp(),
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
    ref.read(locationProvider.notifier).fetchLocation();

    return MaterialApp.router(
      builder: BotToastInit(),
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
