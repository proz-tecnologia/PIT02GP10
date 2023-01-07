import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/models/user_model.dart';

abstract class ExpenseListPageState {}

class ExpenseListPageStateEmpty extends ExpenseListPageState {}

class ExpenseListPageStateLoading extends ExpenseListPageState {}

class ExpenseListPageStateSuccess extends ExpenseListPageState {
  final List<ExpenseModel> expensesList;
  final UserModel loggedUser;

  ExpenseListPageStateSuccess({
    required this.expensesList,
    required this.loggedUser,
  });
}

class ExpenseListPageStateError extends ExpenseListPageState {
  final String error;

  ExpenseListPageStateError({
    required this.error,
  });
}
