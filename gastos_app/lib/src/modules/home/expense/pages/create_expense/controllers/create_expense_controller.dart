import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/services/auth_service.dart';
import 'package:gastos_app/src/modules/home/expense/pages/create_expense/controllers/create_expense_state.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';

class CreateExpenseController {
  final createExpenseStateNotifier = ValueNotifier<CreateExpenseStates>(
    CreateExpenseStateEmpty(),
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
    state = CreateExpenseStateLoading();
    final expensesRepository = SharedPreferencesExpenseRepository();
    final loggedUser = await AuthService.getLoggedUser();
    if (loggedUser != null) {
      try {
        await Future.delayed(const Duration(seconds: 2));
        await expensesRepository.create(
          title: title,
          value: value,
          createdAt: createdAt,
          loggedUserId: loggedUser.id,
        );

        state = CreateExpenseStateSuccess();
      } catch (e) {
        state = CreateExpenseStateError(e);
      }
    } else {
      // AuthRepository.logout();
    }
  }
}
