// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:zad_almuslem/core/app_colors/app_colors.dart';
// import 'package:zad_almuslem/core/translations/translation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:zad_almuslem/featuers/auth/presentation/controllers/auth_controller.dart';

// class SplashScreen extends ConsumerStatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   ConsumerState<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends ConsumerState<SplashScreen> {
//   double _opacity = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     // تأخير ظهور الشاشة لمدة نصف ثانية
//     Future.delayed(const Duration(milliseconds: 500), () {
//       setState(() {
//         _opacity = 1.0;
//       });
//     });

//     // التحقق من حالة تسجيل الدخول بعد مرور 3 ثوانٍ (بدلاً من 7 ثوانٍ)
//     Future.delayed(const Duration(seconds: 3), () async {
//       final authState = ref.read(authStateProvider);

//       if (authState.valueOrNull != null) {
//         // إذا كان المستخدم مسجل دخوله، انتقل إلى الصفحة الرئيسية
//         context.pushReplacement('/HomeScreen');
//       } else {
//         // إذا لم يكن مسجل دخوله، انتقل إلى صفحة تسجيل الدخول
//         context.pushReplacement('/logIn');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedOpacity(
//           duration: const Duration(seconds: 2),
//           opacity: _opacity,
//           child: Stack(children: [
//             Positioned(
//               right: 0,
//               left: 0,
//               top: 0,
//               bottom: 0,
//               child: Container(
//                 decoration: const BoxDecoration(color: Color(0xff286287)),
//                 child: SvgPicture.asset('assets/images/splash_screen.svg'),
//               ),
//             ),
//             Positioned(
//               top: 0,
//               bottom: 0,
//               right: 0,
//               left: 0,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AnimatedContainer(
//                     duration: const Duration(seconds: 2),
//                     curve: Curves.easeInOut,
//                     height: _opacity == 1.0 ? 200 : 100,
//                     child: SvgPicture.asset(
//                       'assets/logo/logo.svg',
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 27.0),
// child: Text(
//   'Your daily guide to simplify worship and strengthen your connection to Islam wherever you are.'
//       .i18n,
//   textAlign: TextAlign.center,
//   style: TextStyle(color: AppColors.white, fontSize: 15),
// ),
// ),
//                 ],
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      context.push('/MainHome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.prussianBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/logo/logo.svg',
              height: 200,
            ),
            Text(
              'Your daily guide to simplify worship and strengthen your connection to Islam wherever you are.'
                  .i18n,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
