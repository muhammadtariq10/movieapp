import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/shared/app_theme.dart';
import 'package:movieapp/shared/widgets/error_indicator.dart';
import 'package:movieapp/shared/widgets/loading_indicator.dart';
import 'package:movieapp/tabs/search/view/widgets/movie_item_search.dart';
import 'package:movieapp/tabs/search/view_model/search_state.dart';
import 'package:movieapp/tabs/search/view_model/search_view_model.dart';

class SearchMoviesList extends StatefulWidget {
  const SearchMoviesList({super.key, required this.query});
  final String query;
  @override
  State<SearchMoviesList> createState() => _SearchMoviesListState();
}

class _SearchMoviesListState extends State<SearchMoviesList> {
  final viewModel = SearchViewModel();
  @override
  Widget build(BuildContext context) {
    if (widget.query.isNotEmpty) {
      viewModel.getSearchedMovies(widget.query);
    }
    return BlocProvider(
      create: (_) => viewModel,
      child: widget.query.isEmpty
          ? SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Icon material-local-movies.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'No movies found',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppTheme.white.withOpacity(.6),
                        ),
                  )
                ],
              ),
            )
          : BlocBuilder<SearchViewModel, SearchState>(
              builder: (_, state) {
                if (state is GetMoviesLoading) {
                  return const LoadingIndicator();
                } else if (state is GetMoviesError) {
                  return ErrorIndicator(
                    errorMessage: state.errorMessage,
                  );
                } else if (state is GetMoviesSuccsess) {
                  return ListView.builder(
                    itemBuilder: (_, index) => MovieItemSearch(
                      movie: state.movies[index],
                    ),
                    itemCount: state.movies.length,
                  );  
                } else {
                  return const SizedBox();
                }
              },
            ),
    );
  }
}
