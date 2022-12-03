import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';

class LoginController {
  final loginStateNotifier = ValueNotifier<LoginStates>(LoginStates.empty);

  LoginStates get loginState => loginStateNotifier.value;
  set loginState(LoginStates state) => loginStateNotifier.value = state;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      loginState = LoginStates.loading;

      await Future.delayed(const Duration(seconds: 2));

      final response = await AuthRepository.authenticate(
        email: email,
        password: password,
      );

      await AuthRepository.saveLoggedUser(response);
      Modular.to.pushNamed(AppRoutes.splash);
      loginState = LoginStates.success;
    } catch (e) {
      AppNotifications.errorNotificationBanner(e);
      loginState = LoginStates.error;
    }
  }
}

enum LoginStates {
  empty,
  loading,
  success,
  error,
}
