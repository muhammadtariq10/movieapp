import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/tabs/search/data/data_source/searched_movie_api_data_source.dart';
import 'package:movieapp/tabs/search/data/repo/movie_repo.dart';
import 'package:movieapp/tabs/search/view_model/search_state.dart';

class SearchViewModel extends Cubit<SearchState> {
  late MovieRepo repo;
  SearchViewModel() : super(SearchInitial()) {
    repo = MovieRepo(dataSource: SearchedMovieAPIDataSource());
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
