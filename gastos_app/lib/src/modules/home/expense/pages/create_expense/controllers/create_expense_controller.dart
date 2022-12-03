import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';

class CreateExpenseController {
  final createExpenseStateNotifier = ValueNotifier<CreateExpenseStates>(
    CreateExpenseStates.empty,
  );

  CreateExpenseStates get state => createExpenseStateNotifier.value;
  set state(CreateExpenseStates state) {
    createExpenseStateNotifier.value = state;
  }

  Future<void> createExpense({
    required String title,
    required double value,
    required DateTime createdAt,
  }) async {
    state = CreateExpenseStates.loading;
    final expensesRepository = SharedPreferencesExpenseRepository();
    final loggedUser = await AuthRepository.getLoggedUser();
    if (loggedUser != null) {
      try {
        await Future.delayed(const Duration(seconds: 2));
        await expensesRepository.create(
          title: title,
          value: value,
          createdAt: createdAt,
          loggedUserId: loggedUser.id,
        );

        state = CreateExpenseStates.success;
        Modular.to.pop();
      } catch (e) {
        AppNotifications.errorNotificationBanner(e);
        state = CreateExpenseStates.error;
      }
    } else {
      AuthRepository.logout();
    }
  }
}

enum CreateExpenseStates {
  empty,
  loading,
  error,
  success,
}
