import 'dart:convert';

import 'package:movieapp/shared/api_consants.dart';
import 'package:movieapp/tabs/search/data/data_source/movies_data_source.dart';
import 'package:movieapp/tabs/search/data/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/tabs/search/data/models/movie_response.dart';

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
      'Authorization': APIConstants.authorization,
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
