import 'package:flutter/material.dart';
import 'package:gastos_app/src/models/app_error_model.dart';
import 'package:gastos_app/src/modules/authentication/login/login_states.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';

class LoginPageController {
  final AuthRepository authRepository;

  LoginPageController({
    required this.authRepository,
  });

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

      final user = await authRepository.login(
        email: email,
        password: password,
      );

      if (user.user != null) {
        if (user.user!.emailVerified) {
          loginState = LoginStateSuccess();
          return;
        }
        await authRepository.currentUser?.sendEmailVerification();
        await authRepository.logout();
        throw AppErrorModel(
          message: 'Verique seu e-mail por favor!',
          statusCode: 401,
        );
      }
      throw AppErrorModel(
        message: 'Erro ao fazer login!',
        statusCode: 401,
      );
    } catch (e) {
      AppNotifications.errorNotificationBanner(e);
      loginState = LoginStateError(e);
    }
  }
}
