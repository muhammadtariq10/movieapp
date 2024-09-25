

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/models/search_response/view_model/search_state.dart';

import '../data/data_source/searched_movie_api_data_source.dart';
import '../data/repo/movie_repo.dart';

class SearchViewModel extends Cubit<SearchState> {
  late MovieRepo repo;
  SearchViewModel() : super(SearchInitial()) {
    repo = MovieRepo(dataSource: SearchedMovieApiDataSource());
  }
  Future<void> getSearchedMovies(String query) async {
    emit(GetMoviesLoading());
    try {
      final moviesList = await repo.getMovies(query);
      emit(GetMoviesSuccsess(movies: moviesList));
    } catch (error) {
      emit(GetMoviesError(errorMessage: error.toString()));
    }
  }
}
