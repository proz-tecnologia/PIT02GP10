import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/repositories/expense/expense_repository.dart';

class ExpenseRepositoryFirestore with ExpenseRepository {
  CollectionReference get _firestore => FirebaseFirestore.instance.collection(
        'expenses',
      );
  @override
  Future<ExpenseModel> create({
    required String title,
    required double value,
    required String loggedUserId,
    required DateTime createdAt,
  }) async {
    final expense = ExpenseModel(
      createdAt: DateTime.now(),
      createdBy: loggedUserId,
      title: title,
      value: value,
    );

    final response = await _firestore.add(expense.toMap());

    final data = await response.get();

    return ExpenseModel.fromMap(data.data() as Map<String, dynamic>);
  }

  @override
  Future<List<ExpenseModel>?> listAll({required String loggedUserId}) async {
    final response =
        await _firestore.where('createdBy', isEqualTo: loggedUserId).get();

    if (response.docs.isNotEmpty) {
      final docs = response.docs;

      final expenses = docs
          .map((e) => ExpenseModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();

      return expenses;
    }

    return null;
  }
}
