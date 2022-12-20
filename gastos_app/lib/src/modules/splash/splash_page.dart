import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/modules/splash/components/animated_cats.dart';
import 'package:gastos_app/src/modules/splash/controller/splash_page_controller.dart';
import 'package:gastos_app/src/modules/splash/controller/splash_page_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashPageController controller = SplashPageController();

  @override
  void initState() {
    controller.isAuthenticated();
    controller.splashPageStateNotifier.addListener(() {
      if (controller.state is SplashPageStateAuthenticated) {
        Modular.to.pushReplacementNamed(AppRoutes.home);
      } else if (controller.state is SplashPageStateUnauthenticated){
        Modular.to.pushReplacementNamed(AppRoutes.login);
      }
    });
    super.initState();
  }


  @override
  void dispose() {
    controller.splashPageStateNotifier.removeListener(() { });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logoSplash,
              width: size.width * 0.5,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'para sua economia não miar!',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 24, height: 16),
            const AnimatedCats(),
          ],
        ),
      ),
    );
  }
}
