import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/models/profit_model.dart';

abstract class HomePageState {}

class HomePageStateEmpty extends HomePageState {}

class HomePageStateLoading extends HomePageState {}

class HomePageStateSuccess extends HomePageState {
  final List<ProfitModel> profitsList;
  final List<ExpenseModel> expensesList;
  final String username;
  final String? avatarUrl;

  HomePageStateSuccess({
    required this.profitsList,
    required this.expensesList,
    required this.username,
    this.avatarUrl,
  });
}

class HomePageStateError extends HomePageState {
  final String error;

  HomePageStateError({
    required this.error,
  });
}
