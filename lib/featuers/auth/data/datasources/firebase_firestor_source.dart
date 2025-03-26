
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zad_almuslem/featuers/auth/domin/entities/app_user.dart';
part 'firebase_firestor_source.g.dart';

@riverpod
FirebaseFirestorSource firebaseFireStorSource(Ref ref) {
  return FirebaseFirestorSource();
}

class FirebaseFirestorSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = "appUsers";

  Future<AppUser> addUser({required AppUser appUser}) async {
    try {
      String docId =
          appUser.id ?? _firestore.collection(collectionName).doc().id;
      var createdUser = appUser.copyWith(id: docId);

      final userDoc =
          await _firestore.collection(collectionName).doc(docId).get();
      if (!userDoc.exists) {
        await _firestore
            .collection(collectionName)
            .doc(docId)
            .set(createdUser.toJson());
      }

      return createdUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<AppUser?> getUser(
      {required String id, bool shouldThrowError = false}) async {
    try {
      final doc = await _firestore.collection(collectionName).doc(id).get();
      if (doc.exists) {
        return AppUser.fromJson(doc.data()!);
      }
      if (shouldThrowError) throw Exception("User not found with id: $id");
      return null;
    } catch (e) {
      print("Error getting user: $e");
      return null;
    }
  }

  Future<void> updateUser({required AppUser appUser}) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(appUser.id)
          .update(appUser.toJson());
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  Future<void> deleteUser({required String id}) async {
    try {
      final doc = await _firestore.collection(collectionName).doc(id).get();
      if (doc.exists) {
        await _firestore.collection(collectionName).doc(id).delete();
      } else {
        print("User not found with id: $id");
      }
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  Future<AppUser?> getUserByEmail(
      {required String email, bool shouldThrowError = false}) async {
    try {
      final querySnapshot = await _firestore
          .collection(collectionName)
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return AppUser.fromJson(querySnapshot.docs.first.data());
      }
      if (shouldThrowError)
        throw Exception("User not found with email: $email");
      return null;
    } catch (e) {
      print("Error getting user by email: $e");
      return null;
    }
  }
}
