import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class MediaRepository {
  final storage = FirebaseStorage.instance;
  Future<String> uploadFile({required File file}) async {
    log('ta chamando');
    final storageRef = FirebaseStorage.instance.ref();
    final fileNameRef = "avatar-${DateTime.now().millisecondsSinceEpoch}.jpg";

    final mountainsRef = storageRef.child(fileNameRef);

    final mountainImagesRef = storageRef.child("images/$fileNameRef");

    assert(mountainsRef.name == mountainImagesRef.name);
    assert(mountainsRef.fullPath != mountainImagesRef.fullPath);

    try {
      await mountainsRef.putFile(
        file,
        SettableMetadata(
          contentType: "image/jpeg",
        ),
      );
      final url = await mountainsRef.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }
}
