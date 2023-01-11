import 'package:flutter/material.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  // final recoveryPageController = Modular.get<RecoveryPageController>();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          // body: ValueListenableBuilder<RecoveryPages>(
          //   valueListenable: recoveryPageController.currentPageNotifier,
          //   builder: (context, currentPage, _) {
          //     switch (currentPage) {
          //       case RecoveryPages.email:
          //         return RecoveryPasswordPageEmail(
          //           recoveryPageController: recoveryPageController,
          //         );
          //       case RecoveryPages.code:
          //         return RecoveryPasswordPageCode(
          //           recoveryPageController: recoveryPageController,
          //         );
          //       case RecoveryPages.newPassword:
          //         return RecoveryPasswordPageNewPassword(
          //           recoveryPageController: recoveryPageController,
          //         );
          //     }
          //   },
          // ),
          ),
    );
  }
}
