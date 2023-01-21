import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class MediaRepository {
  final storage = FirebaseStorage.instance;
  Future<String> uploadFile({required File file}) async {
    final storageRef = FirebaseStorage.instance.ref();
    final fileNameRef = "avatar-${DateTime.now().millisecondsSinceEpoch}.jpg";

    final uploadRef = storageRef.child(fileNameRef);

    final uploadImagesRef = storageRef.child("images/$fileNameRef");

    assert(uploadRef.name == uploadImagesRef.name);
    assert(uploadRef.fullPath != uploadImagesRef.fullPath);

    try {
      await uploadRef.putFile(
        file,
        SettableMetadata(
          contentType: "image/jpeg",
        ),
      );
      final url = await uploadRef.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }
}
