import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/media/media_repository.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/edit_profile_controller.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/profile_page_controller.dart';
import 'package:gastos_app/src/modules/home/modules/profile/pages/edit_profile_page.dart';
import 'package:gastos_app/src/modules/home/modules/profile/pages/profile_page.dart';
import 'package:gastos_app/src/modules/home/modules/profile/profile_routes.dart';
import 'package:gastos_app/src/repositories/user_repository.dart';
import 'package:gastos_app/src/repositories/user_repository_firebase.dart';

const String _moduleName = 'home/profile/';

class ProfileModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<MediaRepository>((i) => MediaRepository()),
        Bind.factory<UserRepository>((i) => UserRepositoryFirebase()),
        Bind.factory<ProfilePageController>(
          (i) => ProfilePageController(
              authRepository: i.get<AuthRepository>(),
              userRepository: i.get<UserRepository>(),
              mediaRepository: i.get<MediaRepository>()),
        ),
        Bind.factory(
          (i) => EditProfileController(
            authRepository: i.get<AuthRepository>(),
            userRepository: i.get<UserRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          routeNameFormatter(ProfileRoutes.profile),
          child: (context, _) => const ProfilePage(),
        ),
        ChildRoute(
          routeNameFormatter(ProfileRoutes.editProfile),
          child: (context, _) => const EditProfilePage(),
        ),
      ];

  String routeNameFormatter(String route) => route.replaceAll(_moduleName, '');
}
