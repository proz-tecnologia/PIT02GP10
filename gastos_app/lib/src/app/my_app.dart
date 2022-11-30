import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_themes.dart';
import 'package:gastos_app/src/modules/home/expense/create_expense_page.dart';

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
      title: 'Gastos App',
      theme: AppThemes.defaultTheme(context),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      home: const CreateExpensePage(),
    );
  }
}
