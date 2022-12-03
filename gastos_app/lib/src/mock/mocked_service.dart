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
        log(e.toString(), name: "MockedService");
      }
    }
    log("created mocked users!...", name: "MockedService");
  }

  Future<void> createProfits() async {
    final profitsRepository = SharedPreferencesProfitRepository();

    final userRepository = SharedPrefsUserRepository();
    final mockedUser = await userRepository.findByEmail(
      email: "patrick@dev.com",
    );

    final createdProfits = await profitsRepository.listAll();

    if (mockedUser != null) {
      if (createdProfits != null) {
        for (final profit in MockedData.mockedProfits) {
          if (!createdProfits.any((element) => element.id == profit.id)) {
            await profitsRepository.create(
              title: profit.title,
              value: profit.value,
              createdAt: profit.createdAt,
              loggedUserId: mockedUser.id,
            );
          }
        }
      }
    }
    log("created mocked profits!...", name: "MockedService");
  }

  Future<void> createExpenses() async {
    final expensesRepository = SharedPreferencesExpenseRepository();

    final userRepository = SharedPrefsUserRepository();
    final mockedUser = await userRepository.findByEmail(
      email: "patrick@dev.com",
    );

    final createdExpenses = await expensesRepository.listAll();

    if (mockedUser != null) {
      if (createdExpenses != null) {
        for (final expense in MockedData.mockedExpenses) {
          if (!createdExpenses.any((element) => element.id == expense.id)) {
            await expensesRepository.create(
              title: expense.title,
              value: expense.value,
              createdAt: expense.createdAt,
              loggedUserId: mockedUser.id,
            );
          }
        }
      }
    }
    log("created mocked expenses!...", name: "MockedService");
  }
}
