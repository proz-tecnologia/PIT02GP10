import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gastos_app/src/media/models/media_file.dart';
import 'package:gastos_app/src/media/repositories/media_repository.dart';
import 'package:gastos_app/src/media/utils/media_utils.dart';
import 'package:gastos_app/src/shared/utils/app_notifications.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PictureController extends ChangeNotifier {
  MediaFile picture = MediaFile();
  final mediaRepository = MediaRepository();

  final changePictureNotifier = ValueNotifier<bool>(true);

  PictureController() {
    // if (patient.picture != null) {
    //   picture = MediaFile(uploadUrl: patient.picture);
    // }
    changePictureNotifier.value = false;
  }

  void togglePicture(BuildContext context) {
    MediaUtils.openMediaSelectModal(
      context: context,
      onTakePicture: () {
        pickImage(source: ImageSource.camera, context: context);
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
      onChooseFromGallery: () {
        pickImage(source: ImageSource.gallery, context: context);
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
      onRemovePicture: () {
        removePicture();
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
    );
  }

  final picker = ImagePicker();
  final cropper = ImageCropper();
  // final mediaService = MediaService();

  Future<void> pickImage({
    required ImageSource source,
    required BuildContext context,
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
          picture = MediaFile(photo: croppedFile);

          final response = await uploadPicture(picture);

          if (response != null) {
            await updateProfilePicture(response);
          }
        } else {
          AppNotifications.errorNotificationBanner('Arquivo muito grande');
        }
      }
    }
    changePictureNotifier.value = false;
  }

  Future updateProfilePicture(String pictureUrl) async {
    // change picture in user auth
    // change picture in user firestore
  }

  Future<String?> uploadPicture(MediaFile media) async {
    try {
      final response = await mediaRepository.uploadFile(file: media.photo!);
      if (response.statusCode == 200) {
        return response.url;
      }
    } catch (e) {
      AppNotifications.errorNotificationBanner(e);
    }
    return null;
  }

  Future removePicture() async {
    changePictureNotifier.value = true;
    //Remove picture from user auth
    //Remove picture from user firestore
    changePictureNotifier.value = false;
  }
}
