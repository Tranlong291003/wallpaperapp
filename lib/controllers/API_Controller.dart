import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper/models/photo.dart';

class PexelsApi {
  static const String _apiKey =
      'cxrjV1743lVcIRv9AZPxsqYQbEFcXRQhrrCIxkQnKlEOQbsOoZswxVal'; // Thay bằng API Key của bạn
  static const String _baseUrl =
      'https://api.pexels.com/v1/curated?per_page=100000000';

  Future<List<Photo>> fetchCuratedPhotos() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'Authorization': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Photo> photos = [];

      for (var photoJson in data['photos']) {
        Photo photo = Photo.fromJson(photoJson);
        photos.add(photo);
      }

      return photos;
    } else {
      print('Failed to load photos');
      return [];
    }
  }
}
