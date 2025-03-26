import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zad_almuslem/core/routers/router.dart';
import 'package:zad_almuslem/featuers/auth/data/repositories_imp/services_auth_ripo.dart';
part 'auth_controller.g.dart';

// Provider لحالة التحميل
final isLoadingProvider = StateProvider<bool>((ref) => false);

// Provider لأخطاء البريد الإلكتروني وكلمة المرور
final emailErrorProvider = StateProvider<String?>((ref) => null);
final passwordErrorProvider = StateProvider<String?>((ref) => null);

@riverpod
class AuthController extends _$AuthController {
  late final ServicesAuthRepo _authRepo;

  @override
  FutureOr<void> build() {
    // قراءة البروفايدر الخاص بـ ServicesAuthRepo
    _authRepo = ref.watch(servicesAuthRepoProvider);
  }

  // دالة إنشاء حساب باستخدام البريد الإلكتروني وكلمة المرور
  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    // إعادة تعيين الأخطاء
    ref.read(emailErrorProvider.notifier).state = null;
    ref.read(passwordErrorProvider.notifier).state = null;

    // التحقق من صحة المدخلات
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ref.read(emailErrorProvider.notifier).state = "Please fill all fields";
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ref.read(emailErrorProvider.notifier).state =
          "Please enter a valid email";
      return;
    }

    if (password != confirmPassword) {
      ref.read(passwordErrorProvider.notifier).state = "Passwords do not match";
      return;
    }

    if (password.length < 6) {
      ref.read(passwordErrorProvider.notifier).state =
          "Password must be at least 6 characters";
      return;
    }

    // التحقق من وجود البريد الإلكتروني
    final existingUser = await _authRepo.getUserByEmail(email: email);
    if (existingUser != null) {
      ref.read(emailErrorProvider.notifier).state =
          "This email is already registered";
      return;
    }

    // عرض مؤشر التحميل
    ref.read(isLoadingProvider.notifier).state = true;

    try {
      // إنشاء الحساب باستخدام ServicesAuthRepo
      final user = await _authRepo.createAccountByEmail(
        email: email,
        password: password,
      );

      if (user != null) {
        BotToast.showText(text: "Successfully created account");
        // التنقل إلى الصفحة الرئيسية إذا تم إنشاء الحساب بنجاح
        ref.read(router).push('/logIn'); // التنقل باستخدام GoRouter
        print("Account created successfully!");
      } else {
        print("Failed to create account.");
      }
    } catch (e) {
      print("Error creating account: $e");
    } finally {
      // إخفاء مؤشر التحميل
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }

  // دالة تسجيل الدخول باستخدام Google
  Future<void> signInWithGoogle() async {
    // عرض مؤشر التحميل
    ref.read(isLoadingProvider.notifier).state = true;

    try {
      // تسجيل الدخول باستخدام Google عبر ServicesAuthRepo
      final user = await _authRepo.createAccountByGoogle();

      if (user != null) {
        // ref.read(router).push('/HomeScreen'); // التنقل باستخدام GoRouter
        BotToast.showText(text: "Successfully created account with Google");
        // التنقل إلى الصفحة الرئيسية إذا تم إنشاء الحساب بنجاح
        ref.read(router).push('/HomeScreen'); // التنقل باستخدام GoRout
        // التنقل إلى الصفحة الرئيسية إذا تم تسجيل الدخول بنجاح
        print("Logged in with Google successfully!");
        ref.read(router).push('/HomeScreen'); // التنقل باستخدام GoRouter

        // يمكنك استخدام Navigator أو أي نظام توجيه آخر هنا
      } else {
        print("Failed to log in with Google.");
      }
    } catch (e) {
      print("Error signing in with Google: $e");
    } finally {
      // إخفاء مؤشر التحميل
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }// دالة تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
Future<void> signInWithEmail({
  required String email,
  required String password,
}) async {
  // إعادة تعيين الأخطاء
  ref.read(emailErrorProvider.notifier).state = null;
  ref.read(passwordErrorProvider.notifier).state = null;

  // التحقق من صحة المدخلات
  if (email.isEmpty || password.isEmpty) {
    ref.read(emailErrorProvider.notifier).state = "Please fill all fields";
    return;
  }

  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    ref.read(emailErrorProvider.notifier).state = "Please enter a valid email";
    return;
  }

  if (password.length < 6) {
    ref.read(passwordErrorProvider.notifier).state =
        "Password must be at least 6 characters";
    return;
  }

  // عرض مؤشر التحميل
  ref.read(isLoadingProvider.notifier).state = true;

  try {
    // تسجيل الدخول باستخدام ServicesAuthRepo
    final user = await _authRepo.signInWithEmail(
      email: email,
      password: password,
    );

    if (user != null) {
      BotToast.showText(text: "Successfully logged in");
      // التنقل إلى الصفحة الرئيسية إذا تم تسجيل الدخول بنجاح
      ref.read(router).push('/HomeScreen'); // التنقل باستخدام GoRouter
      print("Logged in successfully!");
    } else {
      print("Failed to log in.");
    }
  } catch (e) {
    print("Error signing in: $e");
    ref.read(emailErrorProvider.notifier).state = "Invalid email or password";
  } finally {
    // إخفاء مؤشر التحميل
    ref.read(isLoadingProvider.notifier).state = false;
  }
}
}
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});