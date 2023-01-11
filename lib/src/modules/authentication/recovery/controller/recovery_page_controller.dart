import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/recovery/controller/recovery_page_state.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';

class RecoveryPageController {
  final AuthRepository authRepository;
  RecoveryPageController({
    required this.authRepository,
  });

  final recoveryPageStateNotifier = ValueNotifier<RecoveryPageState>(
    RecoveryPageStateEmpty(),
  );

  RecoveryPageState get state => recoveryPageStateNotifier.value;
  set state(RecoveryPageState state) => recoveryPageStateNotifier.value = state;

  Future<void> requestChangePassword(final String email) async {
    state = RecoveryPageStateLoading();
    await Future.delayed(const Duration(seconds: 2));
    try {
      await authRepository.recoveryPassword(email: email);
      state = RecoveryPageStateSuccess();
    } catch (error) {
      state = RecoveryPageStateError(error: error);
    }
  }
}
