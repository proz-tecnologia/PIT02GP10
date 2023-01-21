import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/home/pages/profit/profit_list/controllers/profit_list_page_state.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';

class ProfitListPageController {
  final AuthRepository authRepository;
  final ProfitRepository profitRepository;

  ProfitListPageController({
    required this.authRepository,
    required this.profitRepository,
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

    await Future.delayed(const Duration(seconds: 2));

    final loggedUser = authRepository.currentUser;

    if (loggedUser != null) {
      try {
        final profits = await profitRepository.listAll(
          loggedUserId: loggedUser.uid,
        );

        if (profits == null || profits.isEmpty) {
          state = ProfitPageStateEmpty();
          return;
        }
        profits.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        state = ProfitPageStateSuccess(
          profitsList: profits,
        );
      } catch (e) {
        state = ProfitPageStateError(error: e.toString());
      }
    } else {
      await authRepository.logout();
      state = ProfitPageStateError(shouldLogout: true);
    }
  }
}
