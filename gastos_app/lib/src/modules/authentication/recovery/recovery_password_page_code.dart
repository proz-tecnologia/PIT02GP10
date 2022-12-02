import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/modules/authentication/recovery/controller/recovery_page_controller.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';
import 'package:gastos_app/src/shared/utils/input_masks.dart';
import 'package:validatorless/validatorless.dart';

class RecoveryPasswordPageCode extends StatefulWidget {
  const RecoveryPasswordPageCode({
    Key? key,
    required this.recoveryPageController,
  }) : super(key: key);

  final RecoveryPageController recoveryPageController;

  @override
  State<RecoveryPasswordPageCode> createState() =>
      _RecoveryPasswordPageCodeState();
}

class _RecoveryPasswordPageCodeState extends State<RecoveryPasswordPageCode> {
  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void validateToken() {
    widget.recoveryPageController.validateToken(token: codeController.text);
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
                      widget.recoveryPageController.currentPage =
                          RecoveryPages.email;
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
                    "Informe o código recebido",
                    style: textStyle?.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    label: "Código",
                    controller: codeController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.send,
                    inputFormatters: [
                      AppInputMasks.tokenMask,
                    ],
                    validator: Validatorless.required(
                      "Digite um código válido",
                    ),
                    onFieldSubmitted: (_) {
                      validateToken();
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: const Text("Solicitar novamente"),
                        onPressed: () {
                          widget.recoveryPageController.requestCode(
                            email:
                                widget.recoveryPageController.emailToRecover!,
                          );
                        },
                      ),
                      SizedBox(
                        width: 136,
                        child: CustomElevatedButton(
                          backgroundColor: AppColors.expenseColor,
                          onPressed: validateToken,
                          child: ValueListenableBuilder<CodePageState>(
                            valueListenable: widget
                                .recoveryPageController.codePageStateNotifier,
                            builder: (context, state, _) {
                              if (state == CodePageState.loading) {
                                return const CustomLoadingIcon(size: 16);
                              }

                              return Text(
                                "Enviar",
                                style: textStyle?.copyWith(fontSize: 16),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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
