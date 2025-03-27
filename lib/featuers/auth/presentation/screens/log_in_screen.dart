import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/auth/application/auth_state_provider.dart';
import 'package:zad_almuslem/featuers/auth/presentation/controllers/auth_controller.dart';
import 'package:zad_almuslem/shear/widget/text_form_filde_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class LoginScreen extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // قراءة البروفايدرات الخاصة بحالة التحميل والأخطاء
    final isLoading = ref.watch(isLoadingProvider);
    final emailError = ref.watch(emailErrorProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(clipBehavior: Clip.none, children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary, // لون أساسي
                  AppColors.secondary, // لون ثانوي
                ],
              ),
            ),
            child: SvgPicture.asset(
              'assets/images/splash_screen.svg',
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(60),
                SvgPicture.asset(
                  'assets/logo/logo.svg',
                  width: 100,
                  height: 100,
                ),
                Gap(40),
                Text(
                  "Sign In".i18n,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Gap(60),
                TextFormFildeAuth(
                  hintText: "Email".i18n,
                  icon: Icons.email,
                  controller: _emailController,
                ),
                if (emailError != null && emailError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      emailError,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                Gap(20),
                TextFormFildeAuth(
                  hintText: "Password".i18n,
                  icon: Icons.lock,
                  isPassword: true,
                  controller: _passwordController,
                ),
                Gap(5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // هنا يمكنك إضافة منطق استعادة كلمة المرور
                    },
                    child: Text(
                      "Forgot Password?".i18n,
                      style: TextStyle(
                        color: AppColors.yallowLight,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Gap(50),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          ref.read(authControllerProvider.notifier).signInWithEmail(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF2575fc),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.blue,
                        )
                      : Text(
                          "Sign In".i18n,
                          style: TextStyle(fontSize: 18),
                        ),
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ".i18n,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        context.go('/register');
                      },
                      child: Text(
                        "Create an account".i18n,
                        style: TextStyle(
                          color: AppColors.yallowLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

// class LoginScreen extends ConsumerWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // قراءة البروفايدرات الخاصة بحالة التحميل والأخطاء
//     final isLoading = ref.watch(isLoadingProvider);
//     final emailError = ref.watch(emailErrorProvider);

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(clipBehavior: Clip.none, children: [
//         Positioned.fill(
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   AppColors.primary, // لون أساسي
//                   AppColors.secondary, // لون ثانوي
//                 ],
//               ),
//             ),
//             child: SvgPicture.asset(
//               'assets/images/splash_screen.svg',
//             ),
//           ),
//         ),
//         Positioned(
//           top: 0,
//           bottom: 0,
//           right: 0,
//           left: 0,
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Gap(60),
//                 SvgPicture.asset(
//                   'assets/logo/logo.svg',
//                   width: 100,
//                   height: 100,
//                 ),
//                 Gap(40),
//                 Text(
//                   "Sign In".i18n,
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Gap(60),
//                 TextFormFildeAuth(
//                   hintText: "Email".i18n,
//                   icon: Icons.email,
//                   controller: _emailController,
//                 ),
//                 if (emailError != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 4.0),
//                     child: Text(
//                       emailError,
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 Gap(20),
//                 TextFormFildeAuth(
//                   hintText: "Password".i18n,
//                   icon: Icons.lock,
//                   isPassword: true,
//                   controller: _passwordController,
//                 ),
//                 Gap(5),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                       // هنا يمكنك إضافة منطق استعادة كلمة المرور
//                     },
//                     child: Text(
//                       "Forgot Password?".i18n,
//                       style: TextStyle(
//                         color: AppColors.yallowLight,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Gap(50),
//                 ElevatedButton(
//                   onPressed: isLoading
//                       ? null
//                       : () {
//                           ref.read(authControllerProvider.notifier).signInWithEmail(
//                                 email: _emailController.text.trim(),
//                                 password: _passwordController.text.trim(),
//                               );
//                         },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Color(0xFF2575fc),
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: isLoading
//                       ? CircularProgressIndicator(
//                           color: Colors.blue,
//                         )
//                       : Text(
//                           "Sign In".i18n,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                 ),
//                 Gap(20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ".i18n,
//                       style: TextStyle(color: Colors.white, fontSize: 14),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         context.go('/register');
//                       },
//                       child: Text(
//                         "Create an account".i18n,
//                         style: TextStyle(
//                           color: AppColors.yallowLight,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }
// class LoginScreen extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(clipBehavior: Clip.none, children: [
//         Positioned.fill(
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   AppColors.primary, // لون أساسي
//                   AppColors.secondary, // لون ثانوي
//                 ],
//               ),
//             ),
//             child: SvgPicture.asset(
//               'assets/images/splash_screen.svg',
//             ),
//           ),
//         ),
//         Positioned(
//           top: 0,
//           bottom: 0,
//           right: 0,
//           left: 0,
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Gap(60),

//                 SvgPicture.asset(
//                   'assets/logo/logo.svg',
//                   width: 100,
//                   height: 100,
//                 ),
//                 Gap(40),
//                 Text(
//                   "Sign In".i18n,
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Gap(60),
//                 TextFormFildeAuth(
//                   hintText: "Email".i18n,
//                   icon: Icons.email,
//                   controller: _emailController,
//                 ),
//                 Gap(20),
//                 TextFormFildeAuth(
//                   hintText: "Password".i18n,
//                   icon: Icons.lock,
//                   isPassword: true,
//                   controller: _passwordController,
//                 ),
//                 // Gap(5),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                       // هنا يمكنك إضافة منطق استعادة كلمة المرور
//                     },
//                     child: Text(
//                       "Forgot Password?".i18n,
//                       style: TextStyle(
//                         color: AppColors.yallowLight,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Gap(50),
//                 ElevatedButton(
//                   onPressed: () {
//                     // هنا يمكنك إضافة المنطق الخاص بتسجيل الدخول
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Color(0xFF2575fc),
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text(
//                     "Sign In".i18n,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//                 Gap(20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ".i18n,
//                       style: TextStyle(color: Colors.white, fontSize: 14),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         context.go('/regester');
//                       },
//                       child: Text(
//                         "Create an account".i18n,
//                         style: TextStyle(
//                           color: AppColors.yallowLight,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }
