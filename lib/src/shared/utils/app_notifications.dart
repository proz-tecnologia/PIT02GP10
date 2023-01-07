import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/models/app_error_model.dart';
import 'package:overlay_support/overlay_support.dart';

class AppNotifications {
  static void simpleNotificationBanner({
    required final String message,
    Duration? duration,
  }) {
    showSimpleNotification(
      Text(message),
      background: AppColors.primaryColor,
      duration: duration,
    );
  }

  static void errorNotificationBanner(
    final Object object, {
    String? errorType,
    String? statusCode,
  }) {
    String message = object.toString();
    if (object.runtimeType == AppErrorModel) {
      final apiError = object as AppErrorModel;
      message = apiError.message;
      errorType = "App Error";
      statusCode = apiError.statusCode.toString();
    }

    showSimpleNotification(
      Text(message),
      background: AppColors.errorColor,
      elevation: 2.5,
      foreground: AppColors.fontColor,
      subtitle: statusCode != null ? Text("code: $statusCode") : null,
      leading: errorType != null
          ? SizedBox(
              width: 55,
              child: Text(
                errorType,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            )
          : null,
    );
  }
}
