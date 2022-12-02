import 'package:flutter/material.dart';
import 'package:gastos_app/src/mock/mocked_data.dart';
import 'package:gastos_app/src/modules/home/models/profit_model.dart';

class ProfitsPageController {
  final profitsPageStateNotifier = ValueNotifier<ProfitsPageStates>(
    ProfitsPageStates.empty,
  );

  ProfitsPageStates get state => profitsPageStateNotifier.value;
  set state(ProfitsPageStates state) {
    profitsPageStateNotifier.value = state;
  }

  final profits = <ProfitModel>[];

  ProfitsPageController() {
    getProfitsList();
  }

  Future<void> getProfitsList() async {
    state = ProfitsPageStates.loading;
    try {
      await Future.delayed(const Duration(seconds: 2));
      profits.clear();
      profits.addAll(MockedData.mockedProfits);
      if (profits.isEmpty) {
        state = ProfitsPageStates.empty;
        return;
      }
      profits.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      state = ProfitsPageStates.success;
    } catch (e) {
      state = ProfitsPageStates.error;
    }
  }
}

enum ProfitsPageStates {
  empty,
  loading,
  success,
  error,
}
