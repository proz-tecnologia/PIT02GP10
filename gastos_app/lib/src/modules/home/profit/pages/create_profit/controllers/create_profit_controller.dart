import 'package:flutter/material.dart';
import 'package:gastos_app/src/models/profit_model.dart';
import 'package:uuid/uuid.dart';

class CreateProfitController {
  final createProfitStateNotifier = ValueNotifier<CreateProfitStates>(
    CreateProfitStates.empty,
  );

  CreateProfitStates get state => createProfitStateNotifier.value;
  set state(CreateProfitStates state) {
    createProfitStateNotifier.value = state;
  }

  Future<void> createProfit({
    required String title,
    required double value,
  }) async {
    state = CreateProfitStates.loading;
    try {
      final profit = ProfitModel(
        id: const Uuid().v1(),
        title: title,
        value: value,
        createdAt: DateTime.now(),
        createdBy: '',
      );

      // Pegar esse profit e salvar em algum lugar, ou seja, chamar um service/repository que faça isso.
      await Future.delayed(const Duration(seconds: 3));
      state = CreateProfitStates.success;
      //Navegar para Tela anterior ou para tela de listagem
    } catch (e) {
      state = CreateProfitStates.error;
      //Continuo na mesma tela
    }
  }
}

enum CreateProfitStates {
  empty,
  loading,
  error,
  success,
}
