import 'package:flutter/material.dart';
import 'package:movieapp/api/api_service.dart';
import 'package:movieapp/app_theme.dart';
import 'package:movieapp/tabs/home/movie_card.dart';
import 'package:movieapp/widgets/loading_indicator.dart';

import '../../widgets/error _indicator.dart';

class HomeDetailsScreen extends StatefulWidget {
  const HomeDetailsScreen({super.key});
  static const String routName = 'detailsScreen';

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  int? movieId;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is int) {
      movieId = args;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.white,
          ),
        ),
        title: const Text("Movies"),
      ),
      body: movieId == null
          ? const Center(child: Text("Invalid movie ID"))
          : ListView(
        children: [
          FutureBuilder(
            future: APIService.getMovieDetailsRespons(movieId!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingIndicator();
              } else if (snapshot.hasError) {
                return const ErrorIndicator();
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Center(
                    child: Text("No movie details available."));
              }

              final movies = snapshot.data;
              return Column(
                children: [
                  Image.network(
                    movies?.backdropPath != null
                        ? 'https://image.tmdb.org/t/p/w500/${movies?.backdropPath}'
                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s',
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movies?.originalTitle ?? 'No Title',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          movies?.releaseDate ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Image.network(
                              movies?.posterPath != null
                                  ? 'https://image.tmdb.org/t/p/w500/${movies?.posterPath}'
                                  : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s',
                              fit: BoxFit.fill,
                              height:
                              MediaQuery.of(context).size.height *
                                  0.22,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  ActionChip(
                                    backgroundColor: AppTheme.black,
                                    label: Text(
                                      movies?.belongsToCollection?.name ??
                                          'No Collection',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.white,
                                      ),
                                    ),
                                    onPressed: () {},
                                    side: const BorderSide(
                                      width: 2,
                                      color: AppTheme.gold,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    formatText(
                                        movies?.overview ??
                                            'Overview not available.',
                                        30),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall,
                                  ),
                                  const SizedBox(height: 18),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppTheme.gold,
                                      ),
                                      Text(
                                        movies?.voteAverage
                                            .toString() ??
                                            'N/A',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MovieCard(
                    movieId: movieId!,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  String formatText(String text, int maxCharsPerLine) {
    List<String> lines = [];
    for (int i = 0; i < text.length; i += maxCharsPerLine) {
      lines.add(text.substring(
          i,
          i + maxCharsPerLine > text.length
              ? text.length
              : i + maxCharsPerLine));
    }
    return lines.join('\n');
  }
}
