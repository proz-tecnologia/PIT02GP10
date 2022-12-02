import 'package:gastos_app/src/models/app_error_model.dart';
import 'package:gastos_app/src/models/user_model.dart';
import 'package:gastos_app/src/shared/config/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class UserRepository {
  Future<UserModel> create({
    required String email,
    required String password,
    required String name,
  });
  Future<List<UserModel>?> listAll();
  Future<UserModel?> findByEmail({required String email});
  Future<UserModel> updatePassword({
    required String email,
    required String newPassword,
  });

  List<String> listToJson({required List<UserModel> users}) {
    return users.map((e) => e.toJson()).toList();
  }
}

class SharedPrefsUserRepository with UserRepository {
  @override
  Future<UserModel> create({
    required String email,
    required String password,
    required String name,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final createUser = UserModel(
      id: const Uuid().v1(),
      email: email,
      password: password,
      name: name,
    );

    final users = await listAll();

    if (users == null) {
      await sharedPreferences.setStringList(
        SharedPreferencesKeys.users,
        [
          createUser.toJson(),
        ],
      );
      return createUser;
    }

    final exists = await findByEmail(email: email);

    if (exists != null) {
      throw AppErrorModel(
        message: "Usuário já cadastrado com o e-mail informado",
        statusCode: 401,
      );
    }

    users.add(createUser);

    final usersToJson = listToJson(users: users);

    await sharedPreferences.setStringList(
      SharedPreferencesKeys.users,
      usersToJson,
    );

    return createUser;
  }

  @override
  Future<UserModel?> findByEmail({required String email}) async {
    final users = await listAll();

    if (users == null) return null;

    final exists = users.any((element) => element.email == email);

    if (!exists) return null;

    return users.firstWhere((element) => element.email == email);
  }

  @override
  Future<List<UserModel>?> listAll() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final contains = sharedPreferences.containsKey(SharedPreferencesKeys.users);

    if (!contains) {
      return null;
    }

    final jsons = sharedPreferences.getStringList(SharedPreferencesKeys.users);
    final users = jsons!.map((element) => UserModel.fromJson(element)).toList();
    return users;
  }

  @override
  Future<UserModel> updatePassword({
    required String email,
    required String newPassword,
  }) async {
    final instance = await SharedPreferences.getInstance();

    final users = await listAll();

    if (users == null) {
      throw AppErrorModel(
        message: "Usuário não encontrado",
        statusCode: 404,
      );
    }

    final user = await findByEmail(email: email);

    if (user == null) {
      throw AppErrorModel(
        message: "Usuário não encontrado",
        statusCode: 404,
      );
    }

    final updatedUser = user.copyWith(password: newPassword);

    users.remove(user);

    users.add(updatedUser);

    final usersToJson = listToJson(users: users);

    await instance.setStringList(SharedPreferencesKeys.users, usersToJson);
    return updatedUser;
  }
}
