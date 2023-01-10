import 'package:firebase_auth/firebase_auth.dart';
import 'package:gastos_app/src/modules/authentication/repositories/user_repository_firebase.dart';

class AuthenticationRepositoryImpl implements UserRepositoryFirebase {
  FirebaseAuth get authentication => FirebaseAuth.instance;

  @override
  Future<void> registerAccount({
    required String name,
    required String email,
    String? phone,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await authentication.currentUser!.updateDisplayName(name);
    await authentication.currentUser!.sendEmailVerification();
  }

  // @override
  // User? hasUser() => authentication.currentUser;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await authentication.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> recoveryPassword({
    required String email,
  }) async {
    return await authentication.sendPasswordResetEmail(email: email);
  }

  @override
  saveLoggedUser(void response) {}

  @override
  changePassword(
      {required String newPassword,
      required String token,
      required String email}) {}

  @override
  generateRecoveryToken({required String email}) {}

  @override
  validateToken({required String code, required String email}) {}

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  /*@override
   Future<FirebaseApp> init() async {
    return await Firebase.initializeApp(
      name: 'Gastos-APP',
      options: const FirebaseOptions(
        apiKey: "AIzaSyDwBadOMmrz38v9hAEfSnEE3Us7U2L8DBg",
        appId: "1:1042540631912:android:c215afe6aa51a104e928dd",
        messagingSenderId: "1042540631912",
        projectId: "gastos-app-33002",
      ),
    );
  }*/
}
