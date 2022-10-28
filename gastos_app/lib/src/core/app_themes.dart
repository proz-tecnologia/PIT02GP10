import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';

class AppThemes {
  static ThemeData defaultTheme(BuildContext context) =>
      ThemeData.dark().copyWith(
        primaryColor: AppColors.primaryColor,
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          backgroundColor: AppColors.primaryColor,
        ),
        iconTheme: IconTheme.of(context).copyWith(
          color: AppColors.secondaryColor,
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: AppColors.secondaryColor,
        ),
        drawerTheme: Theme.of(context).drawerTheme.copyWith(
              backgroundColor: AppColors.primaryColor,
            ),
        dividerTheme: Theme.of(context).dividerTheme.copyWith(
              color: AppColors.orange,
            ),
      );
}
