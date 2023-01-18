import 'dart:convert';

class MediaFileUploadResponse {
  final String? url;
  final int statusCode;
  MediaFileUploadResponse({
    this.url,
    required this.statusCode,
  });

  @override
  String toString() =>
      'MediaFileUploadResponse(url: $url, statusCode: $statusCode)';

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'statusCode': statusCode,
    };
  }

  factory MediaFileUploadResponse.fromMap(Map<String, dynamic> map) {
    return MediaFileUploadResponse(
      url: map['url'],
      statusCode: map['statusCode']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaFileUploadResponse.fromJson(String source) =>
      MediaFileUploadResponse.fromMap(json.decode(source));
}
