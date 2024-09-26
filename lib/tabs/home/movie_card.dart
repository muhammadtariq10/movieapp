import 'package:flutter/material.dart';
import 'package:movieapp/api/api_service.dart';
import 'package:movieapp/app_theme.dart';
import 'package:movieapp/widgets/error%20_indicator.dart';
import 'package:movieapp/widgets/loading_indicator.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({
    super.key,
    required this.movieId,
  });
  final int movieId;
  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.geSimilar(widget.movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError) {
          return const ErrorIndicator();
        } else {
          final similar = snapshot.data;
          return Container(
            color: AppTheme.graySecond,
            height: MediaQuery.of(context).size.height * 0.38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similar?.results?.length,
              itemBuilder: (_, index) => Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: 150,
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xFF343534),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 250,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500/${similar?.results?[index].posterPath}' ??
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s',
                            height: MediaQuery.of(context).size.height * 0.16,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppTheme.gold,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      similar?.results?[index].popularity
                                              .toString() ??
                                          'No Rity',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  similar?.results?[index].title ?? 'No Title',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: AppTheme.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  similar?.results?[index].releaseDate ??
                                      'No Date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
