import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/auth/application/auth_notifier_provider.dart';
import 'package:zad_almuslem/featuers/auth/application/log_in_form_provider.dart';
import 'package:zad_almuslem/featuers/auth/presentation/widgets/button_widget.dart';
import 'package:zad_almuslem/featuers/auth/presentation/widgets/reactive_text_input_widget.dart';
import 'package:zad_almuslem/featuers/auth/presentation/widgets/text_button_widget.dart';
import 'package:zad_almuslem/featuers/auth/presentation/widgets/reactive_password_input_widget.dart';

class LogInScreen extends ConsumerWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.read(logInFormProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
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
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(20),
                    SvgPicture.asset(
                      'assets/logo/logo.svg',
                      width: 120,
                      height: 120,
                    ),
                    const Gap(16),
                    Text(
                      "Sign In".i18n,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                    ),
                    const Gap(40),
                    ReactiveForm(
                      formGroup: form,
                      child: Column(
                        children: [
                          ReactiveTextInputWidget(
                            hint: 'Email'.i18n,
                            controllerName: 'email',
                            textInputAction: TextInputAction.next,
                          ),
                          const Gap(24),
                          ReactivePasswordInputWidget(
                            hint: "Password".i18n,
                            controllerName: "password",
                            showEye: true,
                            textInputAction: TextInputAction.done,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: ReactiveValueListenableBuilder(
                              formControlName: "email",
                              builder: (context, control, child) {
                                return TextButtonWidget(
                                  foregroundColor: AppColors.white,
                                  size: 12,
                                  text: "Forgot Password?",
                                  onTap: control.invalid
                                      ? null
                                      : () {
                                          ref
                                              .read(
                                                  authNotifierProvider.notifier)
                                              .resetPassword(
                                                  control.value as String);
                                        },
                                );
                              },
                            ),
                          ),
                          const Gap(56),
                          ReactiveFormConsumer(
                            builder: (context, formGroup, child) {
                              return Column(
                                children: [
                                  ButtonWidget(
                                    text: "Sign in".i18n,
                                    onTap: formGroup.invalid
                                        ? null
                                        : () {
                                            final email = formGroup
                                                .control("email")
                                                .value;
                                            final password = formGroup
                                                .control("password")
                                                .value;
                                            ref
                                                .read(authNotifierProvider
                                                    .notifier)
                                                .signInWithEmailAndPassword(
                                                    email, password);
                                          },
                                  ),
                                  const Gap(16),
                                  ButtonWidget(
                                    text: "Resend Email Verification".i18n,
                                    onTap: formGroup.invalid
                                        ? null
                                        : () {
                                            ref
                                                .read(authNotifierProvider
                                                    .notifier)
                                                .resendEmailVerification();
                                          },
                                  ),
                                ],
                              );
                            },
                          ),
                          const Gap(60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?'.i18n,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              TextButtonWidget(
                                text: "Register".i18n,
                                onTap: () => context.push("/signup"),
                                foregroundColor: AppColors.yallowLight,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
