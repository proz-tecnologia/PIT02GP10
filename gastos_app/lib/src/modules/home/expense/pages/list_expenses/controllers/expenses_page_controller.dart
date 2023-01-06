import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/services/auth_service.dart';
import 'package:gastos_app/src/modules/home/expense/pages/list_expenses/expenses_page_states.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';

class ExpensesPageController {
  final expensesPageStateNotifier = ValueNotifier<ExpensesPageState>(
    ExpensePageStateEmpty(),
  );

  ExpensesPageState get state => expensesPageStateNotifier.value;
  set state(ExpensesPageState state) {
    expensesPageStateNotifier.value = state;
  }

  Future<void> getExpensesList() async {
    state = ExpensePageStateLoading();
    final expenseRepository = SharedPreferencesExpenseRepository();

    await Future.delayed(const Duration(seconds: 2));

    final loggedUser = await AuthService.getLoggedUser();

    if (loggedUser != null) {
      try {
        final expenses = await expenseRepository.listAll(
          loggedUserId: loggedUser.id,
        );

        if (expenses == null || expenses.isEmpty) {
          state = ExpensePageStateEmpty();
          return;
        }
        expenses.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        state = ExpensePageStateSuccess(
          expensesList: expenses,
          loggedUser: loggedUser,
        );
      } catch (e) {
        state = ExpensePageStateError(error: e.toString());
      }
    } else {
      // A.logout();
    }
  }
}
