import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/services/auth_service.dart';
import 'package:gastos_app/src/modules/authentication/splash/controller/splash_page_state.dart';

class SplashPageController {
  final AuthService authService;

  SplashPageController({
    required this.authService,
  });

  final splashPageStateNotifier = ValueNotifier<SplashPageState>(
    SplashPageStateEmpty(),
  );

  Future<void> isAuthenticated() async {
    await Future.delayed(const Duration(milliseconds: 2500));

    final response = await authService.isAuthenticated();
    if (response == true) {
      state = SplashPageStateAuthenticated();
    } else {
      state = SplashPageStateUnauthenticated();
    }
  }

  SplashPageState get state => splashPageStateNotifier.value;
  set state(SplashPageState state) {
    splashPageStateNotifier.value = state;
  }
}
