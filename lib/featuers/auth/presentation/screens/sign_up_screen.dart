import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/auth/application/auth_notifier_provider.dart';
import 'package:zad_almuslem/featuers/auth/application/sign_up_form_provider.dart';
import 'package:zad_almuslem/featuers/auth/domain/app_user.dart';
import 'package:zad_almuslem/featuers/auth/presentation/widgets/button_widget.dart';
import 'package:zad_almuslem/featuers/auth/presentation/widgets/reactive_text_input_widget.dart';
import 'package:zad_almuslem/featuers/auth/presentation/widgets/reactive_password_input_widget.dart';
import 'package:zad_almuslem/featuers/auth/presentation/widgets/t_c_widget.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var form = ref.watch(signUpFormProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true, 
      body: Stack(
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
              child: SvgPicture.asset(
                'assets/images/splash_screen.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ReactiveForm(
                  formGroup: form,
                  child: Column(
                    children: [
                      const Gap(40),
                      SvgPicture.asset(
                        'assets/logo/logo.svg',
                        height: 140,
                        width: 140,
                      ),
                      Text(
                        'Sign Up'.i18n,
                        style: TextStyle(color: AppColors.white, fontSize: 24),
                      ),
                      const Gap(20),
                      ReactiveTextInputWidget(
                        hint: 'Username'.i18n,
                        controllerName: 'userName',
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(10),
                      ReactiveTextInputWidget(
                        hint: 'Email'.i18n,
                        controllerName: 'email',
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(10),
                      ReactivePasswordInputWidget(
                        hint: "Password".i18n,
                        controllerName: "password",
                        textInputAction: TextInputAction.next,
                      
                      ),

                      const Gap(10),

                      ReactivePasswordInputWidget(
                        hint: 'Confirm Password'.i18n,
                        controllerName: 'confirmPassword',
                        textInputAction: TextInputAction.done,
                       
                      ),

                      const Gap(40),
                      ReactiveFormConsumer(
                        builder: (context, formGroup, child) {
                          return ButtonWidget(
                            text: "Sign Up".i18n,
                            onTap: formGroup.invalid
                                ? null
                                : () {
                                    var userName =
                                        form.control("userName").value;
                                    var email = form.control("email").value;
                                    var password =
                                        form.control("password").value;
                                    var confirmPassword =
                                        form.control("confirmPassword").value;

                                    if (password != confirmPassword) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Passwords do not match')),
                                      );
                                    } else {
                                      ref
                                          .read(authNotifierProvider.notifier)
                                          .createUserWithEmailAndPassword(
                                            email,
                                            password,
                                            AppUser(
                                                name: userName, email: email),
                                          );
                                    }
                                  },
                          );
                        },
                      ),
                      const Gap(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do you have an account?  ".i18n,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          InkWell(
                            onTap: () {
                              context.push('/login');
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
                      ),
                      const Gap(50),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 5, 
                        runSpacing: 10, 
                        children: [
                          Text(
                            'By signing up to Zad Almuslem, you are accepting our terms and conditions.'
                                .i18n,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  icon: Icon(Icons.info),
                                  title: Text("Terms & Conditions".i18n),
                                  content:
                                      SingleChildScrollView(child: TCWidget()),
                                  actions: [
                                    TextButton(
                                      onPressed: () => context.pop(),
                                      child: Text("Close".i18n),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              "Terms & Conditions".i18n,
                              style: TextStyle(
                                color: AppColors.mountainMeadow,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                decoration: TextDecoration
                                    .underline, 
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Gap(40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

