import 'dart:math' as math;

import 'package:gastos_app/src/models/app_error_model.dart';
import 'package:gastos_app/src/models/recovery_token_model.dart';
import 'package:gastos_app/src/repositories/auth/user_repository.dart';
import 'package:gastos_app/src/shared/config/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecoveryRepository {
  final int expirationDays = 1;

  Future<RecoveryTokenModel?> validateToken({
    required int code,
    required String email,
  }) async {
    final unexpiredToken = await findUnexpiredByEmail(email: email);

    if (unexpiredToken == null || unexpiredToken.code != code) {
      return null;
    }

    return unexpiredToken;
  }

  Future<RecoveryTokenModel> generateRecoveryToken({
    required String email,
  }) async {
    final instance = await SharedPreferences.getInstance();

    final userRepository = SharedPrefsUserRepository();

    final user = await userRepository.findByEmail(email: email);

    if (user == null) {
      throw AppErrorModel(
        message: "usuário não encontrado",
        statusCode: 401,
      );
    }

    final exists = await findUnexpiredByEmail(email: email);

    if (exists != null) {
      return exists;
    }

    final randomCode = generateRandomCode();

    final recoveryToken = RecoveryTokenModel(
      code: randomCode,
      userEmail: email,
      createdAt: DateTime.now(),
    );

    final tokens = await listAll();

    if (tokens == null) {
      await instance.setStringList(
        SharedPreferencesKeys.recoveryTokens,
        [
          recoveryToken.toJson(),
        ],
      );
      return recoveryToken;
    }
    tokens.add(recoveryToken);

    final tokensToJson = tokens.map((e) => e.toJson()).toList();

    await instance.setStringList(
      SharedPreferencesKeys.recoveryTokens,
      tokensToJson,
    );

    return recoveryToken;
  }

  int generateRandomCode() {
    final rdn = math.Random();
    int randomCode = rdn.nextInt(999999) * 1000000;
    while (randomCode < 100000) {
      randomCode *= 10;
    }
    return randomCode;
  }

  Future<List<RecoveryTokenModel>?> listAll() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final contains = sharedPreferences.containsKey(
      SharedPreferencesKeys.recoveryTokens,
    );

    if (!contains) {
      return null;
    }

    final jsons = sharedPreferences.getStringList(
      SharedPreferencesKeys.recoveryTokens,
    );
    final tokens =
        jsons!.map((element) => RecoveryTokenModel.fromJson(element)).toList();
    return tokens;
  }

  Future<RecoveryTokenModel?> findUnexpiredByEmail({
    required String email,
  }) async {
    final tokens = await listAll();

    if (tokens == null) return null;

    final exists = tokens.any((element) => element.userEmail == email);

    if (!exists) return null;

    final userTokens = tokens.where((element) => element.userEmail == email);

    userTokens.map((e) {
      e.createdAt.add(Duration(days: expirationDays));
    });

    final isExpired = userTokens.any(
      (element) => DateTime.now().isBefore(element.createdAt),
    );

    if (isExpired) return null;

    return userTokens.firstWhere(
      (element) => DateTime.now().isBefore(element.createdAt),
    );
  }
}
