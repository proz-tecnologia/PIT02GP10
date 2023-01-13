import 'package:gastos_app/src/models/expense_model.dart';

abstract class ExpenseRepository {
  Future<ExpenseModel> create({
    required String title,
    required double value,
    required String loggedUserId,
    required DateTime createdAt,
  });
  Future<List<ExpenseModel>?> listAll({required String loggedUserId});

  List<String> listToJson({required List<ExpenseModel> expenses}) {
    return expenses.map((e) => e.toJson()).toList();
  }
}
