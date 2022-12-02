import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gastos_app/src/models/expense_model.dart';

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
  }) async {
    state = CreateExpenseStates.loading;
    try {
      final expense = ExpenseModel(
        title: title,
        value: value,
        createdAt: DateTime.now(),
        createdBy: '123',
        id: '123',
      );

      log(expense.toString());

      await Future.delayed(const Duration(seconds: 3));
      state = CreateExpenseStates.success;
    } catch (e) {
      state = CreateExpenseStates.error;
    }
  }
}

enum CreateExpenseStates {
  empty,
  loading,
  error,
  success,
}
