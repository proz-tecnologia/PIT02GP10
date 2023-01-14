import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/home/pages/profile/profile_user_states.dart';

class ProfileUserController {
  final AuthRepository repository;

  ProfileUserController({
    required this.repository,
  });


  final profileUserStateNotifier = ValueNotifier<ProfileUserStates>(
    ProfileUserStateEmpty(),
  );

  ProfileUserStates get state => profileUserStateNotifier.value;
  set state(ProfileUserStates state) => profileUserStateNotifier.value = state;

  Future<void> profileUser({
    required String name,
    required String customName,
    String? phone,
    required String password,
  }) async {
    try {
      state = ProfileUserStateLoading();

      await Future.delayed(const Duration(seconds: 2));

      await repository.updateUser(
        customName:customName,
        password: password,
        name: name,
        phone: phone,
      );
      state = ProfileUserStateSuccess();
    } catch (e) {
      state = ProfileUserStateError(e);
    }
  }
}
