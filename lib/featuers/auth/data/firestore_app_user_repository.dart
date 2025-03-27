import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zad_almuslem/featuers/auth/domain/app_user.dart';
import 'app_user_repository.dart';

part 'firestore_app_user_repository.g.dart';

@riverpod
FirestoreAppUserRepository firestoreAppUserRepository(Ref ref) {
  return FirestoreAppUserRepository();
}

class FirestoreAppUserRepository implements AppUserRepository {
  FirestoreAppUserRepository() {
    _firebase = FirebaseFirestore.instance;
  }

  late FirebaseFirestore _firebase;
  final String collectionName = "appUsers";

  @override
  Future<AppUser> createUser({required AppUser appUser}) async {
    try {
      String docId =
          appUser.id ?? _firebase.collection(collectionName).doc().id;

      var createdUser = appUser.copyWith(id: docId);
      await _firebase.collection(collectionName).doc(docId).set(
            createdUser.toJson(),
          );
      return createdUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppUser?> getUserByEmail({required String email}) async {
    try {
      var users = await _firebase
          .collection(collectionName)
          .where('email', isEqualTo: email)
          .get();

      if (users.docs.isNotEmpty) {
        return AppUser.fromJson(users.docs.first.data());
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser({required String id}) async {
    try {
      await _firebase.collection(collectionName).doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppUser?> readUser({required String id}) async {
    try {
      var users = await _firebase.collection(collectionName).doc(id).get();

      if (users.data() != null) {
        return AppUser.fromJson(users.data()!);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser({required AppUser appUser}) async {
    try {
      await _firebase.collection(collectionName).doc(appUser.id).update(
            appUser.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<AppUser?> streamUserById({required String id}) {
    return _firebase
        .collection(collectionName)
        .doc(id)
        .snapshots()
        .map((doc) => AppUser.fromJson(doc.data() as Map<String, dynamic>));
  }
}
