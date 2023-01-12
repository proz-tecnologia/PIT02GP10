import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/firebase/firebase_controller.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/authentication/splash/controller/splash_page_state.dart';

class SplashPageController {
  final splashPageStateNotifier = ValueNotifier<SplashPageState>(
    SplashPageStateEmpty(),
  );

  Future<void> setupFirebase() async {
    final firebaseController = Modular.get<FirebaseController>();
    await firebaseController.setup();

    await isAuthenticated();
  }

  Future<void> isAuthenticated() async {
    await Future.delayed(const Duration(milliseconds: 2500));

    final authRepository = Modular.get<AuthRepository>();

    final response = authRepository.currentUser;
    if (response != null) {
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
