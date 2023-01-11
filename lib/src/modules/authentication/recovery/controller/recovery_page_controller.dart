// import 'package:flutter/material.dart';
// import 'package:gastos_app/src/modules/authentication/recovery/repositories/recovery_repository.dart';
// import 'package:gastos_app/src/shared/utils/app_notifications.dart';

// class RecoveryPageController {
//   // final RecoveryRepository recoreryRepository;

//   String? emailToRecover;
//   String? token;

//   Future<void> requestCode({required String email}) async {
//     try {
//       emailPageState = EmailPageState.loading;
//       await Future.delayed(const Duration(seconds: 2));

//       final recoveryToken = await recoreryRepository.generateRecoveryToken(
//         email: email,
//       );

//       AppNotifications.simpleNotificationBanner(
//         message: "Código de recuperação: ${recoveryToken.code}",
//         duration: const Duration(seconds: 5),
//       );
//       currentPage = RecoveryPages.code;
//       emailToRecover = email;
//       emailPageState = EmailPageState.success;
//     } catch (e) {
//       AppNotifications.errorNotificationBanner(e);
//       emailToRecover = null;
//       emailPageState = EmailPageState.error;
//     }
//   }

//   Future<void> validateToken({required String token}) async {
//     if (emailToRecover == null) {
//       currentPage = RecoveryPages.email;
//     } else {
//       try {
//         codePageState = CodePageState.loading;
//         await Future.delayed(const Duration(seconds: 2));

//         await recoreryRepository.validateToken(
//           code: token,
//           email: emailToRecover!,
//         );
//         currentPage = RecoveryPages.newPassword;
//         codePageState = CodePageState.success;
//         this.token = token;
//       } catch (e) {
//         AppNotifications.errorNotificationBanner(e);
//         codePageState = CodePageState.error;
//         this.token = null;
//       }
//     }
//   }

//   Future<bool> changePassword({required String newPassword}) async {
//     if (emailToRecover == null && token == null) {
//       currentPage = RecoveryPages.email;
//     } else if (token == null) {
//       currentPage = RecoveryPages.code;
//     } else {
//       try {
//         newPasswordPageState = NewPasswordPageState.loading;
//         await Future.delayed(const Duration(seconds: 2));
//         await recoreryRepository.changePassword(
//           newPassword: newPassword,
//           token: token!,
//           email: emailToRecover!,
//         );
//         newPasswordPageState = NewPasswordPageState.success;
//         return true;
//       } catch (e) {
//         AppNotifications.errorNotificationBanner(e);
//         newPasswordPageState = NewPasswordPageState.error;
//         currentPage = RecoveryPages.code;
//       }
//     }
//     return false;
//   }

//   final currentPageNotifier = ValueNotifier<RecoveryPages>(RecoveryPages.email);

//   RecoveryPages get currentPage => currentPageNotifier.value;
//   set currentPage(RecoveryPages page) => currentPageNotifier.value = page;

//   final emailPageStateNotifier =
//       ValueNotifier<EmailPageState>(EmailPageState.empty);
//   EmailPageState get emailPageState => emailPageStateNotifier.value;
//   set emailPageState(EmailPageState page) =>
//       emailPageStateNotifier.value = page;

//   final codePageStateNotifier = ValueNotifier<CodePageState>(
//     CodePageState.empty,
//   );

//   CodePageState get codePageState => codePageStateNotifier.value;
//   set codePageState(CodePageState page) => codePageStateNotifier.value = page;

//   final newPasswordPageStateNotifier = ValueNotifier<NewPasswordPageState>(
//     NewPasswordPageState.empty,
//   );

//   NewPasswordPageState get newPasswordPageState =>
//       newPasswordPageStateNotifier.value;
//   set newPasswordPageState(NewPasswordPageState page) =>
//       newPasswordPageStateNotifier.value = page;

//   RecoveryPageController({
//     required this.recoreryRepository,
//   });
// }

// enum RecoveryPages {
//   email,
//   code,
//   newPassword,
// }

// enum EmailPageState {
//   empty,
//   loading,
//   success,
//   error,
// }

// enum CodePageState {
//   empty,
//   loading,
//   success,
//   error,
// }

// enum NewPasswordPageState {
//   empty,
//   loading,
//   success,
//   error,
// }
