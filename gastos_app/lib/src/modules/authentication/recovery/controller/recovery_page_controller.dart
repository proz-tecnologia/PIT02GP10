import 'package:flutter/material.dart';
import 'package:gastos_app/src/repositories/auth/recovery_repository.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';

class RecoveryPageController {
  final recoreryRepository = RecoveryRepository();

  String? emailToRecover;

  Future<void> requestCode({required String email}) async {
    try {
      emailPageState = EmailPageState.loading;
      await Future.delayed(const Duration(seconds: 2));

      final recoveryToken = await recoreryRepository.generateRecoveryToken(
        email: email,
      );

      AppNotifications.simpleNotificationBanner(
        message: "Código de recuperação: ${recoveryToken.code}",
        duration: const Duration(seconds: 5),
      );
      currentPage = RecoveryPages.code;
      emailToRecover = email;
      emailPageState = EmailPageState.success;
    } catch (e) {
      AppNotifications.errorNotificationBanner(e);
      emailToRecover = null;
      emailPageState = EmailPageState.error;
    }
  }

  final currentPageNotifier = ValueNotifier<RecoveryPages>(RecoveryPages.email);

  RecoveryPages get currentPage => currentPageNotifier.value;
  set currentPage(RecoveryPages page) => currentPageNotifier.value = page;

  final emailPageStateNotifier =
      ValueNotifier<EmailPageState>(EmailPageState.empty);
  EmailPageState get emailPageState => emailPageStateNotifier.value;
  set emailPageState(EmailPageState page) =>
      emailPageStateNotifier.value = page;

  final codePageStateNotifier = ValueNotifier<RecoveryCodeState>(
    RecoveryCodeState.empty,
  );

  RecoveryCodeState get codePageState => codePageStateNotifier.value;
  set codePageState(RecoveryCodeState page) =>
      codePageStateNotifier.value = page;

  final newPasswordPageStateNotifier = ValueNotifier<RecoveryNewPasswordState>(
    RecoveryNewPasswordState.empty,
  );

  RecoveryNewPasswordState get newPasswordPageState =>
      newPasswordPageStateNotifier.value;
  set newPasswordPageState(RecoveryNewPasswordState page) =>
      newPasswordPageStateNotifier.value = page;
}

enum RecoveryPages {
  email,
  code,
  newPassword,
}

enum EmailPageState {
  empty,
  loading,
  success,
  error,
}

enum RecoveryCodeState {
  empty,
  loading,
  success,
  error,
}

enum RecoveryNewPasswordState {
  empty,
  loading,
  success,
  error,
}
