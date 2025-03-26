import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:gap/gap.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/auth/presentation/controllers/auth_controller.dart';
import 'package:zad_almuslem/shear/widget/text_form_filde_auth.dart';

class RegisterScreen extends ConsumerWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // قراءة البروفايدرات الخاصة بحالة التحميل والأخطاء
    final isLoading = ref.watch(isLoadingProvider);
    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                ),
              ),
              child: SvgPicture.asset('assets/images/splash_screen.svg'),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    15, 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(60),
                  SvgPicture.asset(
                    'assets/logo/logo.svg',
                    width: 100,
                    height: 100,
                  ),
                  Gap(20),
                  Text(
                    "Create an account".i18n,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Gap(30),
                  if (emailError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        emailError,
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ),
                  TextFormFildeAuth(
                    hintText: "Full Name".i18n,
                    icon: Icons.person,
                    controller: _nameController,
                  ),
                  Gap(20),
                  TextFormFildeAuth(
                    hintText: "Email".i18n,
                    icon: Icons.email,
                    controller: _emailController,
                  ),
                  Gap(20),
                  TextFormFildeAuth(
                    hintText: "Password".i18n,
                    icon: Icons.lock,
                    isPassword: true,
                    controller: _passwordController,
                  ),
                  if (passwordError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        passwordError,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  Gap(20),
                  TextFormFildeAuth(
                    hintText: "Confirm Password".i18n,
                    icon: Icons.lock,
                    isPassword: true,
                    controller: _confirmPasswordController,
                  ),
                  Gap(40),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            ref
                                .read(authControllerProvider.notifier)
                                .createAccount(
                                  name: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  confirmPassword:
                                      _confirmPasswordController.text.trim(),
                                );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF2575fc),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
                            "Create account".i18n,
                            style: TextStyle(fontSize: 18),
                          ),
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColors.greyHintForm,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(authControllerProvider.notifier)
                                .signInWithGoogle();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.greyHintForm),
                              color: AppColors.white,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/Google.svg',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColors.greyHintForm,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do you have an account?  ".i18n,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                          context.push('/logIn');
                        },
                        child: Text(
                          "Sign In".i18n,
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
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:zad_almuslem/core/app_colors/app_colors.dart';
// import 'package:gap/gap.dart';
// import 'package:zad_almuslem/core/translations/translation.dart';
// import 'package:zad_almuslem/featuers/auth/data/repositories_imp/services_auth_ripo.dart';
// import 'package:zad_almuslem/shear/widget/text_form_filde_auth.dart';

// class RegisterScreen extends ConsumerWidget {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(children: [
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
//             child: SvgPicture.asset('assets/images/splash_screen.svg'),
//           ),
//         ),
//         Positioned(
//           top: 0,
//           bottom: 0,
//           right: 0,
//           left: 0,
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Gap(60),
//                 SvgPicture.asset(
//                   'assets/logo/logo.svg',
//                   width: 100,
//                   height: 100,
//                 ),
//                 Gap(20),
//                 Text(
//                   "Create an account".i18n,
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Gap(30),
//                 TextFormFildeAuth(
//                   hintText: "Full Name".i18n,
//                   icon: Icons.person,
//                   controller: _nameController,
//                 ),
//                 Gap(20),
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
//                 Gap(20),
//                 TextFormFildeAuth(
//                   hintText: "Confirm Password".i18n,
//                   icon: Icons.lock,
//                   isPassword: true,
//                   controller: _confirmPasswordController,
//                 ),
//                 Gap(40),
//                 ElevatedButton(
//                   onPressed: () async {
//                     // الحصول على مثيل من ServicesAuthRepo
//                     final authRepo = ref.read(servicesAuthRepoProvider);

//                     // قراءة البيانات من الحقول
//                     final email = _emailController.text.trim();
//                     final password = _passwordController.text.trim();
//                     final confirmPassword =
//                         _confirmPasswordController.text.trim();

//                     // التحقق من صحة البيانات
//                     if (email.isEmpty ||
//                         password.isEmpty ||
//                         confirmPassword.isEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please fill all fields".i18n)),
//                       );
//                       return;
//                     }

//                     if (password != confirmPassword) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Passwords do not match".i18n)),
//                       );
//                       return;
//                     }

//                     try {
//                       // إنشاء الحساب باستخدام البريد الإلكتروني وكلمة المرور
//                       final user = await authRepo.createAccountByEmail(
//                         email: email,
//                         password: password,
//                       );

//                       if (user != null) {
//                         // عرض رسالة نجاح
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               content:
//                                   Text("Account created successfully".i18n)),
//                         );

//                         // التنقل إلى الصفحة الرئيسية أو تسجيل الدخول
//                         context.push('/HomeScreen');
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               content: Text("Failed to create account".i18n)),
//                         );
//                       }
//                     } catch (e) {
//                       // عرض رسالة خطأ في حالة حدوث مشكلة
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Error: $e".i18n)),
//                       );
//                     }
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
//                     "Create account".i18n,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//                 Gap(20),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: Divider(
//                             thickness: 1, color: AppColors.greyHintForm)),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(
//                         onTap: () async {
//                           // الحصول على مثيل من ServicesAuthRepo
//                           final authRepo = ref.read(servicesAuthRepoProvider);

//                           try {
//                             // تسجيل الدخول باستخدام Google
//                             final user = await authRepo.createAccountByGoogle();

//                             if (user != null) {
//                               // عرض رسالة نجاح
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                     content:
//                                         Text("Logged in with Google".i18n)),
//                               );

//                               // التنقل إلى الصفحة الرئيسية
//                               context.push('/HomeScreen');
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                     content: Text(
//                                         "Failed to log in with Google".i18n)),
//                               );
//                             }
//                           } catch (e) {
//                             // عرض رسالة خطأ في حالة حدوث مشكلة
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text("Error: $e".i18n)),
//                             );
//                           }
//                         },
//                         child: Container(
//                           width: 40,
//                           height: 40,
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               border: Border.all(color: AppColors.greyHintForm),
//                               color: AppColors.white),
//                           child: SvgPicture.asset(
//                             'assets/icons/Google.svg',
//                             width: 30,
//                             height: 30,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                         child: Divider(
//                             thickness: 1, color: AppColors.greyHintForm)),
//                   ],
//                 ),
//                 Gap(20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Do you have an account?  ".i18n,
//                       style: TextStyle(color: Colors.white, fontSize: 14),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         context.push('/logIn');
//                       },
//                       child: Text(
//                         "Sign In".i18n,
//                         style: TextStyle(
//                             color: AppColors.yallowLight,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16),
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
