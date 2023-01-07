import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/services/auth_service.dart';
import 'package:gastos_app/src/modules/home/pages/expense/list_expenses/controllers/expenses_page_states.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';

class ExpenseListPageController {
  final AuthService authService;
  ExpenseListPageController({
    required this.authService,
  });

  final expensesPageStateNotifier = ValueNotifier<ExpenseListPageState>(
    ExpenseListPageStateEmpty(),
  );

  ExpenseListPageState get state => expensesPageStateNotifier.value;
  set state(ExpenseListPageState state) {
    expensesPageStateNotifier.value = state;
  }

  Future<void> getExpensesList() async {
    state = ExpenseListPageStateLoading();
    final expenseRepository = SharedPreferencesExpenseRepository();

    await Future.delayed(const Duration(seconds: 2));

    final loggedUser = await authService.getLoggedUser();

    if (loggedUser != null) {
      try {
        final expenses = await expenseRepository.listAll(
          loggedUserId: loggedUser.id,
        );

        if (expenses == null || expenses.isEmpty) {
          state = ExpenseListPageStateEmpty();
          return;
        }
        expenses.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        state = ExpenseListPageStateSuccess(
          expensesList: expenses,
          loggedUser: loggedUser,
        );
      } catch (e) {
        state = ExpenseListPageStateError(error: e.toString());
      }
    } else {
      await AuthService().logout();
    }
  }
}
