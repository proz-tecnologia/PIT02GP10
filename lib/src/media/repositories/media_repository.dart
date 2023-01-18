import 'dart:io';

import 'package:gastos_app/src/media/models/media_file_upload_response.dart';

class MediaRepository {
  Future<MediaFileUploadResponse> uploadFile({required File file}) async {
    // implement file upload with firebase storage

    return MediaFileUploadResponse(statusCode: 200, url: "");

    // final uri = getUri('/media');
    // final request = http.MultipartRequest('POST', uri);

    // //add token to request
    // request.headers["Authorization"] =
    //     "Bearer ${await authController.getToken()}";

    // request.files.add(
    //   await http.MultipartFile.fromPath(
    //     'file',
    //     file.path,
    //   ),
    // );

    // try {
    //   final streamResponse = await request.send();

    //   final response = (await http.Response.fromStream(streamResponse));

    //   final body = jsonDecode(response.body);

    //   return FileUploadResponse(
    //     statusCode: response.statusCode,
    //     url: body['url'],
    //   );
    // } catch (e) {
    //   throw Exception('Failed to upload File');
    // }
  }
}
