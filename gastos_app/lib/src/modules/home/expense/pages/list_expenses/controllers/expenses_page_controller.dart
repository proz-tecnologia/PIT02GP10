import 'package:flutter/material.dart';
import 'package:gastos_app/src/mock/mocked_data.dart';
import 'package:gastos_app/src/modules/home/models/expense_model.dart';


class ExpensesPageController {
  final expensesPageStateNotifier = ValueNotifier<ExpensesPageStates>(
    ExpensesPageStates.empty,
  );

   ExpensesPageStates get state => expensesPageStateNotifier.value;
  set state(ExpensesPageStates state) {
    expensesPageStateNotifier.value = state;
  }

  final expenses = <ExpenseModel>[];

  ExpensesPageController() {
    getExpensesList();
  }

  Future<void> getExpensesList() async {
    state = ExpensesPageStates.loading;
    try {
      await Future.delayed(const Duration(seconds: 2));
      expenses.clear();
      expenses.addAll(MockedData.mockedExpenses);
      if (expenses.isEmpty) {
        state = ExpensesPageStates.empty;
        return;
      }
      expenses.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      state = ExpensesPageStates.success;
    } catch (e) {
      state = ExpensesPageStates.error;
    }
  }
}

enum ExpensesPageStates {
  empty,
  loading,
  success,
  error,
}
