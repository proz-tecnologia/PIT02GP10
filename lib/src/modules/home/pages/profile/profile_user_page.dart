import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_images.dart';
import 'package:gastos_app/src/modules/home/pages/profile/profile_user_controller.dart';
import 'package:gastos_app/src/modules/home/pages/profile/profile_user_states.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';
import 'package:gastos_app/src/shared/components/password_field.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';
import 'package:gastos_app/src/shared/utils/input_masks.dart';
import 'package:validatorless/validatorless.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileUserPage> createState() => _ProfileUserStates();
}

class _ProfileUserStates extends State<ProfileUserPage> {
  final nameController = TextEditingController();
  final customNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final profileUserController = Modular.get<ProfileUserController>();

  void profileUser() {
    if (formKey.currentState!.validate()) {
      profileUserController.profileUser(
        name: nameController.text,
        customName: customNameController.text,
        phone: phoneController.text,
        password: passwordController.text,
      );
    }
  }

  @override
  void initState() {
    profileUserController.profileUserStateNotifier.addListener(() {
      if (profileUserController.state is ProfileUserStateSuccess) {
        Modular.to.pop();
      } else if (profileUserController.state is ProfileUserStateError) {
        final e = profileUserController.state as ProfileUserStateError;
        AppNotifications.errorNotificationBanner(e.object);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    profileUserController.profileUserStateNotifier.removeListener(() {});
    Modular.dispose<ProfileUserController>();
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
                    onPressed: () {
                      Modular.to.pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset(AppImages.profileImage),
                const SizedBox(height: 16),
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
                    label: "Nome de Preferência",
                    controller: nameController,
                    validator: Validatorless.required("Digite um nome válido"),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
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
                    onPressed: profileUser,
                    child: ValueListenableBuilder<ProfileUserStates>(
                      valueListenable:
                          profileUserController.profileUserStateNotifier,
                      builder: (context, state, _) {
                        if (state is ProfileUserStateLoading) {
                          return const CustomLoadingIcon(size: 16);
                        }
                        return Text(
                          "Finalizar",
                          style: textStyle,
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
