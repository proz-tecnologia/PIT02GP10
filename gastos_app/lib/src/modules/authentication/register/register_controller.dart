import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/repositories/auth/user_repository.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';

class RegisterController {
  final registerStateNotifier = ValueNotifier<RegisterStates>(
    RegisterStates.empty,
  );

  RegisterStates get state => registerStateNotifier.value;
  set state(RegisterStates state) => registerStateNotifier.value = state;

  Future<void> registerUser({
    required String name,
    required String email,
    String? phone,
    required String password,
  }) async {
    final userRespository = SharedPrefsUserRepository();
    try {
      state = RegisterStates.loading;

      await Future.delayed(const Duration(seconds: 2));

      await userRespository.create(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      state = RegisterStates.success;
      Modular.to.pop();
    } catch (e) {
      AppNotifications.errorNotificationBanner(e);
      state = RegisterStates.error;
    }
  }
}

enum RegisterStates {
  empty,
  loading,
  success,
  error,
}
