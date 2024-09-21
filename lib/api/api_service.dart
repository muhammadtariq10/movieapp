import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/models/MoviesResponse.dart';

import 'api_constants.dart';

class APIService {
  static Future<MoviesResponse> getSources() async {
    final uri = Uri.https(APIConstants.baseURL, APIConstants.moviesEndPoint, {
      'language': 'en',
    });

    final response = await http.get(uri, headers: {
      'Authorization': APIConstants.Authorization,
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return MoviesResponse.fromJson(json);
    } else {
      throw Exception('Failed to load genres');
    }
  }
}
