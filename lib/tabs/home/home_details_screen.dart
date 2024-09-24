import 'package:flutter/material.dart';
import 'package:movieapp/api/api_service.dart';
import 'package:movieapp/app_theme.dart';
import 'package:movieapp/model/movie_responce/movie_responce.dart';
import 'package:movieapp/tabs/home/movie_card.dart';
import 'package:movieapp/widgets/error%20_indicator.dart';
import 'package:movieapp/widgets/loading_indicator.dart';

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
        title: const Text("Movies"),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: APIService.getMovieDetailsRespons(movieId!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingIndicator();
              } else if (snapshot.hasError) {
                return const ErrorIndicator();
              } else {
                final movies = snapshot.data;
                return Column(
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500/${movies?.backdropPath}' ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s',
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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Image.network(
                                'https://image.tmdb.org/t/p/w500/${movies?.posterPath}' ??
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s',
                                fit: BoxFit.fill,
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ActionChip(
                                      backgroundColor: AppTheme.black,
                                      label: Text(
                                        movies?.belongsToCollection?.name ?? '',
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
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      formatText(
                                          movies?.overview ??
                                              'Overview not available.',
                                          35), // 50 حرف في كل سطر

                                      // movies?.overview ?? 'Overview not available.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: AppTheme.gold,
                                        ),
                                        Text(
                                          movies?.voteAverage.toString() ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ],
                                    )
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
              }
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
