import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/home/controllers/home_page_controller.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/edit_profile_controller.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/edit_profile_state.dart';
import 'package:gastos_app/src/modules/home/modules/profile/controllers/profile_page_controller.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';
import 'package:gastos_app/src/shared/components/password_field.dart';
import 'package:gastos_app/src/shared/utils/app_input_masks.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';
import 'package:validatorless/validatorless.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfileStates();
}

class _EditProfileStates extends State<EditProfilePage> {
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final profileUserController = Modular.get<EditProfileController>();

  void updateUserData() {
    if (formKey.currentState!.validate()) {
      profileUserController.updateUserData(
        name: nameController.text.isNotEmpty ? nameController.text : null,
        nickname:
            nicknameController.text.isNotEmpty ? nicknameController.text : null,
        phone: phoneController.text.isNotEmpty ? phoneController.text : null,
        password:
            passwordController.text.isNotEmpty ? passwordController.text : null,
      );
    }
  }

  @override
  void initState() {
    profileUserController.profileUserStateNotifier.addListener(() async {
      if (profileUserController.state is EditProfileStateSuccess) {
        Modular.get<ProfilePageController>().getUserData();
        Modular.get<HomePageController>().loadData();
        Modular.to.pop();
      } else if (profileUserController.state is EditProfileStateError) {
        final e = profileUserController.state as EditProfileStateError;
        AppNotifications.errorNotificationBanner(e.object);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    profileUserController.profileUserStateNotifier.removeListener(() {});
    Modular.dispose<EditProfileController>();
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(
                      child: Text(
                        "Editar Perfil",
                        textAlign: TextAlign.center,
                        style: textStyle?.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: 48)
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    label: "Nome",
                    controller: nameController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.min(4, "Digite um nome válido"),
                      ],
                    ),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    label: "Apelido",
                    controller: nicknameController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.min(2, "Digite um apelido válido"),
                      ],
                    ),
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
                    validator: Validatorless.multiple(
                      [
                        Validatorless.min(15, "Digite um telefone válido"),
                        Validatorless.max(15, "Digite um telefone válido"),
                      ],
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
                      Validatorless.min(
                        6,
                        "Digite uma senha de no mínimo seis digitos",
                      ),
                      Validatorless.compare(
                        passwordController,
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
                      Validatorless.min(
                        6,
                        "Digite uma senha de no mínimo seis digitos",
                      ),
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
                    onPressed: updateUserData,
                    child: ValueListenableBuilder<EditProfileState>(
                      valueListenable:
                          profileUserController.profileUserStateNotifier,
                      builder: (context, state, _) {
                        if (state is EditProfileStateLoading) {
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
