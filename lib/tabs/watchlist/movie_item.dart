import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../category/category_model_movie_details.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.categories});

  final CategoryModelMovieDetails categories;

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
                  categories.image,
                  width: 140,
                  height: 89,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 140,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categories.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 15,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      categories.year,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppTheme.white.withOpacity(.5),
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      categories.actors,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppTheme.white.withOpacity(.5),
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
