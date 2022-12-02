import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/modules/authentication/recovery/controller/recovery_page_controller.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';
import 'package:validatorless/validatorless.dart';

class RecoveryPasswordPageEmail extends StatefulWidget {
  const RecoveryPasswordPageEmail({
    Key? key,
    required this.recoveryPageController,
  }) : super(key: key);

  final RecoveryPageController recoveryPageController;

  @override
  State<RecoveryPasswordPageEmail> createState() =>
      _RecoveryPasswordPageEmailState();
}

class _RecoveryPasswordPageEmailState extends State<RecoveryPasswordPageEmail> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void requestToken() {
    if (formKey.currentState!.validate()) {
      widget.recoveryPageController.requestCode(email: emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                const SizedBox(height: 20),
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
                    "Enviaremos um código para dar início ao processo de redefinição de senha",
                    style: textStyle?.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    label: "E-mail",
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (_) {
                      requestToken();
                    },
                    validator: Validatorless.multiple([
                      Validatorless.required("Digite um e-mail válido"),
                      Validatorless.email("Digite um e-mail válido"),
                    ]),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 136,
                  child: CustomElevatedButton(
                    backgroundColor: AppColors.expenseColor,
                    onPressed: requestToken,
                    child: ValueListenableBuilder<EmailPageState>(
                      valueListenable:
                          widget.recoveryPageController.emailPageStateNotifier,
                      builder: (context, state, _) {
                        if (state == EmailPageState.loading) {
                          return const CustomLoadingIcon(
                            size: 16,
                          );
                        }

                        return Text(
                          "Solicitar",
                          style: textStyle?.copyWith(fontSize: 16),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
