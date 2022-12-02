import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';

class HomeController {
  Future<void> logout() async {
    await AuthRepository.clearLoggedUser();
    Modular.to.pushReplacementNamed(AppRoutes.splash);
  }
}
