import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/register/register_states.dart';
import 'package:gastos_app/src/repositories/auth/user_repository.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';

class RegisterController {
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
    final userRespository = SharedPrefsUserRepository();
    try {
      state = RegisterStateLoading();

      await Future.delayed(const Duration(seconds: 2));

      await userRespository.create(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      state = RegisterStateSuccess();
    } catch (e) {
      AppNotifications.errorNotificationBanner(e);
      state = RegisterStateError(e);
    }
  }
}
