import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/home/pages/expense/create_expense/controllers/create_expense_state.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';

class CreateExpensePageController {
  final AuthRepository authRepository;

  CreateExpensePageController({
    required this.authRepository,
  });

  final createExpenseStateNotifier = ValueNotifier<CreateExpensePageState>(
    CreateExpensePageStateEmpty(),
  );

  CreateExpensePageState get state => createExpenseStateNotifier.value;
  set state(CreateExpensePageState state) {
    createExpenseStateNotifier.value = state;
  }

  Future<void> createExpense({
    required String title,
    required double value,
    required DateTime createdAt,
  }) async {
    state = CreateExpensePageStateLoading();
    final expensesRepository = SharedPreferencesExpenseRepository();
    final loggedUser = authRepository.currentUser;
    if (loggedUser != null) {
      try {
        await Future.delayed(const Duration(seconds: 2));
        await expensesRepository.create(
          title: title,
          value: value,
          createdAt: createdAt,
          loggedUserId: loggedUser.uid,
        );

        state = CreateExpensePageStateSuccess();
      } catch (e) {
        state = CreateExpensePageStateError(error: e);
      }
    } else {
      await authRepository.logout();
      state = CreateExpensePageStateError(shouldLogout: true);
    }
  }
}
