import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gastos_app/src/shared/components/picture_pick_box/models/media_file.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PictureController extends ChangeNotifier {
  final picture = MediaFile();

  final changePictureNotifier = ValueNotifier<bool>(true);

  PictureController({required String? photoUrl}) {
    if (photoUrl != null) {
      picture.uploadUrl = photoUrl;
    }
    changePictureNotifier.value = false;
  }

  final picker = ImagePicker();
  final cropper = ImageCropper();

  Future<File?> pickImage({
    required ImageSource source,
    Future<void> Function(File file)? onPictureUpload,
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
        log("size : ${size / 1000000.0}mb");

        if (size < 50000000) {
          picture.photo = croppedFile;
          if (onPictureUpload != null) await onPictureUpload(croppedFile);

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
