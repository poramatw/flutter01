import 'package:http/http.dart' as http;
import 'dart:convert';
Future<List<dynamic>> fetchDataAPI() async {
    final url = Uri.https('api.slingacademy.com', 'v1/sample-data/photos');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        return jsonData['photos'];
      } else {
        throw Exception('Failed to fetch images: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch images: $e');
    }
  }



class Photo {
  String url;
  int user;
  String title;
  int id;
  String description;

  Photo({
    required this.url,
    required this.user,
    required this.title,
    required this.id,
    required this.description,
  });
}
