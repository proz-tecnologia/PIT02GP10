import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/models/user_model.dart';

abstract class ExpensesPageState {}

class ExpensePageStateEmpty extends ExpensesPageState {}

class ExpensePageStateLoading extends ExpensesPageState {}

class ExpensePageStateSuccess extends ExpensesPageState {
  final List<ExpenseModel> expensesList;
  final UserModel loggedUser;

  ExpensePageStateSuccess({
    required this.expensesList,
    required this.loggedUser,
  });
}

class ExpensePageStateError extends ExpensesPageState {
  final String error;

  ExpensePageStateError({
    required this.error,
  });
}
