import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_themes.dart';
import 'package:gastos_app/src/mock/mocked_service.dart';
import 'package:gastos_app/src/modules/authentication/recovery/recovery_password_page.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    final mockedService = MockedService();

    mockedService.createUsers();
    mockedService.createExpenses();
    mockedService.createProfits();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
      ),
    );

    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Gastos App',
        theme: AppThemes.defaultTheme(context),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        home: const RecoveryPasswordPage(),
      ),
    );
  }
}
