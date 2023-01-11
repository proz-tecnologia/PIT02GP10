// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:gastos_app/src/core/app_colors.dart';
// import 'package:gastos_app/src/core/app_images.dart';
// import 'package:gastos_app/src/modules/authentication/recovery/controller/recovery_page_controller.dart';
// import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
// import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
// import 'package:gastos_app/src/shared/components/custom_text_field.dart';
// import 'package:validatorless/validatorless.dart';
// import '../../../shared/components/password_field.dart';

// class RecoveryPasswordPageNewPassword extends StatefulWidget {
//   const RecoveryPasswordPageNewPassword({
//     Key? key,
//     required this.recoveryPageController,
//   }) : super(key: key);

//   final RecoveryPageController recoveryPageController;

//   @override
//   State<RecoveryPasswordPageNewPassword> createState() =>
//       _RecoveryPasswordPageNewPasswordState();
// }

// class _RecoveryPasswordPageNewPasswordState
//     extends State<RecoveryPasswordPageNewPassword> {
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   Future<void> changePassword() async {
//     if (formKey.currentState!.validate()) {
//       final response = await widget.recoveryPageController.changePassword(
//         newPassword: passwordController.text,
//       );
//       if (response) Modular.to.pop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
//           fontWeight: FontWeight.w500,
//           fontSize: 16,
//         );

//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 const SizedBox(height: 40),
//                 Image.asset(AppImages.logoSplash),
//                 const SizedBox(height: 34),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                   child: Text(
//                     "Digite sua nova senha",
//                     style: textStyle?.copyWith(fontSize: 30),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: PasswordField(
//                     label: "Senha",
//                     controller: passwordController,
//                     textInputAction: TextInputAction.next,
//                     validator: Validatorless.multiple([
//                       Validatorless.required("digite uma senha válida"),
//                       Validatorless.compare(
//                         confirmPasswordController,
//                         "As senhas devem ser iguais",
//                       )
//                     ]),
//                     isPasswordVisible: false,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: PasswordField(
//                     label: "Confirmar Senha",
//                     controller: confirmPasswordController,
//                     onFieldSubmitted: (_) {
//                       changePassword();
//                     },
//                     validator: Validatorless.multiple([
//                       Validatorless.required("digite uma senha válida"),
//                       Validatorless.compare(
//                         passwordController,
//                         "As senhas devem ser iguais",
//                       )
//                     ]),
//                     isPasswordVisible: false,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 SizedBox(
//                   width: 136,
//                   child: CustomElevatedButton(
//                     backgroundColor: AppColors.expenseColor,
//                     onPressed: changePassword,
//                     child: ValueListenableBuilder<NewPasswordPageState>(
//                       valueListenable: widget
//                           .recoveryPageController.newPasswordPageStateNotifier,
//                       builder: (context, state, _) {
//                         if (state == NewPasswordPageState.loading) {
//                           return const CustomLoadingIcon(size: 16);
//                         }
//                         return Text(
//                           "Finalizar",
//                           style: textStyle?.copyWith(fontSize: 16),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
