import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/firebase/firebase-controller.dart';
import 'package:gastos_app/src/modules/authentication/authentication_module.dart';
import 'package:gastos_app/src/modules/home/home_module.dart';

class AppModule extends Module {
  final animationDuration = const Duration(milliseconds: 600);
  final transitionType = TransitionType.scale;

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<FirebaseController>((i) => FirebaseController()),
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
