// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'firebase_fire_aut_source.g.dart';

// @riverpod
// FirebaseAuthSource firebaseAuthSource(Ref ref) {
//   return FirebaseAuthSource();
// }

// class FirebaseAuthSource {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   // final GoogleSignIn _googleSignIn = GoogleSignIn(); // تثبيت instance واحد فقط

//   // إنشاء حساب باستخدام البريد الإلكتروني وكلمة المرور
//   Future<User?> createAccountWithEmail({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       return userCredential.user;
//     } catch (e) {
//       print("Error creating account: $e");
//       return null;
//     }
//   }

//   // تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
//   Future<User?> signInWithEmail({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: password);
//       return userCredential.user;
//     } catch (e) {
//       print("Error signing in: $e");
//       return null;
//     }
//   }

//   // تسجيل الدخول باستخدام Google
//   Future<User?> signInWithGoogle() async {
//     try {
//       // Step 1: Trigger the Google Sign-In flow
//       // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       // if (googleUser == null) return null;

//       // // Step 2: Obtain the authentication details from the request
//       // final GoogleSignInAuthentication googleAuth =
//       //     await googleUser.authentication;

//       // Step 3: Create a new credential
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         // accessToken: googleAuth.accessToken,
//         // idToken: googleAuth.idToken,
//       );

//       // Step 4: Sign in to Firebase with the Google credential
//       final UserCredential userCredential =
//           await _firebaseAuth.signInWithCredential(credential);

//       return userCredential.user;
//     } catch (e) {
//       print("Error during Google sign-in: $e");
//       return null;
//     }
//   }

//   // تسجيل الخروج
//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//     // await _googleSignIn.signOut(); // التأكد من إغلاق جلسة Google أيضًا
//   }

//   // جلب حالة المستخدم الحالي
//   User? getCurrentUser() {
//     return _firebaseAuth.currentUser;
//   }

//   // التحقق مما إذا كان المستخدم مسجلاً للدخول أم لا
//   bool isUserLoggedIn() {
//     return _firebaseAuth.currentUser != null;
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_fire_aut_source.g.dart';

@riverpod
FirebaseAuthSource firebaseAuthSource(Ref ref) {
  return FirebaseAuthSource();
}

class FirebaseAuthSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(); // تثبيت instance واحد فقط

  // إنشاء حساب باستخدام البريد الإلكتروني وكلمة المرور
  Future<User?> createAccountWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("Error creating account: $e");
      return null;
    }
  }

  // تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  // تسجيل الدخول باستخدام Google
  Future<User?> signInWithGoogle() async {
    try {
      // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // if (googleUser == null) {
      //   // في حال رفض المستخدم لتسجيل الدخول
      //   return null;
      // }

      // final GoogleSignInAuthentication googleAuth =
      //     await googleUser.authentication;
      // final AuthCredential credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth.accessToken,
      //   idToken: googleAuth.idToken,
      // );

      // final UserCredential userCredential =
      //     await _firebaseAuth.signInWithCredential(credential);
      return null;
      // userCredential.user;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  // تسجيل الخروج
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    // await _googleSignIn.signOut(); // التأكد من إغلاق جلسة Google أيضًا
  }

  // جلب حالة المستخدم الحالي
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // التحقق مما إذا كان المستخدم مسجلاً للدخول أم لا
  bool isUserLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }
}
