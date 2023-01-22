import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/firebase/firebase_controller.dart';
import 'package:gastos_app/src/modules/authentication/authentication_module.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository_firebase.dart';
import 'package:gastos_app/src/modules/home/home_module.dart';

class AppModule extends Module {
  final animationDuration = const Duration(milliseconds: 600);
  final transitionType = TransitionType.scale;

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<FirebaseController>((i) => FirebaseController()),
        Bind.lazySingleton<FirebaseAuth>((i) => FirebaseAuth.instance),
        Bind.lazySingleton<AuthRepository>(
          (i) => AuthRepositoryFirebase(
            firebaseAuthInstance: i.get<FirebaseAuth>(),
          ),
        ),
        Bind.lazySingleton<FirebaseFirestore>(
          (i) => FirebaseFirestore.instance,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.authentication,
          module: AuthenticationModule(),
          transition: transitionType,
          duration: animationDuration,
        ),
        ModuleRoute(
          AppRoutes.home,
          module: HomeModule(),
          transition: transitionType,
          duration: animationDuration,
        ),
      ];
}
