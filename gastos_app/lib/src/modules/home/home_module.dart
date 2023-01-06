import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/modules/authentication/services/auth_service.dart';
import 'package:gastos_app/src/modules/home/controllers/home_page_controller.dart';
import 'package:gastos_app/src/modules/home/home_page.dart';
import 'package:gastos_app/src/modules/home/home_routes.dart';
import 'package:gastos_app/src/modules/home/pages/expense/create_expense/controllers/create_expense_controller.dart';

import 'pages/expense/list_expenses/controllers/expenses_page_controller.dart';
import 'pages/profit/create_profit/controllers/create_profit_controller.dart';
import 'pages/profit/profit_list/controllers/profit_list_page_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory(
          (i) => HomePageController(authService: AuthService()),
        ),
        Bind.factory(
          (i) => ProfitListPageController(authService: AuthService()),
        ),
        Bind.factory(
          (i) => CreateProfitPageController(authService: AuthService()),
        ),
        Bind.factory(
          (i) => ExpenseListPageController(authService: AuthService()),
        ),
        Bind.factory(
          (i) => CreateExpensePageController(authService: AuthService()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(HomeRoutes.main, child: (context, _) => const HomePage()),
      ];
}
