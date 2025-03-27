import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/auth/domain/app_user.dart';
import '../data/firestore_app_user_repository.dart';

part 'app_user_service.g.dart';

@riverpod
AppUserService appUserService(Ref ref) => AppUserService(
      firestoreAppUserRepository: ref.read(firestoreAppUserRepositoryProvider),
    );

class AppUserService {
  final FirestoreAppUserRepository firestoreAppUserRepository;
  AppUserService({required this.firestoreAppUserRepository});

  Future<AppUser> createAccount(AppUser user) {
    return firestoreAppUserRepository.createUser(appUser: user);
  }

  Future<AppUser?> getAccountByEmail(String email) {
    return firestoreAppUserRepository.getUserByEmail(email: email);
  }

  Future<void> updateUser({required FormGroup form}) async {
    BotToast.showLoading();
    var id = form.control("id").value;
    var userName = form.control("userName").value;
    var oldUser = await firestoreAppUserRepository.readUser(id: id); // Data
    if (oldUser == null) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Something went wrong".i18n);
    } else {
      oldUser = oldUser.copyWith(name: userName, );
      await firestoreAppUserRepository.updateUser(appUser: oldUser); // Data
      BotToast.closeAllLoading();
      BotToast.showText(text: "Done".i18n);
    }
  }
}
