import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<FetchImage>> fetchImageFromApi() async {
  final response =
      await http.get(Uri.http('jsonplaceholder.typicode.com', '/photos'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final images = fetchImageFromJson(jsonData as List<dynamic>);

    return images;
  } else {
    throw Exception('Failed to fetch images');
  }
}

List<FetchImage> fetchImageFromJson(List<dynamic> jsonData) {
  return jsonData.map((imageJson) => FetchImage.fromJson(imageJson)).toList();
}


class FetchImage {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  FetchImage({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory FetchImage.fromJson(Map<String, dynamic> json) => FetchImage(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
