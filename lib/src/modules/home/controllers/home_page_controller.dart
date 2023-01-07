import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/services/auth_service.dart';
import 'package:gastos_app/src/modules/home/controllers/home_page_states.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';

class HomePageController {
  final AuthService authService;

  HomePageController({
    required this.authService,
  });

  final homeStateNotifier = ValueNotifier<HomePageState>(HomePageStateEmpty());

  set state(HomePageState state) => homeStateNotifier.value = state;
  HomePageState get state => homeStateNotifier.value;

  final profitsRepository = SharedPreferencesProfitRepository();
  final expensesRepository = SharedPreferencesExpenseRepository();

  Future<void> loadData() async {
    state = HomePageStateLoading();
    await Future.delayed(const Duration(seconds: 2));
    final loggedUser = await authService.getLoggedUser();

    if (loggedUser != null) {
      final profits = await profitsRepository.listAll(
        loggedUserId: loggedUser.id,
      );
      final expenses = await expensesRepository.listAll(
        loggedUserId: loggedUser.id,
      );

      state = HomePageStateSuccess(
        profitsList: profits ?? [],
        expensesList: expenses ?? [],
        loggedUser: loggedUser,
      );
    } else {
      state = HomePageStateError(error: "Erro ao carregar dados");
      await AuthService().logout();
    }
  }
}
