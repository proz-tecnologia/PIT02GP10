import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/models/user_model.dart';

abstract class HomeStates {}

class HomeStateEmpty extends HomeStates {}

class HomeStateLoading extends HomeStates {}

class HomeStateSuccess extends HomeStates {
  final List<ProfitModel> profitsList;
  final List<ExpenseModel> expensesList;
  final UserModel loggedUser;

  HomeStateSuccess({
    required this.profitsList,
    required this.expensesList,
    required this.loggedUser,
  });
}

class HomeStateError extends HomeStates {
  final String error;

  HomeStateError({
    required this.error,
  });
}
