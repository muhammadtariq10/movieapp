
import '../data/models/movie.dart';

class SearchState {}

class SearchInitial extends SearchState {}

class GetMoviesLoading extends SearchState {}

class GetMoviesSuccsess extends SearchState {
  final List<Movie> movies;

  GetMoviesSuccsess({required this.movies});
}

class GetMoviesError extends SearchState {
  final String errorMessage;

  GetMoviesError({required this.errorMessage});
}
