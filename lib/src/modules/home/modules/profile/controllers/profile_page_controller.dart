import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/profile_page_state.dart';
import 'package:gastos_app/src/repositories/user_repository.dart';

class ProfilePageController {
  // name, nickname, telefone, avatarUrl

  final profilePageStateNotifier = ValueNotifier<ProfilePageState>(
    ProfilePageStateEmpty(),
  );

  ProfilePageState get state => profilePageStateNotifier.value;
  set state(ProfilePageState state) => profilePageStateNotifier.value = state;

  final UserRepository userRepository;
  final AuthRepository authRepository;

  ProfilePageController({
    required this.userRepository,
    required this.authRepository,
  });

  Future<void> getUserData() async {
    state = ProfilePageStateLoading();
    await Future.delayed(const Duration(seconds: 2));
    try {
      final loggedUser = authRepository.currentUser!;

      final response = await userRepository.getUserDataById(
        userId: loggedUser.uid,
      );

      state = ProfilePageStateSuccess(
        user: response,
      );
    } catch (e) {
      state = ProfilePageStateError(error: e);
    }
  }
}
