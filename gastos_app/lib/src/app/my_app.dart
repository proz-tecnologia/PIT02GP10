import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_themes.dart';
import 'package:gastos_app/src/modules/home/splash_page.dart';




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.defaultTheme(context),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
