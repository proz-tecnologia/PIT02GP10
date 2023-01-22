import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/modules/authentication/authentication_routes.dart';
import 'package:gastos_app/src/modules/authentication/login/login_page_controller.dart';
import 'package:gastos_app/src/modules/authentication/login/login_state.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';
import 'package:validatorless/validatorless.dart';

import '../../../shared/components/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Modular.get<LoginPageController>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      loginController.login(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  @override
  void initState() {
    loginController.loginStateNotifier.addListener(
      () {
        if (loginController.loginState is LoginStateSuccess) {
          Modular.to.pushReplacementNamed(AuthenticationRoutes.splash);
        } else if (loginController.loginState is LoginStateError) {
          final e = loginController.loginState as LoginStateError;
          AppNotifications.errorNotificationBanner(e.object);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    loginController.loginStateNotifier.removeListener(() {});
    Modular.dispose<LoginPageController>();
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: CustomTextField(
                    label: "E-mail",
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: Validatorless.multiple([
                      Validatorless.required("Digite um e-mail válido"),
                      Validatorless.email("Digite um e-mail válido"),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: PasswordField(
                    label: "Senha",
                    controller: passwordController,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (_) {
                      login();
                    },
                    validator: Validatorless.multiple([
                      Validatorless.required("Digite uma senha válido"),
                      Validatorless.min(
                        6,
                        "Digite uma senha de no mínimo seis digitos",
                      ),
                    ]),
                    isPasswordVisible: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Modular.to.pushNamed(AuthenticationRoutes.recover);
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
                    onPressed: login,
                    child: ValueListenableBuilder(
                      valueListenable: loginController.loginStateNotifier,
                      builder: (context, state, _) {
                        if (state is LoginStateLoading) {
                          return const CustomLoadingIcon(size: 16);
                        }

                        return Text(
                          "Login",
                          style: textStyle,
                        );
                      },
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
                          Modular.to.pushNamed(AuthenticationRoutes.register);
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
      ),
    );
  }
}
