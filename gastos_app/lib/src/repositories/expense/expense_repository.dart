import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/shared/config/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class ExpenseRepository {
  Future<ExpenseModel> create({
    required String title,
    required double value,
    required String loggedUserId,
    required DateTime createdAt,
  });
  Future<List<ExpenseModel>?> listAll({String loggedUserId});

  List<String> listToJson({required List<ExpenseModel> expenses}) {
    return expenses.map((e) => e.toJson()).toList();
  }
}

class SharedPreferencesExpenseRepository with ExpenseRepository {
  @override
  Future<ExpenseModel> create({
    required String title,
    required double value,
    required String loggedUserId,
    required DateTime createdAt,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final expenses = await listAll();

    final createExpense = ExpenseModel(
      title: title,
      createdAt: createdAt,
      createdBy: loggedUserId,
      id: const Uuid().v1(),
      value: value,
    );

    if (expenses == null) {
      await sharedPreferences.setStringList(
        SharedPreferencesKeys.expenses,
        [
          createExpense.toJson(),
        ],
      );
      return createExpense;
    }

    expenses.add(createExpense);

    final expensesToJson = listToJson(expenses: expenses);

    await sharedPreferences.setStringList(
      SharedPreferencesKeys.expenses,
      expensesToJson,
    );

    return createExpense;
  }

  @override
  Future<List<ExpenseModel>?> listAll({
    String? loggedUserId,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final contains = sharedPreferences.containsKey(
      SharedPreferencesKeys.expenses,
    );

    if (!contains) {
      return null;
    }

    final jsons = sharedPreferences.getStringList(
      SharedPreferencesKeys.expenses,
    );

    final expenses =
        jsons!.map((element) => ExpenseModel.fromJson(element)).toList();

    if (loggedUserId != null) {
      return expenses.where((e) => e.createdBy == loggedUserId).toList();
    }
    return expenses;
  }
}
