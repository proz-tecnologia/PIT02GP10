import 'package:flutter/material.dart';

class RecoveryPageController {
  final currentPageNotifier = ValueNotifier<RecoveryPages>(RecoveryPages.email);

  RecoveryPages get currentPage => currentPageNotifier.value;
  set currentPage(RecoveryPages page) => currentPageNotifier.value = page;
}

enum RecoveryPages {
  email,
  code,
  newPassword,
}
