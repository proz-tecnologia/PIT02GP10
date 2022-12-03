import 'package:flutter/material.dart';
import 'package:gastos_app/src/mock/mocked_service.dart';

class MockedController {
  final mockedStateNotifier = ValueNotifier<MockedStates>(MockedStates.empty);

  Future<void> loadMockedData() async {
    mockedStateNotifier.value = MockedStates.loadingData;
    final mockedService = MockedService();

    await mockedService.createUsers();
    // await mockedService.createExpenses();
    // await mockedService.createProfits();

    mockedStateNotifier.value = MockedStates.loaded;
  }
}

enum MockedStates {
  empty,
  loadingData,
  loaded,
}
