import 'dart:developer';

import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/shared/config/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class ProfitRepository {
  Future<ProfitModel> create({
    required String title,
    required double value,
    required String loggedUserId,
  });
  Future<List<ProfitModel>?> listAll({String loggedUserId});

  List<String> listToJson({required List<ProfitModel> profits}) {
    return profits.map((e) => e.toJson()).toList();
  }
}

class SharedPreferencesProfitRepository with ProfitRepository {
  @override
  Future<ProfitModel> create({
    required String title,
    required double value,
    required String loggedUserId,
  }) async {
    final instance = await SharedPreferences.getInstance();

    final profits = await listAll();

    final createProfit = ProfitModel(
      title: title,
      createdAt: DateTime.now(),
      createdBy: loggedUserId,
      id: const Uuid().v1(),
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

    log(contains.toString());

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

    log(profits.toString());
    return profits;
  }
}
