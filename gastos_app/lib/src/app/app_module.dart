import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/modules/authentication/recovery/recovery_password_page.dart';
import 'package:gastos_app/src/modules/authentication/register/register_page.dart';
import 'package:gastos_app/src/modules/home/expense/pages/create_expense/create_expense_page.dart';
import 'package:gastos_app/src/modules/home/expense/pages/list_expenses/expenses_page.dart';
import 'package:gastos_app/src/modules/home/profit/pages/create_profit/create_profit_page.dart';
import 'package:gastos_app/src/modules/home/profit/pages/list_profits/profits_page.dart';

import '../modules/authentication/login/login_page.dart';
import '../modules/home/home_page.dart';
import '../modules/splash/splash_page.dart';

class AppModule extends Module {
  final animationDuration = const Duration(milliseconds: 600);
  final transitionType = TransitionType.scale;

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.splash,
          child: (context, _) => const SplashPage(),
          duration: animationDuration,
          transition: transitionType,
        ),
        ChildRoute(
          AppRoutes.login,
          child: (context, _) => const LoginPage(),
          duration: animationDuration,
          transition: transitionType,
        ),
        ChildRoute(
          AppRoutes.recover,
          child: (context, _) => const RecoveryPasswordPage(),
          duration: animationDuration,
          transition: transitionType,
        ),
        ChildRoute(
          AppRoutes.register,
          child: (context, _) => const RegisterPage(),
          duration: animationDuration,
          transition: transitionType,
        ),
        ChildRoute(
          AppRoutes.home,
          child: (context, _) => const HomePage(),
          duration: animationDuration,
          transition: transitionType,
        ),
        ChildRoute(
          AppRoutes.createExpense,
          child: (context, _) => const CreateExpensePage(),
          duration: animationDuration,
          transition: transitionType,
        ),
        ChildRoute(
          AppRoutes.createProfit,
          child: (context, _) => const CreateProfitPage(),
          duration: animationDuration,
          transition: transitionType,
        ),
        ChildRoute(
          AppRoutes.listExpense,
          child: (context, _) => const ExpensesPage(),
          duration: animationDuration,
          transition: transitionType,
        ),
        ChildRoute(
          AppRoutes.listProfit,
          child: (context, _) => const ProfitsPage(),
          duration: animationDuration,
          transition: transitionType,
        ),
      ];
}
