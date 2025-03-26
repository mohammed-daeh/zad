import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:zad_almuslem/featuers/auth/presentation/controllers/auth_controller.dart';
import 'package:zad_almuslem/featuers/auth/presentation/screens/log_in_screen.dart';
import 'package:zad_almuslem/featuers/auth/presentation/screens/register_screen.dart';
import 'package:zad_almuslem/featuers/home/presentation/screens/home_screen.dart';
import 'package:zad_almuslem/featuers/home/presentation/screens/main_home.dart';
import 'package:zad_almuslem/featuers/on_boarding/on_boarding_screen.dart';
import 'package:zad_almuslem/featuers/splash_screen/splash_screen.dart';

final router = Provider(
  (ref) => GoRouter(
    initialLocation: "/splash",
    observers: [BotToastNavigatorObserver()],
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: "/onBoarding",
        name: "onBoarding",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: Duration(seconds: 1),
              reverseTransitionDuration: Duration(seconds: 1),
              child: OnBoardingScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: "/regester",
        name: "regester",
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: "/logIn",
        name: "logIn",
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: "/MainHome",
        name: "MainHome",
        builder: (context, state) => MainHome(),
      ),
      GoRoute(
        path: "/HomeScreen",
        name: "HomeScreen",
        builder: (context, state) => HomeScreen(),
      ),
    ],
    // redirect: (context, state) {
    //   // قراءة حالة المصادقة الحالية
    //   final authState = ref.read(authStateProvider);

    //   // إذا كانت حالة المصادقة لا تزال قيد التحميل، لا نقوم بأي تحويل
    //   if (authState.isLoading) {
    //     return null;
    //   }

    //   // إذا كان المستخدم مسجل دخوله
    //   final user = authState.valueOrNull;
    //   if (user != null) {
    //     // إذا كان المستخدم مسجل دخوله ولا يحاول الوصول إلى /logIn أو /regester
    //     if (state.fullPath == '/logIn' || state.fullPath == '/regester') {
    //       return '/HomeScreen'; // انتقل إلى الصفحة الرئيسية
    //     }
    //     return null; // لا حاجة للتحويل
    //   }

    //   // إذا لم يكن المستخدم مسجل دخوله
    //   if (state.fullPath != '/logIn' && state.fullPath != '/regester') {
    //     return '/logIn'; // انتقل إلى صفحة تسجيل الدخول
    //   }

    //   // لا حاجة للتحويل
    //   return null;
    // },
  ),
);
