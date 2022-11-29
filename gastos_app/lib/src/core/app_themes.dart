import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static const defaultBorderRadius = BorderRadius.all(Radius.circular(32));

  static ThemeData defaultTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.backgroundColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
      bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
        backgroundColor: AppColors.primaryColor,
      ),
      iconTheme: IconTheme.of(context).copyWith(
        color: AppColors.secondaryColor,
      ),
      buttonTheme: ButtonTheme.of(context).copyWith(
        buttonColor: AppColors.secondaryColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.expenseColor,
          textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                decoration: TextDecoration.underline,
                decorationThickness: 2.0,
              ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.fontColor,
              ),
        ),
      ),
      drawerTheme: Theme.of(context).drawerTheme.copyWith(
            backgroundColor: AppColors.primaryColor,
            scrimColor: AppColors.backgroundColor.withOpacity(0.7),
          ),
      dividerTheme: Theme.of(context).dividerTheme.copyWith(
            color: AppColors.secondaryColor,
            thickness: 1.0,
          ),
      textTheme: GoogleFonts.robotoTextTheme(
        Theme.of(context).textTheme.apply(
              bodyColor: AppColors.fontColor,
              displayColor: AppColors.fontColor,
            ),
      ),
    );
  }
}
