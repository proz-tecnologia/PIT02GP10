import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/splash/controller/splash_page_state.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';


class SplashPageController {
  final splashPageStateNotifier =
      ValueNotifier<SplashPageState>(SplashPageStateEmpty());

  SplashPageState get state => splashPageStateNotifier.value;
  set state(SplashPageState state) {
    splashPageStateNotifier.value = state;
  }

  Future<void> isAuthenticated() async {
    final response = await AuthRepository.isAuthenticated();
    if (response == true) {
      state = SplashPageStateAuthenticated();
    }
  }
}
