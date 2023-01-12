import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/home/controllers/home_page_states.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';

class HomePageController {
  // final Auth authService;
  final AuthRepository authRepository;

  HomePageController({
    required this.authRepository,
  });

  final homeStateNotifier = ValueNotifier<HomePageState>(HomePageStateEmpty());

  set state(HomePageState state) => homeStateNotifier.value = state;
  HomePageState get state => homeStateNotifier.value;

  final profitsRepository = SharedPreferencesProfitRepository();
  final expensesRepository = SharedPreferencesExpenseRepository();

  Future<void> loadData() async {
    state = HomePageStateLoading();
    await Future.delayed(const Duration(seconds: 2));
    final loggedUser = authRepository.currentUser;

    if (loggedUser != null) {
      final profits = await profitsRepository.listAll(
        loggedUserId: loggedUser.uid,
      );
      final expenses = await expensesRepository.listAll(
        loggedUserId: loggedUser.uid,
      );

      state = HomePageStateSuccess(
        profitsList: profits ?? [],
        expensesList: expenses ?? [],
        username: loggedUser.displayName ?? loggedUser.email!,
      );
    } else {
      state = HomePageStateError(error: "Erro ao carregar dados");
    }
  }

  Future<void> logout() async {
    await authRepository.logout();
  }
}
