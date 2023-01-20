import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/modules/authentication/recovery/controller/recovery_page_controller.dart';
import 'package:gastos_app/src/modules/authentication/recovery/controller/recovery_page_state.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';
import 'package:validatorless/validatorless.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final controller = Modular.get<RecoveryPageController>();

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.recoveryPageStateNotifier.addListener(() {
      if (controller.state is RecoveryPageStateError) {
        final error = (controller.state as RecoveryPageStateError).error;
        AppNotifications.errorNotificationBanner(error);
      } else if (controller.state is RecoveryPageStateSuccess) {
        AppNotifications.simpleNotificationBanner(
          message: 'E-mail de recuperação enviado.',
        );
        Modular.to.pop();
      }
    });
    super.initState();
  }

  void requestRecovery() {
    if (formKey.currentState!.validate()) {
      controller.requestChangePassword(emailController.text);
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
                    onPressed: () {
                      Modular.to.pop();
                    },
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
                    "Enviaremos um e-mail para você recuperar sua senha.",
                    style: textStyle?.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    label: "E-mail",
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (_) {
                      requestRecovery();
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
                    onPressed: requestRecovery,
                    child: ValueListenableBuilder<RecoveryPageState>(
                      valueListenable: controller.recoveryPageStateNotifier,
                      builder: (context, state, _) {
                        if (state is RecoveryPageStateLoading) {
                          return const CustomLoadingIcon(size: 16);
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
