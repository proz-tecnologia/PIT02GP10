import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/mock/mocked_controller.dart';
import 'package:gastos_app/src/repositories/auth/auth_repository.dart';

class SplashController {
  final mockedController = MockedController();

  Future<void> loadData() async {
    mockedController.loadMockedData();
  }

  Future<void> isAuthenticated() async {
    await loadData();
    await Future.delayed(const Duration(milliseconds: 2500));

    final response = await AuthRepository.isAuthenticated();
    if (response == true) {
      Modular.to.pushReplacementNamed(AppRoutes.home);
    } else {
      Modular.to.pushReplacementNamed(AppRoutes.login);
    }
  }
}
