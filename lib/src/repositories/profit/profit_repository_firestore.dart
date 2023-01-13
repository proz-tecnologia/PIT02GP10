import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/repositories/profit/profit_repository.dart';

class ProfitRepositoryFirestore with ProfitRepository {
  CollectionReference get _firestore => FirebaseFirestore.instance.collection(
        'profits',
      );
  @override
  Future<ProfitModel> create({
    required String title,
    required double value,
    required String loggedUserId,
    required DateTime createdAt,
  }) async {
    final profit = ProfitModel(
      createdAt: DateTime.now(),
      createdBy: loggedUserId,
      title: title,
      value: value,
    );

    final response = await _firestore.add(profit.toMap());

    final data = await response.get();

    return ProfitModel.fromMap(data.data() as Map<String, dynamic>);
  }

  @override
  Future<List<ProfitModel>?> listAll({required String loggedUserId}) async {
    final response =
        await _firestore.where('createdBy', isEqualTo: loggedUserId).get();

    if (response.docs.isNotEmpty) {
      final docs = response.docs;

      final profits = docs
          .map((e) => ProfitModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();

      return profits;
    }

    return null;
  }
}
