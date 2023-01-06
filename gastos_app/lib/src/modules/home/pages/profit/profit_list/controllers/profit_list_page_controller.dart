import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/services/auth_service.dart';
import 'package:gastos_app/src/modules/home/pages/profit/profit_list/controllers/profit_list_page_states.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';

class ProfitListPageController {
  final AuthService authService;

  ProfitListPageController({
    required this.authService,
  });

  final profitsPageStateNotifier = ValueNotifier<ProfitListPageState>(
    ProfitPageStateEmpty(),
  );

  ProfitListPageState get state => profitsPageStateNotifier.value;
  set state(ProfitListPageState state) {
    profitsPageStateNotifier.value = state;
  }

  Future<void> getProfitsList() async {
    state = ProfitPageStateLoading();
    final profitRepository = SharedPreferencesProfitRepository();

    await Future.delayed(const Duration(seconds: 2));

    final loggedUser = await authService.getLoggedUser();

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
      // AuthRepository.logout();
    }
  }
}
