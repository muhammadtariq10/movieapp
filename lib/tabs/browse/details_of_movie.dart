import 'package:flutter/material.dart';
import 'package:movieapp/app_theme.dart';

import '../../api/api_service.dart';

import '../../models/browse_response/TypeOfMoviesResponse.dart';
import '../../widgets/error _indicator.dart';
import '../../widgets/loading_indicator.dart';

class DetailsOfMovie extends StatelessWidget {
  final String movieName;
  final int genreId;

  const DetailsOfMovie({super.key, required this.movieName, required this.genreId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<TypeOfMoviesResponse>(
        future: APIService.getSourcesOfMovies(genreId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError) {
            return const ErrorIndicator();
          } else if (snapshot.hasData) {
            final categories = snapshot.data!.results ?? [];
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${categories[index].posterPath}',
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categories[index].title ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontSize: 16),
                                ),
                                Text(
                                  categories[index].releaseDate ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  categories[index].overview ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        color: AppTheme.graySecond,
                        width: double.infinity,
                        padding: EdgeInsets.all(2),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
