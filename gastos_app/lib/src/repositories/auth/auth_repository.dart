import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/models/app_error_model.dart';
import 'package:gastos_app/src/models/user_model.dart';
import 'package:gastos_app/src/repositories/auth/user_repository.dart';
import 'package:gastos_app/src/shared/config/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static Future<UserModel> authenticate({
    required String email,
    required String password,
  }) async {
    final userRepository = SharedPrefsUserRepository();

    final user = await userRepository.findByEmail(email: email);

    if (user == null || user.password != password) {
      throw AppErrorModel(message: "Credenciais incorretas!", statusCode: 401);
    }

    return user;
  }

  static Future<bool> isAuthenticated() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(SharedPreferencesKeys.loggedUser);
  }

  static Future<void> saveLoggedUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(SharedPreferencesKeys.loggedUser, user.toJson());
  }

  static Future<void> clearLoggedUser() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(SharedPreferencesKeys.loggedUser);
  }

  static Future<UserModel?> getLoggedUser() async {
    final instance = await SharedPreferences.getInstance();
    final String? userJson = instance.getString(
      SharedPreferencesKeys.loggedUser,
    );

    if (userJson == null) {
      return null;
    }

    return UserModel.fromJson(userJson);
  }

  static Future<void> logout() async {
    await AuthRepository.clearLoggedUser();
    Modular.to.pushReplacementNamed(AppRoutes.splash);
  }
}
