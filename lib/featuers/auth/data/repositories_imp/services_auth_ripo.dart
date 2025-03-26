import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zad_almuslem/featuers/auth/data/datasources/firebase_fire_aut_source.dart';
import 'package:zad_almuslem/featuers/auth/data/datasources/firebase_firestor_source.dart';
import 'package:zad_almuslem/featuers/auth/domin/entities/app_user.dart';
import 'package:zad_almuslem/featuers/auth/domin/reposetores/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'services_auth_ripo.g.dart';

@riverpod
ServicesAuthRepo servicesAuthRepo(Ref ref) {
  // قراءة البروفايدرات الخاصة بـ FirebaseAuthSource وFirebaseFirestorSource
  final firebaseAuthSource = ref.watch(firebaseAuthSourceProvider);
  final firebaseFirestorSource = ref.watch(firebaseFireStorSourceProvider);

  // إنشاء مثيل من ServicesAuthRepo باستخدام الاعتمادات
  return ServicesAuthRepo(
    firebaseAuthSource: firebaseAuthSource,
    firebaseFirestorSource: firebaseFirestorSource,
  );
}

class ServicesAuthRepo implements StoureUserRepository {
  final FirebaseAuthSource firebaseAuthSource;
  final FirebaseFirestorSource firebaseFirestorSource;

  // Constructor: نقوم بتمرير البروفايدرات من خارج الكلاس
  ServicesAuthRepo({
    required this.firebaseAuthSource,
    required this.firebaseFirestorSource,
  });

  @override
  Future<AppUser?> createAccountByEmail(
      {required String email, required String password}) async {
    try {
      // قم بإنشاء الحساب باستخدام FirebaseAuth
      User? user = await firebaseAuthSource.createAccountWithEmail(
        email: email,
        password: password,
      );

      if (user != null) {
        // بعد انشاء الحساب، نقوم بتخزين بيانات المستخدم في Firestore
        AppUser appUser = AppUser(
          id: user.uid,
          email: email,
          name: '', // قم بإضافة البيانات التي تريدها
          // باقي البيانات الأخرى للمستخدم
        );

        await firebaseFirestorSource.addUser(appUser: appUser);

        return appUser; // نعيد البيانات بعد انشاء الحساب وتخزينها
      }
      return null;
    } catch (e) {
      print("Error creating account: $e");
      return null;
    }
  }

  @override
  @override
  Future<AppUser?> createAccountByGoogle() async {
    try {
      // تسجيل الدخول باستخدام Google
      User? user = await firebaseAuthSource.signInWithGoogle();

      if (user == null) {
        print("Google sign-in failed: User is null.");
        return null;
      }

      // بعد تسجيل الدخول، نقوم بتخزين بيانات المستخدم في Firestore
      AppUser appUser = AppUser(
        id: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
      );

      await firebaseFirestorSource.addUser(appUser: appUser);

      return appUser;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  @override
  Future<void> deleteUser({required String id}) async {
    try {
      // حذف الحساب من Firebase Authentication
      await firebaseAuthSource.signOut();

      // حذف المستخدم من Firestore
      await firebaseFirestorSource.deleteUser(id: id);
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  @override
  Future<AppUser?> getUser({required String id}) async {
    try {
      return await firebaseFirestorSource.getUser(id: id);
    } catch (e) {
      print("Error getting user: $e");
      return null;
    }
  }

  @override
  Future<AppUser?> getUserByEmail({required String email}) async {
    try {
      return await firebaseFirestorSource.getUserByEmail(email: email);
    } catch (e) {
      print("Error getting user by email: $e");
      return null;
    }
  }

  @override
  Future<void> updateUser({required AppUser appUser}) async {
    try {
      await firebaseFirestorSource.updateUser(appUser: appUser);
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuthSource
          .signOut(); // قم باستدعاء الدالة من FirebaseAuthSource
    } catch (e) {
      print("Error signing out: $e");
    }
  }
@override
Future<AppUser?> signInWithEmail({
  required String email,
  required String password,
}) async {
  try {
    // تسجيل الدخول باستخدام FirebaseAuthSource
    final User? user = await firebaseAuthSource.signInWithEmail(
      email: email,
      password: password,
    );

    if (user != null) {
      // الحصول على بيانات المستخدم من Firestore
      final AppUser? appUser = await firebaseFirestorSource.getUser(id: user.uid);
      return appUser;
    }
    return null;
  } catch (e) {
    print("Error signing in with email and password: $e");
    return null;
  }
}


}
