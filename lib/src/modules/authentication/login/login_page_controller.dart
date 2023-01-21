import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/login/login_state.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';

class LoginPageController {
  final AuthRepository authRepository;

  LoginPageController({
    required this.authRepository,
  });

  final loginStateNotifier = ValueNotifier<LoginState>(
    LoginStateEmpty(),
  );

  LoginState get loginState => loginStateNotifier.value;
  set loginState(LoginState state) => loginStateNotifier.value = state;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      loginState = LoginStateLoading();

      await Future.delayed(const Duration(seconds: 2));

      final userCredential = await authRepository.login(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        loginState = LoginStateSuccess();
      }
    } catch (e) {
      AppNotifications.errorNotificationBanner(e);
      loginState = LoginStateError(e);
    }
  }
}
