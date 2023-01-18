import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/edit_profile_state.dart';
import 'package:gastos_app/src/repositories/user_repository.dart';

class EditProfileController {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  EditProfileController({
    required this.userRepository,
    required this.authRepository,
  });

  final profileUserStateNotifier = ValueNotifier<EditProfileState>(
    EditProfileStateEmpty(),
  );

  EditProfileState get state => profileUserStateNotifier.value;
  set state(EditProfileState state) => profileUserStateNotifier.value = state;

  Future<void> updateUserData({
    String? name,
    String? nickname,
    String? phone,
    String? password,
  }) async {
    try {
      state = EditProfileStateLoading();

      await Future.delayed(const Duration(seconds: 2));

      final user = authRepository.currentUser!;

      if (name != null) {
        await authRepository.updateName(name: name);

        await userRepository.updateUserName(userId: user.uid, name: name);
      }
      if (nickname != null) {
        await userRepository.updateNickname(
          userId: user.uid,
          nickname: nickname,
        );
      }
      if (phone != null) {
        await userRepository.updatePhone(userId: user.uid, phone: phone);
      }
      if (password != null) {
        await authRepository.updatePassword(password: password);
      }

      state = EditProfileStateSuccess();
    } catch (e) {
      state = EditProfileStateError(e);
    }
  }
}
