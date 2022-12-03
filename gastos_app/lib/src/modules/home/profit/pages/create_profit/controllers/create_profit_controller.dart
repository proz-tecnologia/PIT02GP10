import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';

class CreateProfitController {
  final createProfitStateNotifier = ValueNotifier<CreateProfitStates>(
    CreateProfitStates.empty,
  );

  CreateProfitStates get state => createProfitStateNotifier.value;
  set state(CreateProfitStates state) {
    createProfitStateNotifier.value = state;
  }

  Future<void> createProfit({
    required String title,
    required double value,
    required DateTime createdAt,
  }) async {
    state = CreateProfitStates.loading;
    final profitsRepository = SharedPreferencesProfitRepository();
    final loggedUser = await AuthRepository.getLoggedUser();
    if (loggedUser != null) {
      try {
        await Future.delayed(const Duration(seconds: 2));
        await profitsRepository.create(
          title: title,
          value: value,
          createdAt: createdAt,
          loggedUserId: loggedUser.id,
        );

        state = CreateProfitStates.success;
        Modular.to.pop();
      } catch (e) {
        AppNotifications.errorNotificationBanner(e);
        state = CreateProfitStates.error;
      }
    } else {
      AuthRepository.logout();
    }
  }
}

enum CreateProfitStates {
  empty,
  loading,
  error,
  success,
}
