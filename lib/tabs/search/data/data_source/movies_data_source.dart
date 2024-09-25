import 'package:movieapp/tabs/search/data/models/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getMovies(String attr);
}
