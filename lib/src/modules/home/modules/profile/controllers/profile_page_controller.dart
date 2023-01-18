import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/repositories/user_repository.dart';

class ProfilePageController {
  // name, nickname, telefone, avatarUrl

  final UserRepository userRepository;
  final AuthRepository authRepository;

  ProfilePageController({
    required this.userRepository,
    required this.authRepository,
  });

  Future<void> getUserData() async {
    final loggedUser = authRepository.currentUser!;

    final response = await userRepository.getUserDataById(
      userId: loggedUser.uid,
    );
  }
}
