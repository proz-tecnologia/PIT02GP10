import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logoSplash,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'para sua economia não miar!',
                style: TextStyle(color: Colors.orange, fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 24,
            height:16
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo3,
                ),
                const SizedBox(width: 12),
                Image.asset(
                  AppImages.logo3,
                ),
                const SizedBox(width: 12),
                Image.asset(
                  AppImages.logo3,
                ),
                const SizedBox(width: 12),
                Image.asset(
                  AppImages.logo3,
                ),
                const SizedBox(width: 12),
                Image.asset(
                  AppImages.logo3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}