import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/home/pages/profit/create_profit/controllers/create_profit_page_state.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository_firestore.dart';

class CreateProfitPageController {
  final AuthRepository authRepository;
  CreateProfitPageController({
    required this.authRepository,
  });

  final createProfitStateNotifier = ValueNotifier<CreateProfitPageState>(
    CreateProfitPageStatePageEmpty(),
  );

  CreateProfitPageState get state => createProfitStateNotifier.value;
  set state(CreateProfitPageState state) {
    createProfitStateNotifier.value = state;
  }

  Future<void> createProfit({
    required String title,
    required double value,
    required DateTime createdAt,
  }) async {
    state = CreateProfitPageStateLoading();
    final profitsRepository = ProfitRepositoryFirestore();
    final loggedUser = authRepository.currentUser;
    if (loggedUser != null) {
      try {
        await Future.delayed(const Duration(seconds: 2));
        await profitsRepository.create(
          title: title,
          value: value,
          createdAt: createdAt,
          loggedUserId: loggedUser.uid,
        );

        state = CreateProfitPageStateSuccess();
      } catch (e) {
        state = CreateProfitPageStateError(error: e);
      }
    } else {
      await authRepository.logout();
      state = CreateProfitPageStateError(shouldLogout: true);
    }
  }
}
