
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zad_almuslem/featuers/auth/application/auth_notifier_provider.dart';
import 'package:zad_almuslem/featuers/auth/presentation/screens/log_in_screen.dart';
import 'package:zad_almuslem/featuers/auth/presentation/screens/sign_up_screen.dart';
import 'package:zad_almuslem/featuers/home/presentation/screens/all_prayer_screen.dart';
import 'package:zad_almuslem/featuers/home/presentation/screens/main_home.dart';
import 'package:zad_almuslem/featuers/home/presentation/screens/qibla_direction_screen.dart';
import 'package:zad_almuslem/featuers/home/presentation/screens/tasbih_screen.dart';
import 'package:zad_almuslem/featuers/splash_screen/splash_screen.dart';

final router = Provider(
  (ref) => GoRouter(
    // initialLocation: "/splash",
    observers: [BotToastNavigatorObserver()],
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: "/",
        name: "/",
        builder: (context, state) {
          return MainHome();
        },
        routes: [
          GoRoute(
            path: "/Prayer",
            name: "/all_prayer",
            builder: (context, state) {
              return PrayerTimesPage();
            },
          ),
          GoRoute(
            path: "/Qibla",
            name: "/Qibla",
            builder: (context, state) {
              return QiblaDirectionScreen();
            },
          ),
          GoRoute(
            path: "/Tasbih",
            name: "/Tasbih",
            builder: (context, state) {
              return TasbihScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: "/login",
        name: "/login",
        builder: (context, state) {
          return LogInScreen();
        },
      ),
      GoRoute(
        path: "/signup",
        name: "/signup",
        builder: (context, state) {
          return SignUpScreen();
        },
      )
    ],
    redirect: (context, state) async {
      String? userId = ref.watch(authNotifierProvider)?.id;

      // Get saved id from shared preferences
      final prefs = SharedPreferencesAsync();
      final savedId = await prefs.getString("userId");

      if (state.fullPath == "/login") {
        if (userId == null && (savedId == null || savedId.isEmpty)) {
          return "/login";
        } else if (userId == null && savedId != null && savedId.isNotEmpty) {
          return "/splash";
        } else {
          return "/";
        }
      } else {
        if (userId == null && (savedId == null || savedId.isEmpty)) {
          if (state.fullPath == "/signup") return null;
          return "/login";
        } else if (userId == null && savedId != null && savedId.isNotEmpty) {
          return "/splash";
        } else {
          return null;
        }
      }
    },
  ),
);

