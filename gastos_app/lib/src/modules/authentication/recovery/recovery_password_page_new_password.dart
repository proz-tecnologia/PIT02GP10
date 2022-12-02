import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/modules/authentication/recovery/recovery_page_controller.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';

class RecoveryPasswordPageNewPassword extends StatelessWidget {
  const RecoveryPasswordPageNewPassword({
    Key? key,
    required this.recoveryPageController,
  }) : super(key: key);

  final RecoveryPageController recoveryPageController;

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
              const SizedBox(height: 40),
              Image.asset(AppImages.logoSplash),
              const SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Recupere sua senha",
                  style: textStyle?.copyWith(fontSize: 30),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Enviaremos um código para o seu email de login para dar início ao processo de redefinição de senha",
                  style: textStyle?.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  label: "E-mail",
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 136,
                child: CustomElevatedButton(
                  backgroundColor: AppColors.expenseColor,
                  onPressed: () {},
                  child: Text(
                    "Finalizar",
                    style: textStyle?.copyWith(fontSize: 16),
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
