import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/register/register_states.dart';
import 'package:gastos_app/src/modules/authentication/repositories/user_repository.dart';

class RegisterPageController {
  final UserRepository userRepository;

  RegisterPageController({
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

      await userRepository.create(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      state = RegisterStateSuccess();
    } catch (e) {
      state = RegisterStateError(e);
    }
  }
}
