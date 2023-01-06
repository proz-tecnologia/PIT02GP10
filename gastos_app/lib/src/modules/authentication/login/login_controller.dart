import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/login/login_states.dart';
import 'package:gastos_app/src/modules/authentication/services/auth_repository.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';

class LoginController {
  final loginStateNotifier = ValueNotifier<LoginStates>(
    LoginStateEmpty(),
  );

  LoginStates get loginState => loginStateNotifier.value;
  set loginState(LoginStates state) => loginStateNotifier.value = state;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      loginState = LoginStateLoading();

      await Future.delayed(const Duration(seconds: 2));

      final response = await AuthService.authenticate(
        email: email,
        password: password,
      );

      await AuthService.saveLoggedUser(response);

      loginState = LoginStateSuccess();
    } catch (e) {
      AppNotifications.errorNotificationBanner(e);
      loginState = LoginStateError(e);
    }
  }
}
