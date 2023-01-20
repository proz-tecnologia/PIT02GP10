import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/register/register_states.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/repositories/user_repository.dart';

class RegisterPageController {
  final AuthRepository repository;
  final UserRepository userRepository;

  RegisterPageController({
    required this.repository,
    required this.userRepository,
  });

  final registerStateNotifier = ValueNotifier<RegisterStates>(
    RegisterStateEmpty(),
  );

  RegisterStates get state => registerStateNotifier.value;
  set state(RegisterStates state) => registerStateNotifier.value = state;

  Future<void> registerUser({
    required String name,
    required String email,
    String? phone,
    required String password,
  }) async {
    try {
      state = RegisterStateLoading();

      await Future.delayed(const Duration(seconds: 2));

      final userId = await repository.registerAccount(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );

      await userRepository.createUser(
        id: userId,
        name: name,
        email: email,
        phone: phone,
      );

      state = RegisterStateSuccess();
    } catch (e) {
      state = RegisterStateError(e);
    }
  }
}
