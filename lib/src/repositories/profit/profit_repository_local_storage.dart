import 'package:gastos_app/src/repositories/profit/profit_repository.dart';
import 'package:gastos_app/src/shared/config/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/profit_model.dart';

class ProfitRepositoryLocalStorage with ProfitRepository {
  @override
  Future<ProfitModel> create({
    required String title,
    required double value,
    required String loggedUserId,
    required DateTime createdAt,
  }) async {
    final instance = await SharedPreferences.getInstance();

    final profits = await listAll();

    final createProfit = ProfitModel(
      title: title,
      createdAt: createdAt,
      createdBy: loggedUserId,
      value: value,
    );

    if (profits == null) {
      await instance.setStringList(
        SharedPreferencesKeys.profits,
        [
          createProfit.toJson(),
        ],
      );
      return createProfit;
    }

    profits.add(createProfit);

    final profitsToJson = listToJson(profits: profits);

    await instance.setStringList(
      SharedPreferencesKeys.profits,
      profitsToJson,
    );

    return createProfit;
  }

  @override
  Future<List<ProfitModel>?> listAll({
    String? loggedUserId,
  }) async {
    final instance = await SharedPreferences.getInstance();

    final contains = instance.containsKey(
      SharedPreferencesKeys.profits,
    );

    if (!contains) {
      return null;
    }

    final jsons = instance.getStringList(
      SharedPreferencesKeys.profits,
    );

    final profits =
        jsons!.map((element) => ProfitModel.fromJson(element)).toList();

    if (loggedUserId != null) {
      return profits.where((e) => e.createdBy == loggedUserId).toList();
    }

    return profits;
  }
}
