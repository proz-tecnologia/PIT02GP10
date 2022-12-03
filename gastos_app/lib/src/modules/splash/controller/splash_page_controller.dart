import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/mock/mocked_controller.dart';
import 'package:gastos_app/src/modules/splash/controller/splash_page_state.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';

class SplashPageController {
  final splashPageStateNotifier = ValueNotifier<SplashPageState>(
    SplashPageStateEmpty(),
  );

  final mockedController = MockedController();

  Future<void> loadData() async {
    mockedController.loadMockedData();
  }

  Future<void> isAuthenticated() async {
    await loadData();
    await Future.delayed(const Duration(milliseconds: 2500));

    final response = await AuthRepository.isAuthenticated();
    if (response == true) {
      state = SplashPageStateAuthenticated();
      Modular.to.pushReplacementNamed(AppRoutes.home);
    } else {
      Modular.to.pushReplacementNamed(AppRoutes.login);
    }
  }

  SplashPageState get state => splashPageStateNotifier.value;
  set state(SplashPageState state) {
    splashPageStateNotifier.value = state;
  }
}
