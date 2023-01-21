import 'dart:io';

class MediaFile {
  File? photo;
  String? uploadUrl;
  MediaFile({
    this.photo,
    this.uploadUrl,
  });

  MediaFile copyWith({
    File? photo,
    String? uploadUrl,
  }) {
    return MediaFile(
      photo: photo ?? this.photo,
      uploadUrl: uploadUrl ?? this.uploadUrl,
    );
  }

  @override
  String toString() => 'MediaFile(photo: $photo, uploadUrl: $uploadUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MediaFile &&
        other.photo == photo &&
        other.uploadUrl == uploadUrl;
  }

  @override
  int get hashCode => photo.hashCode ^ uploadUrl.hashCode;
}
