import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/home/models/profit_model.dart';

class CreateProfitController {
  final createProfitStateNotifier = ValueNotifier<CreateProfitStates>(
    CreateProfitStates.empty,
  );

  CreateProfitStates get state => createProfitStateNotifier.value;
  set state(CreateProfitStates state) {
    log(this.state.toString());
    createProfitStateNotifier.value = state;
    log(this.state.toString());
  }

  Future<void> createProfit({
    required String title,
    required double value,
  }) async {
    state = CreateProfitStates.loading;
    try {
      final profit = ProfitModel(
        title: title,
        value: value,
        createdAt: DateTime.now(),
      );

      // Pegar esse profit e salvar em algum lugar, ou seja, chamar um service/repository que faça isso.
      await Future.delayed(const Duration(seconds: 3));
      state = CreateProfitStates.success;
      //Navegar para Tela anterior
    } catch (e) {
      state = CreateProfitStates.error;
    }
  }
}

enum CreateProfitStates {
  empty,
  loading,
  error,
  success,
}
