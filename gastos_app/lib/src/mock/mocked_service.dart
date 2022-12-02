import 'dart:developer';

import 'package:gastos_app/src/mock/mocked_data.dart';
import 'package:gastos_app/src/repositories/auth/user_repository.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';

class MockedService {
  Future<void> createUsers() async {
    final mockedUsers = MockedData.mockedUsers;

    final userRepository = SharedPrefsUserRepository();

    for (final user in mockedUsers) {
      try {
        await userRepository.create(
          email: user.email,
          name: user.name,
          password: user.password,
        );
      } catch (e) {
        log(e.toString());
      }
    }
  }

  Future<void> createProfits() async {
    final profitsRepository = SharedPreferencesProfitRepository();

    final createdProfits = await profitsRepository.listAll();

    for (final profit in MockedData.mockedProfits) {
      if (createdProfits != null &&
          !createdProfits.any((element) => element.id == profit.id)) {
        await profitsRepository.create(
          title: profit.title,
          value: profit.value,
          loggedUserId: "123",
        );
      }
    }
  }

  Future<void> createExpenses() async {
    final expensesRepository = SharedPreferencesExpenseRepository();

    final createdExpense = await expensesRepository.listAll();

    for (final expense in MockedData.mockedExpenses) {
      if (createdExpense != null &&
          !createdExpense.any((element) => element.id == expense.id)) {
        await expensesRepository.create(
          title: expense.title,
          value: expense.value,
          loggedUserId: "123",
        );
      }
    }
  }
}
