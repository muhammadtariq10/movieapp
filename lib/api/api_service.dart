import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/model/movie_responce/movie_responce.dart';
import 'package:movieapp/model/similar/similar_responce.dart';
import 'package:movieapp/models/MoviesResponse.dart';

import '../models/TypeOfMoviesResponse.dart';
import 'api_constants.dart';

class APIService {
  static Future<MoviesResponse> getSources() async {
    final uri = Uri.https(APIConstants.baseURL, APIConstants.moviesEndPoint, {
      'language': 'en',
    });

    final response = await http.get(uri, headers: {
      'Authorization': APIConstants.authorization,
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return MoviesResponse.fromJson(json);
    } else {
      throw Exception('Failed to load genres');
    }
  }

  static Future<TypeOfMoviesResponse> getSourcesOfMovies(int genreId) async {
    final uri =
        Uri.https(APIConstants.baseURL, APIConstants.moviesDetailsEndPoint, {
      'language': 'en',
      'with_genres': genreId.toString(),
    });

    final response = await http.get(uri, headers: {
      'Authorization': APIConstants.authorization,
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return TypeOfMoviesResponse.fromJson(json);
    } else {
      throw Exception('Failed to load genres');
    }
  }

  static Future<MovieResponceDetails> getMovieDetailsRespons(
      int movieId) async {
    final url = Uri.https('api.themoviedb.org', '/3/movie/$movieId', {
      'language': 'en-US',
    });
    final response = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZGM5YWQ2ZmE2ZjBmODRkZTIzMjA1NDlhZjcwMzFkYiIsIm5iZiI6MTcyNzAyNjg0Ni43ODYwNjMsInN1YiI6IjY2ZTZkYjU2ZTgyMTFlY2QyMmIwODdhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QzHkJGfcsOfU0v0Yua16qabtCZTI-kKEQwCyeZw_29g',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return MovieResponceDetails.fromJson(json);
    } else {
      throw Exception('Failed to load genres');
    }
  }

  static Future<SimilarResponce> geSimilar(int movieId) async {
    final url = Uri.https('api.themoviedb.org', '/3/movie/$movieId/similar', {
      'language': 'en-US',
    });
    final response = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZGM5YWQ2ZmE2ZjBmODRkZTIzMjA1NDlhZjcwMzFkYiIsIm5iZiI6MTcyNzAyNjg0Ni43ODYwNjMsInN1YiI6IjY2ZTZkYjU2ZTgyMTFlY2QyMmIwODdhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QzHkJGfcsOfU0v0Yua16qabtCZTI-kKEQwCyeZw_29g',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return SimilarResponce.fromJson(json);
    } else {
      throw Exception('Failed to load genres');
    }
  }

  static Future<Map<String, dynamic>> fetchMovies() async {
    final popularUri =
        Uri.https(APIConstants.baseURL, APIConstants.moviesEndPoint, {
      'api_key': APIConstants.apiKey,
      'language': APIConstants.language,
    });

    final upcomingUri =
        Uri.https(APIConstants.baseURL, APIConstants.upcomingEndPoint, {
      'api_key': APIConstants.apiKey,
      'language': APIConstants.language,
    });

    final popularResponse = await http.get(popularUri, headers: {
      'Authorization': APIConstants.authorization,
      'Accept': 'application/json',
    });

    final upcomingResponse = await http.get(upcomingUri, headers: {
      'Authorization': APIConstants.authorization,
      'Accept': 'application/json',
    });

    if (popularResponse.statusCode == 200 &&
        upcomingResponse.statusCode == 200) {
      return {
        'popular': jsonDecode(popularResponse.body)['results'],
        'upcoming': jsonDecode(upcomingResponse.body)['results'],
      };
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
