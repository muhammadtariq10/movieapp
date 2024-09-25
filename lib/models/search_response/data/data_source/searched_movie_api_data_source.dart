import 'dart:convert';

import '../../../../api/api_constants.dart';
import '../models/movie.dart';
import '../models/movie_response.dart';
import 'movies_data_source.dart';
import 'package:http/http.dart' as http;


class SearchedMovieAPIDataSource extends MoviesDataSource {
  @override
  Future<List<Movie>> getMovies(String attr) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.moviesSearchEndPoint,
      {
        'query': attr,
      },
    );
    final response = await http.get(uri, headers: {
      'Authorization': APIConstants.Authorization,
    });
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final moviesResponse = MovieResponse.fromJson(json);
      return moviesResponse.results;
    } else {
      throw Exception('Failed to load Movies');
    }
  }
}
