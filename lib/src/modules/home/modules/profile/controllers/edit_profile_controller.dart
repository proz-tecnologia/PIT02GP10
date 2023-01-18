import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/edit_profile_state.dart';

class EditProfileController {
  final AuthRepository repository;

  EditProfileController({
    required this.repository,
  });

  final profileUserStateNotifier = ValueNotifier<EditProfileState>(
    EditProfileStateEmpty(),
  );

  EditProfileState get state => profileUserStateNotifier.value;
  set state(EditProfileState state) => profileUserStateNotifier.value = state;

  Future<void> updateUserData({
    String? name,
    String? customName,
    String? phone,
    String? password,
  }) async {
    try {
      state = EditProfileStateLoading();

      await Future.delayed(const Duration(seconds: 2));

      //Firebase Authentication
      //name, phone, password

      //Firestore
      // name, nickname, phone,

      // await repository.updateUser(
      //   customName: customName,
      //   password: password,
      //   name: name,
      //   phone: phone,
      // );
      state = EditProfileStateSuccess();
    } catch (e) {
      state = EditProfileStateError(e);
    }
  }
}
