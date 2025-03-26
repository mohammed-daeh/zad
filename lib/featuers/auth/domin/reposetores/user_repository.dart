import 'package:zad_almuslem/featuers/auth/domin/entities/app_user.dart';

abstract class StoureUserRepository {
  // إنشاء حساب باستخدام جوجل
  Future<AppUser?> createAccountByGoogle();

  // إنشاء حساب باستخدام البريد الإلكتروني وكلمة المرور
  Future<AppUser?> createAccountByEmail(
      {required String email, required String password});

  // جلب بيانات المستخدم باستخدام الـ ID
  Future<AppUser?> getUser({required String id});

  // تحديث بيانات المستخدم
  Future<void> updateUser({required AppUser appUser});

  // حذف المستخدم
  Future<void> deleteUser({required String id});

  // جلب بيانات المستخدم باستخدام البريد الإلكتروني
  Future<AppUser?> getUserByEmail({required String email});

  // تسجيل الخروج
  Future<void> signOut();
  Future<AppUser?> signInWithEmail({
    required String email,
    required String password,
  });
}
