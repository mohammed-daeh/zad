import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(Ref ref) => AuthService();

class AuthService {
  AuthService() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  late FirebaseAuth _firebaseAuth;
  User? get currenUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.sendEmailVerification();
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signInWIthEmailANdPass({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "OK";
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> resendVerificationEmail() async {
    if (currenUser != null && !currenUser!.emailVerified) {
      await currenUser!.sendEmailVerification();
    }
  }

  Future<void> saveFCMToken(String userId) async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await FirebaseFirestore.instance
          .collection('appUsers')
          .doc(userId)
          .update({
        'fcmToken': token,
      });
    }
  }
}
