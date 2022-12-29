import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/modules/authentication/register/register_controller.dart';
import 'package:gastos_app/src/modules/authentication/register/register_states.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';
import 'package:gastos_app/src/shared/utils/input_masks.dart';
import 'package:validatorless/validatorless.dart';
import '../../../shared/components/password_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final registerController = RegisterController();

  void registerUser() {
    if (formKey.currentState!.validate()) {
      registerController.registerUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  @override
  void initState() {
    registerController.registerStateNotifier.addListener(() {
      if (registerController.state is RegisterStateSuccess) {
        Modular.to.pop();
      } else if (registerController.state is RegisterStateError) {
        final e = registerController.state as RegisterStateError;
        AppNotifications.errorNotificationBanner(e.object);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    registerController.registerStateNotifier.removeListener(() {});
    super.dispose();
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
                const SizedBox(height: 16),
                Image.asset(AppImages.logoSplash),
                const SizedBox(height: 16),
                Text(
                  "Cadastre-se",
                  style: textStyle?.copyWith(fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    label: "Nome",
                    controller: nameController,
                    validator: Validatorless.required("Digite um nome válido"),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    label: "E-mail",
                    controller: emailController,
                    validator: Validatorless.multiple([
                      Validatorless.required("Digite um email válido"),
                      Validatorless.email("Digite um email válido"),
                    ]),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    label: "Telefone",
                    controller: phoneController,
                    inputFormatters: [
                      AppInputMasks.phoneMask,
                    ],
                    validator: Validatorless.required(
                      "Digite um telefone válido",
                    ),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: PasswordField(
                    label: "Senha",
                    controller: passwordController,
                    validator: Validatorless.multiple([
                      Validatorless.required("Digite uma senha válida"),
                      Validatorless.compare(
                        confirmPasswordController,
                        "A senhas precisam ser iguais",
                      ),
                    ]),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.visiblePassword,
                    isPasswordVisible: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: PasswordField(
                    label: "Confirmar a senha",
                    controller: confirmPasswordController,
                    validator: Validatorless.multiple([
                      Validatorless.required("Digite uma senha válida"),
                      Validatorless.compare(
                        passwordController,
                        "A senhas precisam ser iguais",
                      ),
                    ]),
                    onFieldSubmitted: (_) {
                      registerUser();
                    },
                    textInputAction: TextInputAction.send,
                    textInputType: TextInputType.visiblePassword,
                    isPasswordVisible: true,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 136,
                  child: CustomElevatedButton(
                    backgroundColor: AppColors.expenseColor,
                    onPressed: registerUser,
                    child: ValueListenableBuilder<RegisterStates>(
                        valueListenable:
                            registerController.registerStateNotifier,
                        builder: (context, state, _) {
                          if (state == RegisterStateLoading()) {
                            return const CustomLoadingIcon(size: 16);
                          }

                          return Text(
                            "Cadastrar",
                            style: textStyle,
                          );
                        }),
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
