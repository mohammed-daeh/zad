import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

enum UserType { reporter, visitor }

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    String? id,
    required String name,
    required String email,
    @Default("") String? fcmToken,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
