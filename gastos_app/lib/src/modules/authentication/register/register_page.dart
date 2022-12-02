import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
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
              const SizedBox(height: 16),
              Text(
                "Cadastre-se",
                style: textStyle?.copyWith(fontSize: 30),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  label: "Nome",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  label: "E-mail",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  label: "Telefone",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  label: "Senha",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  label: "Confirmar a senha",
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 136,
                child: CustomElevatedButton(
                  backgroundColor: AppColors.expenseColor,
                  onPressed: () {},
                  child: Text(
                    "Cadastrar",
                    style: textStyle,
                  ),
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
