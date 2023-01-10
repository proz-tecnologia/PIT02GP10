abstract class UserRepositoryFirebase {
  //Future<void>init();

  Future<void> registerAccount({
    required String name,
    required String email,
    String? phone,
    required String password,
  });

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> recoveryPassword({required String email});

  saveLoggedUser(void response) {}

  //generateRecoveryToken({required String email}) {}

  //validateToken({required String code, required String email}) {}

  // Future<void> changePassword({
  //   required String newPassword,
  //   required String token,
  //   required String email,
  // }) {}

//User? hasUser();

  Future<void> logout();
}
