import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/authentication/recovery/controller/recovery_page_controller.dart';
import 'package:gastos_app/src/modules/authentication/recovery/recovery_password_page_code.dart';
import 'package:gastos_app/src/modules/authentication/recovery/recovery_password_page_email.dart';
import 'package:gastos_app/src/modules/authentication/recovery/recovery_password_page_new_password.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  final recoveryPageController = RecoveryPageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<RecoveryPages>(
          valueListenable: recoveryPageController.currentPageNotifier,
          builder: (context, currentPage, _) {
            switch (currentPage) {
              case RecoveryPages.email:
                return RecoveryPasswordPageEmail(
                  recoveryPageController: recoveryPageController,
                );
              case RecoveryPages.code:
                return RecoveryPasswordPageCode(
                  recoveryPageController: recoveryPageController,
                );
              case RecoveryPages.newPassword:
                return RecoveryPasswordPageNewPassword(
                  recoveryPageController: recoveryPageController,
                );
            }
          },
        ),
      ),
    );
  }
}
