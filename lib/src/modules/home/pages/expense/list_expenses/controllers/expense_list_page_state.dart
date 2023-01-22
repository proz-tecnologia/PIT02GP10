import 'package:gastos_app/src/models/expense_model.dart';

abstract class ExpenseListPageState {}

class ExpenseListPageStateEmpty extends ExpenseListPageState {}

class ExpenseListPageStateLoading extends ExpenseListPageState {}

class ExpenseListPageStateSuccess extends ExpenseListPageState {
  final List<ExpenseModel> expensesList;

  ExpenseListPageStateSuccess({
    required this.expensesList,
  });
}

class ExpenseListPageStateError extends ExpenseListPageState {
  final String? error;
  final bool shouldLogout;

  ExpenseListPageStateError({
    this.error,
    this.shouldLogout = false,
  });
}
