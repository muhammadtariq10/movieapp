import 'package:flutter/material.dart';

import '../../../../app_theme.dart';
import '../../../../models/search_response/data/models/movie.dart';

class MovieItemSearch extends StatelessWidget {
  const MovieItemSearch({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: Image.network(
                    movie.posterPath != null
                        ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                        : 'https://via.placeholder.com/100x150.png?text=No+Image',
                    width: 100, // Adjusted width
                    height: 150, // Adjusted height
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 10),
              Expanded(
                // Ensures text does not overflow
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.ellipsis, // Prevents overflow
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movie.releaseDate,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.white.withOpacity(.6),
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.white.withOpacity(.6),
                          ),
                      overflow: TextOverflow.ellipsis, // Prevents overflow
                      maxLines: 3, // Limits the number of lines
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          const Divider(),
        ],
      ),
    );
  }
}
