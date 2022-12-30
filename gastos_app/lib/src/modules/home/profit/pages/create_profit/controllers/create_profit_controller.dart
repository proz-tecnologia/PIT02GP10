import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/home/profit/pages/create_profit/controllers/create_profit_state.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';

class CreateProfitController {
  final createProfitStateNotifier = ValueNotifier<CreateProfitStates>(
    CreateProfitStateEmpty(),
  );

  CreateProfitStates get state => createProfitStateNotifier.value;
  set state(CreateProfitStates state) {
    createProfitStateNotifier.value = state;
  }

  Future<void> createProfit({
    required String title,
    required double value,
    required DateTime createdAt,
  }) async {
    state = CreateProfitStateLoading();
    final profitsRepository = SharedPreferencesProfitRepository();
    final loggedUser = await AuthRepository.getLoggedUser();
    if (loggedUser != null) {
      try {
        await Future.delayed(const Duration(seconds: 2));
        await profitsRepository.create(
          title: title,
          value: value,
          createdAt: createdAt,
          loggedUserId: loggedUser.id,
        );

        state = CreateProfitStateSuccess();
      } catch (e) {
        state = CreateProfitStateError(e);
      }
    } else {
      AuthRepository.logout();
    }
  }
}
