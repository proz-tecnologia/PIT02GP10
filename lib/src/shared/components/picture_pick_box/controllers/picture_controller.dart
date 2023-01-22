import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PictureController extends ChangeNotifier {
  final changePictureNotifier = ValueNotifier<bool>(false);

  String? pictureUrl;

  PictureController(
    this.pictureUrl,
  );

  final picker = ImagePicker();
  final cropper = ImageCropper();

  Future<File?> pickImage({
    required ImageSource source,
    Future<String?> Function(File file)? onPictureUpload,
  }) async {
    changePictureNotifier.value = true;

    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final cropped = await cropper.cropImage(
        sourcePath: pickedFile.path,
      );
      if (cropped != null) {
        final croppedFile = File(cropped.path);

        final size = await croppedFile.length();

        if (size < 50000000) {
          if (onPictureUpload != null) {
            final url = await onPictureUpload(croppedFile);
            if (url != null) pictureUrl = url;
          }

          changePictureNotifier.value = false;
          return croppedFile;
        } else {
          AppNotifications.errorNotificationBanner('Arquivo muito grande');
        }
      }
    }
    changePictureNotifier.value = false;
    return null;
  }
}
