import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/app/app_routes.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Image.asset(AppImages.logoSplash),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    "Bem-vindo!",
                    style: textStyle?.copyWith(fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0),
                child: CustomTextField(
                  label: "E-mail",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0),
                child: CustomTextField(
                  label: "Senha",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Modular.to.pushNamed(AppRoutes.recover);
                    },
                    child: Text(
                      "esqueci a senha",
                      style: textStyle?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 136,
                child: CustomElevatedButton(
                  backgroundColor: AppColors.expenseColor,
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: textStyle,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "É novo?",
                      style: textStyle,
                    ),
                    TextButton(
                      child: Text(
                        "Cadastre-se",
                        style: textStyle?.copyWith(
                          color: AppColors.expenseColor,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0,
                        ),
                      ),
                      onPressed: () {
                        Modular.to.pushNamed(AppRoutes.register);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
