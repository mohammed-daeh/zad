
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/auth/application/app_user_service.dart';
import 'package:zad_almuslem/featuers/auth/application/auth_service.dart';
import 'package:zad_almuslem/featuers/auth/domain/app_user.dart';

class AuthNotifier extends StateNotifier<AppUser?> {
  final AuthService authService;
  final AppUserService appUserServices;

  AuthNotifier(this.authService, this.appUserServices) : super(null) {
    authService.authStateChanges.listen(
      (user) async {
        if ((user != null && !user.emailVerified) || user == null) {
          state = null;
        } else {
          state = await appUserServices.getAccountByEmail(user.email ?? "-");
        }
      },
    );
  }

  Future<UserCredential?> createUserWithEmailAndPassword(
    String email,
    String password,
    AppUser appUser,
  ) async {
    try {
      BotToast.showLoading();
      final credentials = await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await appUserServices.createAccount(
        appUser.copyWith(id: credentials?.user?.uid ?? ""),
      );
      BotToast.closeAllLoading();

      BotToast.showText(
          text: "Email verification sent, verify then login".i18n);
      return credentials;
    } catch (e) {
      BotToast.closeAllLoading();
      if (e
          .toString()
          .contains("The email address is already in use by another account")) {
        BotToast.showText(text: "Email already in use".i18n);
      } else {
        BotToast.showText(text: "Error".i18n);
      }
      return null;
    }
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      BotToast.showLoading();
      await authService.signInWIthEmailANdPass(
        email: email,
        password: password,
      );

      User? user = authService.currenUser;


      if (user != null && !user.emailVerified) {
        BotToast.showText(
            text: "Please verify your email before logging in.".i18n);
        BotToast.closeAllLoading();
        return;
      } else {
        state = await appUserServices.getAccountByEmail(email);
        final prefs = SharedPreferencesAsync();
        await prefs.setString("userId", state?.id ?? "");
        await authService.saveFCMToken(state?.id ?? "");
        BotToast.closeAllLoading();
      }
    } catch (e) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Email or password are wrong".i18n);
    }
  }

  Future<void> logOut() async {
    final prefs = SharedPreferencesAsync();
    await prefs.setString("userId", "");
    await authService.signOut();
  }

  Future<void> resetPassword(
    String email,
  ) async {
    try {
      BotToast.showLoading();
      await authService.resetPassword(
        email: email,
      );
      BotToast.showText(text: "Password changing email has been sent".i18n);
      BotToast.closeAllLoading();
    } catch (e) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Something went wrong".i18n);
    }
  }

  Future<void> resendEmailVerification() async {
    try {
      BotToast.showLoading();
      if (authService.currenUser == null) {
        BotToast.closeAllLoading();
        BotToast.showText(text: "Sign in first".i18n);
      } else {
        await authService.resendVerificationEmail();
        BotToast.showText(text: "Verification email has been sent".i18n);
        BotToast.closeAllLoading();
      }
    } catch (e) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Something went wrong".i18n);
    }
  }

  Future<void> refreshUser() async {
    try {
      if (authService.currenUser != null) {
        final email = authService.currenUser?.email ?? "";
        state = await appUserServices.getAccountByEmail(email);
      } else {}
    } catch (e) {
      BotToast.showText(text: "Failed to refresh user data".i18n);
    }
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AppUser?>(
  (ref) {
    final authService = ref.read(authServiceProvider);
    final appUserService = ref.read(appUserServiceProvider);
    return AuthNotifier(authService, appUserService);
  },
);
