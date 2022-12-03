import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/modules/home/home_states.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';

class HomeController {
  final homeStateNotifier = ValueNotifier<HomeStates>(HomeStateEmpty());

  set state(HomeStates state) => homeStateNotifier.value = state;
  HomeStates get state => homeStateNotifier.value;

  final profitsRepository = SharedPreferencesProfitRepository();
  final expensesRepository = SharedPreferencesExpenseRepository();

  Future<void> loadData() async {
    state = HomeStateLoading();
    await Future.delayed(const Duration(seconds: 2));
    final loggedUser = await AuthRepository.getLoggedUser();

    if (loggedUser != null) {
      final profits = await profitsRepository.listAll(
        loggedUserId: loggedUser.id,
      );
      final expenses = await expensesRepository.listAll(
        loggedUserId: loggedUser.id,
      );

      state = HomeStateSuccess(
        profitsList: profits ?? [],
        expensesList: expenses ?? [],
        loggedUser: loggedUser,
      );
    } else {
      state = HomeStateError(error: "Erro ao carregar dados");
      logout();
    }
  }

  Future<void> logout() async {
    await AuthRepository.clearLoggedUser();
    Modular.to.pushReplacementNamed(AppRoutes.splash);
  }
}
