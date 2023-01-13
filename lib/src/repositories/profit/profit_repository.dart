import 'package:gastos_app/src/models/profit_model.dart';

abstract class ProfitRepository {
  Future<ProfitModel> create({
    required String title,
    required double value,
    required String loggedUserId,
    required DateTime createdAt,
  });
  Future<List<ProfitModel>?> listAll({required String loggedUserId});

  List<String> listToJson({required List<ProfitModel> profits}) {
    return profits.map((e) => e.toJson()).toList();
  }
}
