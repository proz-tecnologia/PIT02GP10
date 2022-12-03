import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/profits_page_states.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';

class ProfitsPageController {
  final profitsPageStateNotifier = ValueNotifier<ProfitsPageState>(
    ProfitPageStateEmpty(),
  );

  ProfitsPageState get state => profitsPageStateNotifier.value;
  set state(ProfitsPageState state) {
    profitsPageStateNotifier.value = state;
  }

  Future<void> getProfitsList() async {
    state = ProfitPageStateLoading();
    final profitRepository = SharedPreferencesProfitRepository();

    await Future.delayed(const Duration(seconds: 2));

    final loggedUser = await AuthRepository.getLoggedUser();

    if (loggedUser != null) {
      try {
        final profits = await profitRepository.listAll(
          loggedUserId: loggedUser.id,
        );

        if (profits == null || profits.isEmpty) {
          state = ProfitPageStateEmpty();
          return;
        }
        profits.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        state = ProfitPageStateSuccess(
          profitsList: profits,
          loggedUser: loggedUser,
        );
      } catch (e) {
        state = ProfitPageStateError(error: e.toString());
      }
    } else {
      // logout;
    }
  }
}
